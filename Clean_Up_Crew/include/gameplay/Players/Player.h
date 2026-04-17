/** 
 * @brief Player header file.
 * 
 * @details Contains all definitions for the player. Only one player meta sprite is made. 
 *          Sprite can be made to be retextured to be different players.
 * 
*/

/***************************************
 * Includes
 * ************************************/
#ifndef PLAYER_H
#define PLAYER_H
#include "../../engine/Sprite_Engine.h"
#include "../../engine/Map_Engine.h"

/***************************************
 * Defines
 * ************************************/
#define PLAYER_SPRITE_ID     0
#define PLAYER_INIT_TILE     0
#define PLAYER_MAX_TILE      8   // 2 animation frames × 4 tiles per frame
#define PLAYER_TEXTURE_IDX   0
#define PLAYER_INIT_X        40   /* Haunted House: tile (5,5) = Entrance */
#define PLAYER_INIT_Y        40
#define PLAYER_INIT_VELOCITY 1
#define PLAYER_DEFAULT_SPEED 2   // Normal movement speed (pixels per tick)
#define PLAYER_WATER_SPEED   1   // Reduced speed on water tiles
#define PLAYER_ANIM_RATE     8   // Game ticks between walk animation frame advances

extern MetaSprite16x16 player_sprite;
extern MetaSprite16x16* p_player_sprite;

// Player world position (where player is in the 256x256 map)
extern uint8_t player_world_x;
extern uint8_t player_world_y;

// Map boundaries for collision detection (set during initialization)
extern uint8_t player_map_width;
extern uint8_t player_map_height;

// Active map for tile collision lookups (set during initialization)
extern const Map* player_map;

// Per-axis movement speed (pixels per tick); set by tile type response to apply slow effects
extern uint8_t player_speed_x;
extern uint8_t player_speed_y;

/* Bank of tiles. */
#define PhasmoPlaceholderBank 0
/* Start of tile array. */
extern uint8_t PhasmoPlaceholder[];

/***************************************
 * Prototypes
 * ************************************/
/**
 * @brief Sets up the test player.
 *
 * @details Sets up the test player.
 *
 * @param void
 *
 * @return void
 */
void create_player(void);

/**
 * @brief Moves the player.
 *
 * @details Moves the player using the Joypad.
 *
 * @return void
 */
inline void move_player(void);


#endif // PLAYER_H