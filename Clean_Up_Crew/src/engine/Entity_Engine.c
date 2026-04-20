/**
 * @brief Entity engine implementation.
 *
 * @details Fixed-pool entity management: spawn/despawn, patrol and wander AI,
 *          tile collision, visibility culling, and player-collision testing.
 */

#include "../../include/engine/Entity_Engine.h"
#include <gb/gb.h>

/***************************************
 * Pool
 **************************************/
Entity entity_pool[ENTITY_POOL_SIZE];

/***************************************
 * Internal Helpers
 **************************************/

/* Move entity one step toward (tx, ty). Returns 1 if already at target. */
static uint8_t step_toward(uint8_t* pos, uint8_t target)
{
    if (*pos < target) { *pos += ENTITY_MOVE_SPEED; return 0; }
    if (*pos > target) { *pos -= ENTITY_MOVE_SPEED; return 0; }
    return 1;
}

/* Clamp entity inside map pixel bounds accounting for sprite size. */
static void clamp_to_map(Entity* e, const Map* map)
{
    uint8_t max_x = (map->width  * TILE_SIZE) - META_SPRITE_SIZE;
    uint8_t max_y = (map->height * TILE_SIZE) - META_SPRITE_SIZE;
    if (e->world_x > max_x) e->world_x = max_x;
    if (e->world_y > max_y) e->world_y = max_y;
}

/* Returns 1 if the tile at (world_x, world_y) center is solid. */
static uint8_t tile_is_solid(const Map* map, uint8_t world_x, uint8_t world_y)
{
    uint8_t tile = map_get_tile_collision(map,
        (world_x + META_SPRITE_SIZE / 2) / TILE_SIZE,
        (world_y + META_SPRITE_SIZE / 2) / TILE_SIZE);
    return (tile == TILE_SOLID) ? 1 : 0;
}

/* Patrol AI: step toward current target; swap origin/target on arrival. */
static void update_patrol(Entity* e, const Map* map)
{
    uint8_t new_x = e->world_x;
    uint8_t new_y = e->world_y;

    uint8_t at_x = step_toward(&new_x, e->ai_target_x);
    uint8_t at_y = step_toward(&new_y, e->ai_target_y);

    if (!tile_is_solid(map, new_x, e->world_y)) e->world_x = new_x;
    if (!tile_is_solid(map, e->world_x, new_y)) e->world_y = new_y;

    if (at_x && at_y) {
        /* Arrived — swap origin and target */
        uint8_t tmp;
        tmp = e->ai_origin_x; e->ai_origin_x = e->ai_target_x; e->ai_target_x = tmp;
        tmp = e->ai_origin_y; e->ai_origin_y = e->ai_target_y; e->ai_target_y = tmp;
    }
}

/* Wander AI: move in current direction for ENTITY_WANDER_INTERVAL ticks,
 * then advance to the next cardinal direction (wraps 0→1→2→3→0).
 * Stays within the bounding box stored in ai_origin/ai_target. */
static void update_wander(Entity* e, const Map* map)
{
    uint8_t new_x = e->world_x;
    uint8_t new_y = e->world_y;

    switch (e->ai_dir & 3) {
        case 0: if (new_y > e->ai_origin_y) new_y -= ENTITY_MOVE_SPEED; break; /* up    */
        case 1: if (new_x < e->ai_target_x) new_x += ENTITY_MOVE_SPEED; break; /* right */
        case 2: if (new_y < e->ai_target_y) new_y += ENTITY_MOVE_SPEED; break; /* down  */
        case 3: if (new_x > e->ai_origin_x) new_x -= ENTITY_MOVE_SPEED; break; /* left  */
    }

    if (!tile_is_solid(map, new_x, e->world_y)) e->world_x = new_x;
    if (!tile_is_solid(map, e->world_x, new_y)) e->world_y = new_y;

    if (++e->ai_timer >= ENTITY_WANDER_INTERVAL) {
        e->ai_timer = 0;
        e->ai_dir = (e->ai_dir + 1) & 3;
    }
}

/***************************************
 * Public API
 **************************************/

void entity_pool_init(void)
{
    uint8_t i;
    for (i = 0; i < ENTITY_POOL_SIZE; i++) {
        entity_pool[i].type = ENTITY_NONE;
        /* Hide all 4 OAM slots this entity would use by moving them off-screen. */
        uint8_t base = ENTITY_SPRITE_BASE_META_ID + i * META_SPRITE_TILE_COUNT;
        uint8_t j;
        for (j = 0; j < META_SPRITE_TILE_COUNT; j++) {
            move_sprite(base + j, 0, 0);
        }
    }
}

Entity* entity_spawn(uint8_t type, uint8_t world_x, uint8_t world_y,
                     uint8_t init_tile, uint8_t max_tile, const uint8_t pixels[])
{
    uint8_t i;
    for (i = 0; i < ENTITY_POOL_SIZE; i++) {
        if (entity_pool[i].type == ENTITY_NONE) {
            Entity* e = &entity_pool[i];
            e->type      = type;
            e->ai_state  = AI_IDLE;
            e->world_x   = world_x;
            e->world_y   = world_y;
            e->ai_origin_x = world_x;
            e->ai_origin_y = world_y;
            e->ai_target_x = world_x;
            e->ai_target_y = world_y;
            e->ai_timer  = 0;
            e->ai_dir    = 0;

            uint8_t meta_id = ENTITY_SPRITE_BASE_META_ID + i * META_SPRITE_TILE_COUNT;
            init_16x16_meta(&e->sprite, meta_id, init_tile, max_tile, 0, world_x, world_y);

            if (pixels) {
                setup_16x16_meta(&e->sprite, pixels);
            }

            return e;
        }
    }
    return 0; /* Pool full */
}

void entity_despawn(Entity* entity)
{
    hide_16x16_meta(&entity->sprite);
    entity->type = ENTITY_NONE;
}

void entity_set_patrol(Entity* entity,
                       uint8_t origin_x, uint8_t origin_y,
                       uint8_t target_x, uint8_t target_y)
{
    entity->ai_state    = AI_PATROL;
    entity->ai_origin_x = origin_x;
    entity->ai_origin_y = origin_y;
    entity->ai_target_x = target_x;
    entity->ai_target_y = target_y;
    entity->world_x     = origin_x;
    entity->world_y     = origin_y;
}

void entity_set_wander(Entity* entity,
                       uint8_t min_x, uint8_t min_y,
                       uint8_t max_x, uint8_t max_y)
{
    entity->ai_state    = AI_WANDER;
    entity->ai_origin_x = min_x;
    entity->ai_origin_y = min_y;
    entity->ai_target_x = max_x;
    entity->ai_target_y = max_y;
    entity->ai_timer    = 0;
    entity->ai_dir      = 0;
}

void entity_update_all(const Camera* camera, const Map* map)
{
    uint8_t i;
    for (i = 0; i < ENTITY_POOL_SIZE; i++) {
        Entity* e = &entity_pool[i];
        if (e->type == ENTITY_NONE)  continue;
        if (e->type == ENTITY_GHOST) continue;  /* managed by ghost_update() */

        /* AI step */
        if (map) {
            if (e->ai_state == AI_PATROL) update_patrol(e, map);
            else if (e->ai_state == AI_WANDER) update_wander(e, map);
        }

        /* Visibility culling: sync screen position only when in view */
        if (entity_is_in_view(camera, e->world_x, e->world_y)) {
            show_16x16_meta(&e->sprite);
            set_16x16_meta_position(&e->sprite,
                e->world_x - camera->x,
                e->world_y - camera->y);
        } else {
            hide_16x16_meta(&e->sprite);
        }
    }
}

uint8_t entity_is_in_view(const Camera* camera, uint8_t world_x, uint8_t world_y)
{
    /* Entity is visible if its origin falls within the camera rectangle
     * (with a one-sprite-size margin so it isn't clipped mid-frame). */
    if (world_x + META_SPRITE_SIZE < camera->x) return 0;
    if (world_x > camera->x + SCREEN_WIDTH_PIXELS)  return 0;
    if (world_y + META_SPRITE_SIZE < camera->y) return 0;
    if (world_y > camera->y + SCREEN_HEIGHT_PIXELS) return 0;
    return 1;
}

uint8_t entity_collides_player(const Entity* entity, uint8_t player_x, uint8_t player_y)
{
    /* Simple AABB in world space — both entity and player are META_SPRITE_SIZE × META_SPRITE_SIZE */
    if (entity->world_x + META_SPRITE_SIZE <= player_x) return 0;
    if (player_x + META_SPRITE_SIZE <= entity->world_x) return 0;
    if (entity->world_y + META_SPRITE_SIZE <= player_y) return 0;
    if (player_y + META_SPRITE_SIZE <= entity->world_y) return 0;
    return 1;
}
