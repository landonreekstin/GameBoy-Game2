/**
 * @brief Game state management: rooms, lights, power, win/lose.
 *
 * @details Tracks which room the player is in based on world position,
 *          which rooms are lit, whether the power is on, and the overall
 *          game state (playing / win / lose).
 *
 *          Room IDs correspond to physical areas of the Haunted House map:
 *            ROOM_ENTRANCE  cols 1-9,  rows 1-8
 *            ROOM_KITCHEN   cols 11-30, rows 1-8
 *            ROOM_HALLWAY   cols 1-30, rows 10-11
 *            ROOM_LIVING    cols 1-14, rows 13-22
 *            ROOM_LIBRARY   cols 16-30, rows 13-22
 *            ROOM_BEDROOM   cols 1-30, rows 24-30
 *
 *          Win: player in ROOM_ENTRANCE with 2+ evidence → J_START escape.
 *          Lose: player_sanity reaches 0.
 */

#ifndef GAMESTATE_H
#define GAMESTATE_H

#include <stdint.h>

/***************************************
 * Room IDs
 **************************************/
#define NUM_ROOMS      6
#define ROOM_ENTRANCE  0
#define ROOM_KITCHEN   1
#define ROOM_HALLWAY   2
#define ROOM_LIVING    3
#define ROOM_LIBRARY   4
#define ROOM_BEDROOM   5

/***************************************
 * Game state values
 **************************************/
#define GAME_PLAYING   0
#define GAME_WIN       1
#define GAME_LOSE      2

/***************************************
 * State
 **************************************/
extern uint8_t room_lights[NUM_ROOMS];   /* 1=lit, 0=dark */
extern uint8_t player_current_room;
extern uint8_t power_on;                 /* 0 when ghost cuts power */
extern uint8_t game_state;              /* GAME_PLAYING / GAME_WIN / GAME_LOSE */

/***************************************
 * Function Prototypes
 **************************************/

/**
 * @brief Initialize room lights and game state.
 *        Entrance/Kitchen/Hallway/Living/Library start lit; Bedroom starts dark.
 */
void gamestate_init(void);

/**
 * @brief Determine which room contains world position (wx, wy).
 *        Returns one of the ROOM_* constants.
 */
uint8_t get_player_room(uint8_t wx, uint8_t wy);

/**
 * @brief Returns 1 if the player's current room is dark (no light + no power).
 */
uint8_t is_player_in_dark(void);

/**
 * @brief Toggle the light state of the player's current room.
 *        Used when the flashlight is activated.
 */
void toggle_flashlight(void);

/**
 * @brief Cut power to all rooms (ghost ability).
 *        Sets all room_lights to 0 and power_on to 0.
 */
void ghost_cut_power(void);

/**
 * @brief Attempt to escape: if player is in ROOM_ENTRANCE and has 2+
 *        evidence pieces, triggers GAME_WIN.
 */
void gamestate_try_escape(void);

/**
 * @brief Set game_state and print result to debug console.
 *        Halts the game loop on win or lose.
 */
void game_set_state(uint8_t state);

#endif /* GAMESTATE_H */
