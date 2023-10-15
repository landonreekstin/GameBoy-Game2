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

/***************************************
 * Defines
 * ************************************/
#define PLAYER_SPRITE_ID     0
#define PLAYER_INIT_TILE     0
#define PLAYER_MAX_TILE      4
#define PLAYER_TEXTURE_IDX   0
#define PLAYER_INIT_X        50
#define PLAYER_INIT_Y        50
#define PLAYER_INIT_VELOCITY 1

extern Sprite player_sub_tile0;
extern Sprite player_sub_tile1;
extern Sprite player_sub_tile2;
extern Sprite player_sub_tile3;
extern Sprite* p_player_sub_tile0;
extern Sprite* p_player_sub_tile1;
extern Sprite* p_player_sub_tile2;
extern Sprite* p_player_sub_tile3;
extern MetaSprite16x16 player_sprite;
extern MetaSprite16x16* p_player_sprite;

/* Bank of tiles. */
#define PhasmoPlaceholderBank 0
/* Start of tile array. */
extern UINT8 PhasmoPlaceholder[];

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

void create_player_old(void);

/**
 * @brief Moves the player.
 * 
 * @details Moves the player using the Joypad.
 * 
 * @param void
 * 
 * @return void
 */
inline void move_player(void);


#endif // PLAYER_H