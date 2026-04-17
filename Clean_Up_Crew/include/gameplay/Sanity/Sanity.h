/**
 * @brief Sanity system for the player character.
 *
 * @details Sanity represents the player's mental state (0-100, starts at 100).
 *          It decays over time, faster in dark rooms, and drops sharply on
 *          ghost contact. It recovers slowly when in a lit room.
 *
 *          Fear levels based on current sanity:
 *            >75 = CALM     (no effects)
 *            51-75 = UNEASY (ghost roam radius expands slightly — future)
 *            26-50 = SCARED (ghost hunts faster)
 *            0-25  = TERRIFIED (ghost hunts at max speed)
 *
 *          Sanity reaching 0 triggers GAME_LOSE.
 */

#ifndef SANITY_H
#define SANITY_H

#include <stdint.h>

/***************************************
 * Constants
 **************************************/
#define SANITY_MAX               100
#define SANITY_DECAY_INTERVAL     60   /* base drain: 1 point per ~1 second */
#define SANITY_DARK_EXTRA         30   /* extra timer divisor when in dark (2x rate) */
#define SANITY_GHOST_DRAIN         5   /* immediate drain per frame of ghost contact */
#define SANITY_RECOVER_INTERVAL  120   /* 1 point recovery per ~2 seconds in lit room */

#define SANITY_FEAR_HIGH          75   /* above this = calm */
#define SANITY_FEAR_MID           50   /* above this = uneasy */
#define SANITY_FEAR_LOW           25   /* above this = scared; at/below = terrified */

/***************************************
 * State
 **************************************/
extern uint8_t player_sanity;

/***************************************
 * Function Prototypes
 **************************************/

/**
 * @brief Initialize sanity to SANITY_MAX and reset internal timers.
 */
void sanity_init(void);

/**
 * @brief Update sanity each frame.
 *
 * @param in_dark       1 if player is in an unlit room, 0 otherwise.
 * @param ghost_contact 1 if ghost is overlapping player this frame, 0 otherwise.
 */
void sanity_update(uint8_t in_dark, uint8_t ghost_contact);

/**
 * @brief Return current fear level: 0=calm, 1=uneasy, 2=scared, 3=terrified.
 */
uint8_t sanity_get_fear_level(void);

#endif /* SANITY_H */
