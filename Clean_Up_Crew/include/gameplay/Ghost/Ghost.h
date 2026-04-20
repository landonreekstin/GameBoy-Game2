/**
 * @brief Ghost entity header.
 *
 * @details The ghost is a special entity managed outside the generic entity
 *          update loop. It has three AI states — idle, roaming, and hunting —
 *          and can be made invisible for scripted sequences.
 *
 *          The ghost occupies one slot in the entity pool (type ENTITY_GHOST).
 *          entity_update_all() skips ENTITY_GHOST slots; ghost_update() handles
 *          all movement, OAM sync, and visibility each frame.
 */

#ifndef GHOST_H
#define GHOST_H

#include "../../engine/Entity_Engine.h"
#include "../../engine/Map_Engine.h"
#include <stdint.h>

/***************************************
 * Ghost AI state constants
 **************************************/
#define GHOST_IDLE    0  /* Stationary near home; transitions to ROAMING after idle ticks */
#define GHOST_ROAMING 1  /* Wanders within home bounding box; hunts if player gets close  */
#define GHOST_HUNTING 2  /* Moves directly toward player; returns to ROAMING on timeout   */

/***************************************
 * Tuning constants
 **************************************/
#define GHOST_IDLE_TICKS        120  /* Frames before IDLE → ROAMING                 */
#define GHOST_HUNT_TICKS        180  /* Max frames hunting before → ROAMING           */
#define GHOST_HUNT_TRIGGER_DIST  32  /* Chebyshev dist (px) that triggers HUNTING     */
#define GHOST_ESCAPE_DIST        64  /* Chebyshev dist (px) that ends HUNTING         */
#define GHOST_ROAM_INTERVAL      40  /* Frames between direction changes while roaming */
#define GHOST_MOVE_SPEED          1  /* Pixels per tick (roam and normal hunt)        */
#define GHOST_HUNT_SPEED_HIGH     2  /* Hunt speed when player sanity <= FEAR_LOW     */
#define GHOST_ROAM_RADIUS        48  /* Half-side of the roam bounding box (px)       */
#define GHOST_ORB_RANGE          24  /* Chebyshev px for passive ghost orb evidence   */

/***************************************
 * Ghost struct
 **************************************/
typedef struct {
    Entity*  entity;       /* Pointer into entity_pool; NULL if not spawned */
    uint8_t  state;        /* GHOST_IDLE / GHOST_ROAMING / GHOST_HUNTING    */
    uint8_t  home_x;       /* Anchor / home position X (world pixels)       */
    uint8_t  home_y;       /* Anchor / home position Y (world pixels)       */
    uint8_t  visible;      /* 1 = sprite drawn; 0 = invisible               */
    uint8_t  state_timer;  /* Ticks spent in current state                  */
} Ghost;

extern Ghost the_ghost;

/***************************************
 * Function Prototypes
 **************************************/

/**
 * @brief Spawn the ghost into the entity pool at the given home position.
 *        Call after entity_pool_init().
 *
 * @param home_x  World X anchor for roaming and idle.
 * @param home_y  World Y anchor for roaming and idle.
 */
void ghost_spawn(uint8_t home_x, uint8_t home_y);

/**
 * @brief Run ghost AI, OAM sync, and player collision check.
 *        Call once per frame from update(), after camera_update().
 *
 * @param camera  Active camera (for screen-space sync and culling).
 * @param map     Active map (for tile collision).
 *
 * @return 1 if the ghost caught the player this frame; 0 otherwise.
 */
uint8_t ghost_update(const Camera* camera, const Map* map);

/**
 * @brief Show or hide the ghost sprite.
 *        Does not affect AI behaviour.
 *
 * @param visible  1 to show, 0 to hide.
 */
void ghost_set_visible(uint8_t visible);

#endif // GHOST_H
