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
#include "Sprite_Engine.h"

/***************************************
 * Defines
 * ************************************/
#define PLAYER_SPRITE_ID    0
#define PLAYER_INIT_TILE    0
#define PLAYER_MAX_TILE     4
#define PLAYER_TEXTURE_IDX  0
#define PLAYER_INIT_X       50
#define PLAYER_INIT_Y       50

MetaSprite16x16 player_sprite;
MetaSprite16x16* p_player_sprite;
p_player_sprite = &player_sprite;
Sprite player_sub_tile0;
Sprite player_sub_tile1;
Sprite player_sub_tile2;
Sprite player_sub_tile3;
Sprite* p_player_sub_tile0 = &player_sub_tile0;
Sprite* p_player_sub_tile1 = &player_sub_tile1;
Sprite* p_player_sub_tile2 = &player_sub_tile2;
Sprite* p_player_sub_tile3 = &player_sub_tile3;

/* Bank of tiles. */
#define PhasmoPlaceholderBank 0
/* Start of tile array. */
extern unsigned char PhasmoPlaceholder[];

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
void setup_player(void);


#endif // PLAYER_H