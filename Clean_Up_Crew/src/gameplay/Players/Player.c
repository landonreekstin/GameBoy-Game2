/** 
 * @brief Test player implementation.
 * 
 * @details This file is responsible for handling the test player.
*/

/***************************************
 * Includes
 * ************************************/
#include "../../../include/gameplay/Players/Player.h"
#include "../../../include/engine/Sprite_Engine.h"

/***************************************
 * Defines
 * ************************************/
Sprite player_sub_tile0;
Sprite player_sub_tile1;
Sprite player_sub_tile2;
Sprite player_sub_tile3;
Sprite* p_player_sub_tile0 = &player_sub_tile0;
Sprite* p_player_sub_tile1 = &player_sub_tile1;
Sprite* p_player_sub_tile2 = &player_sub_tile2;
Sprite* p_player_sub_tile3 = &player_sub_tile3;
MetaSprite16x16 player_sprite;
MetaSprite16x16* p_player_sprite = &player_sprite;
/* Start of tile array. */
UINT8 PhasmoPlaceholder[] =
{
  0x00,0x1F,0x0E,0x31,0x1F,0x20,0x00,0x3F,
  0x1F,0x23,0x0F,0x33,0x0F,0x10,0x07,0x18,
  0x00,0xF0,0x30,0xC8,0xF0,0x0C,0x00,0xFF,
  0xF8,0x34,0xF8,0x34,0xF8,0x04,0xF0,0x0C,
  0xE0,0x18,0x80,0x70,0x00,0xC0,0x00,0x80,
  0x00,0x80,0x00,0xC0,0x80,0x40,0x00,0xC0,
  0x07,0x08,0x00,0x0F,0x07,0x18,0x0F,0x10,
  0x0F,0x10,0x07,0x18,0x07,0x08,0x00,0x0F
};

/***************************************
 * Functions
 * ************************************/
void create_player(void)
{
  // initialize  meta 16x16 sprite
  
  set_16x16_meta_position(p_player_sprite, PLAYER_INIT_X, PLAYER_INIT_Y);
  set_16x16_meta_velocity(p_player_sprite, PLAYER_INIT_VELOCITY);
  set_16x16_meta_visibility(p_player_sprite, 1);
  set_16x16_meta_hitbox(p_player_sprite, 1);

  init_16x16_meta(p_player_sprite, PLAYER_SPRITE_ID, PLAYER_INIT_TILE, PLAYER_MAX_TILE, PLAYER_TEXTURE_IDX, 
                  p_player_sub_tile0, p_player_sub_tile1, p_player_sub_tile2, p_player_sub_tile3);

  // TODO: separate init function into multiple functions
  // set_sprite_tiles()
  // set_sprite_position()
  // Have sub tiles set inside init function

  setup_16x16_meta(p_player_sprite, PhasmoPlaceholder);  
}

void create_player_old(void)
{
  init_16x16_meta_old(p_player_sprite, 0, 0, 4, 0, 50, 50, p_player_sub_tile0, p_player_sub_tile1, p_player_sub_tile2, p_player_sub_tile3);

  setup_16x16_meta(p_player_sprite, PhasmoPlaceholder);  
}

inline void move_player(void)
{
  translate_16x16_meta(p_player_sprite);
}