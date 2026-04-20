/**
 * @brief Ghost entity implementation.
 *
 * @details State machine: IDLE → ROAMING → HUNTING → ROAMING.
 *          Movement respects solid tiles; ghost passes through water.
 *          OAM sync and visibility are handled here; entity_update_all()
 *          skips ENTITY_GHOST slots.
 */

#include "../../../include/gameplay/Ghost/Ghost.h"
#include "../../../include/gameplay/Players/Player.h"
#include "../../../include/gameplay/Evidence/Evidence.h"
#include "../../../include/gameplay/GameState/GameState.h"
#include "../../../include/gameplay/Sanity/Sanity.h"

Ghost the_ghost;

/***************************************
 * Internal Helpers
 **************************************/

/* Returns 1 if the 16x16 sprite centered at (x, y) overlaps a solid tile. */
static uint8_t ghost_tile_solid(const Map* map, uint8_t x, uint8_t y)
{
    uint8_t tile = map_get_tile_collision(map,
        (x + META_SPRITE_SIZE / 2) / TILE_SIZE,
        (y + META_SPRITE_SIZE / 2) / TILE_SIZE);
    return (tile == TILE_SOLID) ? 1 : 0;
}

/* Chebyshev distance between two world-space points (max of |dx|, |dy|). */
static uint8_t chebyshev(uint8_t ax, uint8_t ay, uint8_t bx, uint8_t by)
{
    uint8_t dx = (ax > bx) ? ax - bx : bx - ax;
    uint8_t dy = (ay > by) ? ay - by : by - ay;
    return (dx > dy) ? dx : dy;
}

/* Move ghost one step in the current cardinal direction within its home bounding
 * box.  Direction cycles every GHOST_ROAM_INTERVAL ticks. */
static void ghost_step_roam(Ghost* g, const Map* map)
{
    Entity* e    = g->entity;
    uint8_t new_x = e->world_x;
    uint8_t new_y = e->world_y;

    /* Roam box centered on home, clamped to map pixel bounds */
    uint8_t min_x = (g->home_x >= GHOST_ROAM_RADIUS) ? g->home_x - GHOST_ROAM_RADIUS : 0;
    uint8_t min_y = (g->home_y >= GHOST_ROAM_RADIUS) ? g->home_y - GHOST_ROAM_RADIUS : 0;
    uint8_t map_max_x = (uint8_t)((uint16_t)map->width  * TILE_SIZE - META_SPRITE_SIZE);
    uint8_t map_max_y = (uint8_t)((uint16_t)map->height * TILE_SIZE - META_SPRITE_SIZE);
    uint8_t max_x = ((uint16_t)g->home_x + GHOST_ROAM_RADIUS <= map_max_x) ?
                    g->home_x + GHOST_ROAM_RADIUS : map_max_x;
    uint8_t max_y = ((uint16_t)g->home_y + GHOST_ROAM_RADIUS <= map_max_y) ?
                    g->home_y + GHOST_ROAM_RADIUS : map_max_y;

    switch (e->ai_dir & 3) {
        case 0: if (new_y > min_y) new_y -= GHOST_MOVE_SPEED; break;  /* up    */
        case 1: if (new_x < max_x) new_x += GHOST_MOVE_SPEED; break;  /* right */
        case 2: if (new_y < max_y) new_y += GHOST_MOVE_SPEED; break;  /* down  */
        case 3: if (new_x > min_x) new_x -= GHOST_MOVE_SPEED; break;  /* left  */
    }

    if (!ghost_tile_solid(map, new_x, e->world_y)) e->world_x = new_x;
    if (!ghost_tile_solid(map, e->world_x, new_y)) e->world_y = new_y;

    if (++e->ai_timer >= GHOST_ROAM_INTERVAL) {
        e->ai_timer = 0;
        e->ai_dir   = (e->ai_dir + 1) & 3;
    }
}

/* Move ghost one step per axis toward the player, respecting solid tiles.
 * Hunt speed scales with player's fear level (low sanity = faster ghost). */
static void ghost_step_hunt(Ghost* g, const Map* map)
{
    Entity* e    = g->entity;
    uint8_t new_x = e->world_x;
    uint8_t new_y = e->world_y;
    uint8_t speed = (sanity_get_fear_level() >= 2) ? GHOST_HUNT_SPEED_HIGH : GHOST_MOVE_SPEED;

    if      (new_x < player_world_x) new_x += speed;
    else if (new_x > player_world_x) new_x -= speed;

    if      (new_y < player_world_y) new_y += speed;
    else if (new_y > player_world_y) new_y -= speed;

    if (!ghost_tile_solid(map, new_x, e->world_y)) e->world_x = new_x;
    if (!ghost_tile_solid(map, e->world_x, new_y)) e->world_y = new_y;
}

/***************************************
 * Public API
 **************************************/

void ghost_spawn(uint8_t home_x, uint8_t home_y)
{
    the_ghost.state       = GHOST_IDLE;
    the_ghost.home_x      = home_x;
    the_ghost.home_y      = home_y;
    the_ghost.visible     = 1;
    the_ghost.state_timer = 0;
    the_ghost.entity      = entity_spawn(ENTITY_GHOST, home_x, home_y,
                                         0, 4, PhasmoPlaceholder);
}

uint8_t ghost_update(const Camera* camera, const Map* map)
{
    if (!the_ghost.entity) return 0;
    Entity* e = the_ghost.entity;

    /* --- AI state machine --- */
    switch (the_ghost.state) {

        case GHOST_IDLE:
            if (++the_ghost.state_timer >= GHOST_IDLE_TICKS) {
                the_ghost.state       = GHOST_ROAMING;
                the_ghost.state_timer = 0;
                e->ai_dir             = 0;
                e->ai_timer           = 0;
            }
            break;

        case GHOST_ROAMING:
            ghost_step_roam(&the_ghost, map);
            if (chebyshev(e->world_x, e->world_y, player_world_x, player_world_y)
                    <= GHOST_HUNT_TRIGGER_DIST) {
                the_ghost.state       = GHOST_HUNTING;
                the_ghost.state_timer = 0;
            }
            break;

        case GHOST_HUNTING:
            ghost_step_hunt(&the_ghost, map);

            /* Ghost occasionally cuts power when starting a hunt */
            if (the_ghost.state_timer == 0) {
                /* Use entity ai_dir as a pseudo-random seed (changes each hunt) */
                if ((e->ai_dir & 7) == 0) {
                    ghost_cut_power();
                }
            }

            if (++the_ghost.state_timer >= GHOST_HUNT_TICKS ||
                chebyshev(e->world_x, e->world_y, player_world_x, player_world_y)
                    > GHOST_ESCAPE_DIST) {
                the_ghost.state       = GHOST_ROAMING;
                the_ghost.state_timer = 0;
            }
            break;
    }

    /* --- OAM sync and visibility --- */
    if (entity_is_in_view(camera, e->world_x, e->world_y)) {
        set_16x16_meta_position(&e->sprite,
            e->world_x - camera->x,
            e->world_y - camera->y);
        if (the_ghost.visible) show_16x16_meta(&e->sprite);
        else                   hide_16x16_meta(&e->sprite);
    } else {
        hide_16x16_meta(&e->sprite);
    }

    /* --- Ghost Orb: passive evidence when very close --- */
    {
        uint8_t dist = chebyshev(e->world_x, e->world_y, player_world_x, player_world_y);
        if (dist <= GHOST_ORB_RANGE && the_ghost.visible) {
            evidence_collect(EVIDENCE_GHOST_ORB);
        }
    }

    /* --- Player collision (hunting + visible only) --- */
    if (the_ghost.visible && the_ghost.state == GHOST_HUNTING) {
        return entity_collides_player(e, player_world_x, player_world_y);
    }
    return 0;
}

void ghost_set_visible(uint8_t visible)
{
    the_ghost.visible = visible;
}
