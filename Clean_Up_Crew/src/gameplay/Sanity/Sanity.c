/**
 * @brief Sanity system implementation.
 *
 * @details Tick-based decay/recovery. Called once per frame from update().
 *          Ghost contact causes an immediate drain; timers handle the rest.
 */

#include "../../../include/gameplay/Sanity/Sanity.h"

uint8_t player_sanity = SANITY_MAX;

static uint8_t decay_timer   = 0;
static uint8_t recover_timer = 0;

void sanity_init(void)
{
    player_sanity = SANITY_MAX;
    decay_timer   = 0;
    recover_timer = 0;
}

void sanity_update(uint8_t in_dark, uint8_t ghost_contact)
{
    /* Ghost contact: immediate drain, skip normal decay this frame */
    if (ghost_contact) {
        if (player_sanity >= SANITY_GHOST_DRAIN) {
            player_sanity -= SANITY_GHOST_DRAIN;
        } else {
            player_sanity = 0;
        }
        recover_timer = 0;
        return;
    }

    /* Normal decay — twice as fast in dark rooms */
    {
        uint8_t threshold = in_dark ? (SANITY_DECAY_INTERVAL / 2) : SANITY_DECAY_INTERVAL;
        if (++decay_timer >= threshold) {
            decay_timer = 0;
            if (player_sanity > 0) player_sanity--;
        }
    }

    /* Recovery — only in lit rooms, slow rate */
    if (!in_dark) {
        if (++recover_timer >= SANITY_RECOVER_INTERVAL) {
            recover_timer = 0;
            if (player_sanity < SANITY_MAX) player_sanity++;
        }
    } else {
        recover_timer = 0;
    }
}

uint8_t sanity_get_fear_level(void)
{
    if (player_sanity > SANITY_FEAR_HIGH) return 0;  /* calm      */
    if (player_sanity > SANITY_FEAR_MID)  return 1;  /* uneasy    */
    if (player_sanity > SANITY_FEAR_LOW)  return 2;  /* scared    */
    return 3;                                          /* terrified */
}
