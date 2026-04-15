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
MetaSprite16x16 player_sprite;
MetaSprite16x16* p_player_sprite = &player_sprite;

// Player world position tracking
uint8_t player_world_x = PLAYER_INIT_X;
uint8_t player_world_y = PLAYER_INIT_Y;

// Map boundaries (set during init_game)
uint8_t player_map_width = 0;
uint8_t player_map_height = 0;

// Player screen position (fixed - player stays centered on screen)
#define PLAYER_SCREEN_X 72  // Centered horizontally (160/2 - 16/2 = 72)
#define PLAYER_SCREEN_Y 64  // Centered vertically (144/2 - 16/2 = 64)

/* Start of tile array. */
uint8_t PhasmoPlaceholder[] =
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
  // Initialize sprite at FIXED SCREEN position (player stays centered)
  init_16x16_meta(p_player_sprite, PLAYER_SPRITE_ID, PLAYER_INIT_TILE, PLAYER_MAX_TILE, PLAYER_TEXTURE_IDX,
                  PLAYER_SCREEN_X, PLAYER_SCREEN_Y);

  // Load sprite graphics and configure hardware
  setup_16x16_meta(p_player_sprite, PhasmoPlaceholder);
}

inline void move_player(void)
{
  // Read joypad input - use fresh reading each frame
  uint8_t input = joypad();

  // Store OLD position for comparison
  uint8_t old_x = player_world_x;
  uint8_t old_y = player_world_y;

  // Calculate new position directly from input (NO velocity accumulation)
  int16_t new_x = (int16_t)player_world_x;
  int16_t new_y = (int16_t)player_world_y;

  // Check each direction independently and update position
  // NOTE: Using separate if statements allows diagonal movement
  if (input & J_LEFT) {
    new_x -= DEFAULT_SCROLL_SPEED;
  }
  if (input & J_RIGHT) {
    new_x += DEFAULT_SCROLL_SPEED;
  }
  if (input & J_UP) {
    new_y -= DEFAULT_SCROLL_SPEED;
  }
  if (input & J_DOWN) {
    new_y += DEFAULT_SCROLL_SPEED;
  }

  // Clamp to map boundaries (in pixels)
  uint16_t max_x = (player_map_width * 8) - 16;  // Map width - player sprite width (16x16)
  uint16_t max_y = (player_map_height * 8) - 16; // Map height - player sprite height (16x16)

  if (new_x < 0) new_x = 0;
  if (new_x > (int16_t)max_x) new_x = (int16_t)max_x;
  if (new_y < 0) new_y = 0;
  if (new_y > (int16_t)max_y) new_y = (int16_t)max_y;

  // Update world position (this is the ONLY place player position should change)
  player_world_x = (uint8_t)new_x;
  player_world_y = (uint8_t)new_y;

  // IMPORTANT: Sprite screen position stays fixed at 72,64
  // The camera/background scrolls instead of the sprite moving
}