/**
 * @brief Entity engine header file.
 *
 * @details Fixed-pool entity system for the Game Boy. Supports up to
 *          ENTITY_POOL_SIZE active entities with optional sprites, visibility
 *          culling, tile collision, player collision, patrol AI, and wander AI.
 *
 *          OAM slot layout:
 *            Slots 0–3   : player (meta_id 0)
 *            Slots 4–7   : entity 0 (meta_id 1)
 *            Slots 8–11  : entity 1 (meta_id 2)
 *            ...and so on
 */

#ifndef ENTITY_ENGINE_H
#define ENTITY_ENGINE_H

#include "Sprite_Engine.h"
#include "Map_Engine.h"
#include <stdint.h>

/***************************************
 * Defines
 **************************************/
#define ENTITY_POOL_SIZE   8   // Maximum simultaneous entities

// Entity type tags — ENTITY_NONE marks an inactive (free) slot
#define ENTITY_NONE   0
#define ENTITY_GHOST  1
#define ENTITY_ITEM   2
#define ENTITY_NPC    3

// AI states
#define AI_IDLE    0
#define AI_PATROL  1
#define AI_WANDER  2

// OAM base meta_id for entities. Player uses meta_id 0 (IDs 0-3).
// Entity N uses meta_id = ENTITY_SPRITE_BASE_META_ID + N*META_SPRITE_TILE_COUNT
// giving IDs 4-7, 8-11, 12-15, ... with no overlap.
#define ENTITY_SPRITE_BASE_META_ID  META_SPRITE_TILE_COUNT  // = 4

// How many pixels per tick an entity moves
#define ENTITY_MOVE_SPEED  1

// Wander AI: ticks between direction changes
#define ENTITY_WANDER_INTERVAL 30

/***************************************
 * Type Definitions
 **************************************/
typedef struct {
    uint8_t type;           // ENTITY_NONE = free slot; otherwise entity type tag
    uint8_t ai_state;       // AI_IDLE, AI_PATROL, AI_WANDER
    uint8_t world_x;        // World position X (pixels)
    uint8_t world_y;        // World position Y (pixels)
    uint8_t ai_origin_x;    // Patrol: A-point X; Wander: bounded-area min X
    uint8_t ai_origin_y;    // Patrol: A-point Y; Wander: bounded-area min Y
    uint8_t ai_target_x;    // Patrol: B-point X; Wander: bounded-area max X
    uint8_t ai_target_y;    // Patrol: B-point Y; Wander: bounded-area max Y
    uint8_t ai_timer;       // General-purpose tick counter for AI
    uint8_t ai_dir;         // Current wander direction (0=up,1=right,2=down,3=left)
    MetaSprite16x16 sprite; // Embedded sprite (43 bytes); hide if no visual needed
} Entity;

/***************************************
 * Extern Pool
 **************************************/
extern Entity entity_pool[ENTITY_POOL_SIZE];

/***************************************
 * Function Prototypes
 **************************************/

/**
 * @brief Clears all entity slots and hides their OAM sprites.
 *        Call once during game initialization before spawning entities.
 */
void entity_pool_init(void);

/**
 * @brief Spawns an entity into the first free pool slot.
 *
 * @param type       Entity type tag (ENTITY_GHOST, ENTITY_ITEM, etc.)
 * @param world_x    Initial world X position
 * @param world_y    Initial world Y position
 * @param init_tile  Starting tile index in sprite VRAM
 * @param max_tile   Total tile count loaded for this sprite
 * @param pixels     Pointer to sprite pixel data; NULL to skip sprite setup
 *
 * @return Pointer to the spawned Entity, or NULL if pool is full.
 */
Entity* entity_spawn(uint8_t type, uint8_t world_x, uint8_t world_y,
                     uint8_t init_tile, uint8_t max_tile, uint8_t pixels[]);

/**
 * @brief Despawns an entity: marks slot free and hides its sprite.
 *
 * @param entity Pointer to the entity to despawn.
 */
void entity_despawn(Entity* entity);

/**
 * @brief Sets an entity to patrol between two world-space points.
 *
 * @param entity    Pointer to the entity.
 * @param origin_x  A-point X
 * @param origin_y  A-point Y
 * @param target_x  B-point X
 * @param target_y  B-point Y
 */
void entity_set_patrol(Entity* entity,
                       uint8_t origin_x, uint8_t origin_y,
                       uint8_t target_x, uint8_t target_y);

/**
 * @brief Sets an entity to wander randomly within a bounding box.
 *
 * @param entity  Pointer to the entity.
 * @param min_x   Bounding box minimum X
 * @param min_y   Bounding box minimum Y
 * @param max_x   Bounding box maximum X
 * @param max_y   Bounding box maximum Y
 */
void entity_set_wander(Entity* entity,
                       uint8_t min_x, uint8_t min_y,
                       uint8_t max_x, uint8_t max_y);

/**
 * @brief Updates all active entities: AI step, tile collision, screen position sync.
 *        Call once per frame from update(), after camera_update().
 *
 * @param camera        Pointer to the active camera (for screen-space sync and culling).
 * @param map           Pointer to the active map (for tile collision).
 */
void entity_update_all(const Camera* camera, const Map* map);

/**
 * @brief Checks whether a world-space point is within camera view.
 *        Used to cull entity updates and sprite syncs.
 *
 * @param camera  Pointer to the active camera.
 * @param world_x World X to test.
 * @param world_y World Y to test.
 *
 * @return 1 if visible, 0 if offscreen.
 */
uint8_t entity_is_in_view(const Camera* camera, uint8_t world_x, uint8_t world_y);

/**
 * @brief Tests AABB overlap between an entity and the player in world space.
 *
 * @param entity      Pointer to the entity.
 * @param player_x    Player world X.
 * @param player_y    Player world Y.
 *
 * @return 1 if overlapping, 0 otherwise.
 */
uint8_t entity_collides_player(const Entity* entity, uint8_t player_x, uint8_t player_y);

#endif // ENTITY_ENGINE_H
