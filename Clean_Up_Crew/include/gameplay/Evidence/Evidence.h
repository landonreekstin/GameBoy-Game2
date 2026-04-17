/**
 * @brief Evidence detection and ghost identification system.
 *
 * @details Evidence is collected as a bitmask. Each bit corresponds to one
 *          type of paranormal reading obtainable with the right equipment.
 *          The ghost has a fixed type assigned at game start; its evidence
 *          bits are the ground truth. Players win by collecting 2+ of those
 *          bits and escaping via the entrance.
 *
 *          Ghost types and their evidence:
 *            GHOST_POLTERGEIST : EMF5 + SPIRIT_BOX
 *            GHOST_BANSHEE     : FREEZING + GHOST_ORB
 *            GHOST_WRAITH      : EMF5 + FREEZING
 *            GHOST_JINN        : SPIRIT_BOX + GHOST_ORB
 */

#ifndef EVIDENCE_H
#define EVIDENCE_H

#include <stdint.h>

/***************************************
 * Evidence type flags (bitmask)
 **************************************/
#define EVIDENCE_EMF5        (1 << 0)  /* EMF reader used near ghost */
#define EVIDENCE_FREEZING    (1 << 1)  /* Thermometer used near ghost */
#define EVIDENCE_SPIRIT_BOX  (1 << 2)  /* Spirit box used near ghost */
#define EVIDENCE_GHOST_ORB   (1 << 3)  /* Passive: very close proximity to ghost */

/***************************************
 * Ghost types
 **************************************/
#define GHOST_UNKNOWN      0
#define GHOST_POLTERGEIST  1   /* EMF5 | SPIRIT_BOX */
#define GHOST_BANSHEE      2   /* FREEZING | GHOST_ORB */
#define GHOST_WRAITH       3   /* EMF5 | FREEZING */
#define GHOST_JINN         4   /* SPIRIT_BOX | GHOST_ORB */

/***************************************
 * Detection ranges (Chebyshev pixels)
 **************************************/
#define EVIDENCE_DETECTION_RANGE  48   /* equipment must be used within this range */
#define GHOST_ORB_RANGE           24   /* passive orb detection range */

/***************************************
 * State
 **************************************/
extern uint8_t evidence_collected;   /* bitmask of confirmed evidence */
extern uint8_t ghost_type;           /* actual ghost type for this session */

/***************************************
 * Function Prototypes
 **************************************/

/**
 * @brief Initialize evidence system with the actual ghost type.
 *        Called once at game start after ghost_type is set.
 */
void evidence_init(uint8_t actual_type);

/**
 * @brief Record an evidence flag as collected (idempotent).
 *        Prints a debug message on first collection.
 */
void evidence_collect(uint8_t flag);

/**
 * @brief Returns 1 if player is within EVIDENCE_DETECTION_RANGE of the ghost.
 *        Uses Chebyshev distance in world space.
 */
uint8_t is_near_ghost(void);

/**
 * @brief Returns the number of evidence bits set in evidence_collected.
 */
uint8_t evidence_count(void);

#endif /* EVIDENCE_H */
