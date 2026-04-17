/**
 * @brief Game state implementation.
 *
 * @details Room detection uses tile-space coordinates (world >> 3 = tile index).
 *          Light state and game over conditions live here.
 */

#include "../../../include/gameplay/GameState/GameState.h"
#include "../../../include/gameplay/Evidence/Evidence.h"
#include "../../../include/engine/Debug.h"

uint8_t room_lights[NUM_ROOMS];
uint8_t player_current_room = ROOM_ENTRANCE;
uint8_t power_on            = 1;
uint8_t game_state          = GAME_PLAYING;

void gamestate_init(void)
{
    /* Entrance, Kitchen, Hallway, Living Room, Library start lit */
    room_lights[ROOM_ENTRANCE] = 1;
    room_lights[ROOM_KITCHEN]  = 1;
    room_lights[ROOM_HALLWAY]  = 1;
    room_lights[ROOM_LIVING]   = 1;
    room_lights[ROOM_LIBRARY]  = 1;
    /* Master Bedroom starts dark — needs flashlight */
    room_lights[ROOM_BEDROOM]  = 0;

    power_on             = 1;
    player_current_room  = ROOM_ENTRANCE;
    game_state           = GAME_PLAYING;
}

uint8_t get_player_room(uint8_t wx, uint8_t wy)
{
    uint8_t tx = wx >> 3;  /* tile X = world_x / 8 */
    uint8_t ty = wy >> 3;  /* tile Y = world_y / 8 */

    /* Top area (rows 1-8) */
    if (ty >= 1 && ty <= 8) {
        if (tx >= 1 && tx <= 9)   return ROOM_ENTRANCE;
        if (tx >= 11 && tx <= 30) return ROOM_KITCHEN;
    }

    /* Hallway (rows 10-11) */
    if (ty >= 10 && ty <= 11) return ROOM_HALLWAY;

    /* Lower rooms (rows 13-22) */
    if (ty >= 13 && ty <= 22) {
        if (tx >= 1 && tx <= 14)  return ROOM_LIVING;
        if (tx >= 16 && tx <= 30) return ROOM_LIBRARY;
    }

    /* Bedroom (rows 24-30) */
    if (ty >= 24 && ty <= 30) return ROOM_BEDROOM;

    return ROOM_ENTRANCE;  /* fallback */
}

uint8_t is_player_in_dark(void)
{
    if (!power_on) return 1;
    return (room_lights[player_current_room] == 0) ? 1 : 0;
}

void toggle_flashlight(void)
{
    if (!power_on) {
        /* Ghost cut the power — flashlight can temporarily light current room */
        room_lights[player_current_room] ^= 1;
    } else {
        room_lights[player_current_room] ^= 1;
    }
    debug_print("Flashlight toggled");
    debug_print_value("Room lit", room_lights[player_current_room]);
}

void ghost_cut_power(void)
{
    uint8_t i;
    for (i = 0; i < NUM_ROOMS; i++) {
        room_lights[i] = 0;
    }
    power_on = 0;
    debug_print("Ghost cut the power!");
}

void gamestate_try_escape(void)
{
    if (player_current_room != ROOM_ENTRANCE) return;
    if (evidence_count() >= 2) {
        game_set_state(GAME_WIN);
    } else {
        debug_print("Need 2 evidence to escape!");
        debug_print_value("Evidence collected", evidence_collected);
    }
}

void game_set_state(uint8_t state)
{
    game_state = state;
    if (state == GAME_WIN) {
        debug_print("=== YOU WIN! ===");
        debug_print("Evidence collected, escaped safely.");
    } else if (state == GAME_LOSE) {
        debug_print("=== GAME OVER ===");
        debug_print("Sanity depleted.");
    }
}
