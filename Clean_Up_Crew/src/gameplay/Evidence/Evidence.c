/**
 * @brief Evidence detection implementation.
 *
 * @details is_near_ghost() uses Chebyshev distance against the ghost entity's
 *          current world position. Ghost.h is included for the_ghost extern.
 */

#include "../../../include/gameplay/Evidence/Evidence.h"
#include "../../../include/gameplay/Ghost/Ghost.h"
#include "../../../include/gameplay/Players/Player.h"
#include "../../../include/engine/Debug.h"

uint8_t evidence_collected = 0;
uint8_t ghost_type         = GHOST_UNKNOWN;

void evidence_init(uint8_t actual_type)
{
    evidence_collected = 0;
    ghost_type         = actual_type;
    debug_print_value("Ghost type this session", ghost_type);
}

void evidence_collect(uint8_t flag)
{
    if (evidence_collected & flag) return;  /* already have this one */
    evidence_collected |= flag;

    if (flag == EVIDENCE_EMF5)       debug_print("EVIDENCE: EMF Level 5!");
    if (flag == EVIDENCE_FREEZING)   debug_print("EVIDENCE: Freezing Temps!");
    if (flag == EVIDENCE_SPIRIT_BOX) debug_print("EVIDENCE: Spirit Box Response!");
    if (flag == EVIDENCE_GHOST_ORB)  debug_print("EVIDENCE: Ghost Orb!");

    debug_print_value("Total evidence bits", evidence_collected);
}

uint8_t is_near_ghost(void)
{
    uint8_t gx, gy, dx, dy, dist;
    if (!the_ghost.entity) return 0;

    gx = the_ghost.entity->world_x;
    gy = the_ghost.entity->world_y;

    dx = (gx > player_world_x) ? gx - player_world_x : player_world_x - gx;
    dy = (gy > player_world_y) ? gy - player_world_y : player_world_y - gy;
    dist = (dx > dy) ? dx : dy;  /* Chebyshev */

    return (dist <= EVIDENCE_DETECTION_RANGE) ? 1 : 0;
}

uint8_t evidence_count(void)
{
    uint8_t n = 0;
    uint8_t b = evidence_collected;
    while (b) { n += (b & 1); b >>= 1; }
    return n;
}
