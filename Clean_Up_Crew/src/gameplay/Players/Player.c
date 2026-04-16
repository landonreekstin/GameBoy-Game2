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

// Active map for tile collision (set during init_game)
const Map* player_map = 0;

// Player screen position (fixed - player stays centered on screen)
#define PLAYER_SCREEN_X 72  // Centered horizontally (160/2 - 16/2 = 72)
#define PLAYER_SCREEN_Y 64  // Centered vertically (144/2 - 16/2 = 64)

/* Start of tile array.
 * 2 animation frames, 4 tiles each (16x16 meta sprite).
 * Frame 0 (tiles 0-3): idle pose.
 * Frame 1 (tiles 4-7): walk pose — top tiles identical, bottom tiles
 *   shifted down 1px to produce a visible leg-bob. Placeholder until
 *   Christian supplies final walk cycle art.
 */
uint8_t PhasmoPlaceholder[] =
{
  /* --- Frame 0: idle --- */
  /* tile 0: top-left */
  0x00,0x1F,0x0E,0x31,0x1F,0x20,0x00,0x3F,
  0x1F,0x23,0x0F,0x33,0x0F,0x10,0x07,0x18,
  /* tile 1: top-right */
  0x00,0xF0,0x30,0xC8,0xF0,0x0C,0x00,0xFF,
  0xF8,0x34,0xF8,0x34,0xF8,0x04,0xF0,0x0C,
  /* tile 2: bottom-left */
  0xE0,0x18,0x80,0x70,0x00,0xC0,0x00,0x80,
  0x00,0x80,0x00,0xC0,0x80,0x40,0x00,0xC0,
  /* tile 3: bottom-right */
  0x07,0x08,0x00,0x0F,0x07,0x18,0x0F,0x10,
  0x0F,0x10,0x07,0x18,0x07,0x08,0x00,0x0F,

  /* --- Frame 1: walk (placeholder) --- */
  /* tile 4: top-left (same as tile 0) */
  0x00,0x1F,0x0E,0x31,0x1F,0x20,0x00,0x3F,
  0x1F,0x23,0x0F,0x33,0x0F,0x10,0x07,0x18,
  /* tile 5: top-right (same as tile 1) */
  0x00,0xF0,0x30,0xC8,0xF0,0x0C,0x00,0xFF,
  0xF8,0x34,0xF8,0x34,0xF8,0x04,0xF0,0x0C,
  /* tile 6: bottom-left shifted down 1px (tile 2 rows 0-6, blank last row) */
  0x00,0x00,0xE0,0x18,0x80,0x70,0x00,0xC0,
  0x00,0x80,0x00,0x80,0x00,0xC0,0x80,0x40,
  /* tile 7: bottom-right shifted down 1px (tile 3 rows 0-6, blank last row) */
  0x00,0x00,0x07,0x08,0x00,0x0F,0x07,0x18,
  0x0F,0x10,0x0F,0x10,0x07,0x18,0x07,0x08
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

// Returns 1 if the 16x16 player footprint at (px, py) overlaps any solid tile.
static uint8_t player_is_solid(uint8_t px, uint8_t py)
{
    uint8_t left   = px / TILE_SIZE;
    uint8_t right  = (px + META_SPRITE_SIZE - 1) / TILE_SIZE;
    uint8_t top    = py / TILE_SIZE;
    uint8_t bottom = (py + META_SPRITE_SIZE - 1) / TILE_SIZE;

    return (map_get_tile_collision(player_map, left,  top)    == TILE_SOLID) ||
           (map_get_tile_collision(player_map, right, top)    == TILE_SOLID) ||
           (map_get_tile_collision(player_map, left,  bottom) == TILE_SOLID) ||
           (map_get_tile_collision(player_map, right, bottom) == TILE_SOLID);
}

inline void move_player(void)
{
    static uint8_t anim_counter = 0;
    static uint8_t facing_left  = 0;

    uint8_t input = joypad();

    int16_t new_x = (int16_t)player_world_x;
    int16_t new_y = (int16_t)player_world_y;

    // Map pixel boundaries
    int16_t max_x = (int16_t)((player_map_width  * TILE_SIZE) - META_SPRITE_SIZE);
    int16_t max_y = (int16_t)((player_map_height * TILE_SIZE) - META_SPRITE_SIZE);

    // --- X axis ---
    if (input & J_LEFT)  new_x -= DEFAULT_SCROLL_SPEED;
    if (input & J_RIGHT) new_x += DEFAULT_SCROLL_SPEED;

    if (new_x < 0)       new_x = 0;
    if (new_x > max_x)   new_x = max_x;

    // Revert X if destination overlaps a solid tile (wall slide: Y still resolves)
    if (player_map && player_is_solid((uint8_t)new_x, player_world_y)) {
        new_x = (int16_t)player_world_x;
    }

    // --- Y axis ---
    if (input & J_UP)    new_y -= DEFAULT_SCROLL_SPEED;
    if (input & J_DOWN)  new_y += DEFAULT_SCROLL_SPEED;

    if (new_y < 0)       new_y = 0;
    if (new_y > max_y)   new_y = max_y;

    // Revert Y if destination overlaps a solid tile (uses resolved new_x for accuracy)
    if (player_map && player_is_solid((uint8_t)new_x, (uint8_t)new_y)) {
        new_y = (int16_t)player_world_y;
    }

    player_world_x = (uint8_t)new_x;
    player_world_y = (uint8_t)new_y;

    // --- Facing direction (horizontal flip + column swap) ---
    if (input & J_LEFT) {
        if (!facing_left) {
            facing_left = 1;
            p_player_sprite->flip_x = 1;
            for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
                set_sprite_prop(p_player_sprite->tiles[i].id, S_FLIPX);
            }
        }
    } else if (input & J_RIGHT) {
        if (facing_left) {
            facing_left = 0;
            p_player_sprite->flip_x = 0;
            for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
                set_sprite_prop(p_player_sprite->tiles[i].id, 0);
            }
        }
    }

    // --- Walk animation / idle frame ---
    if (input) {
        if (++anim_counter >= PLAYER_ANIM_RATE) {
            anim_counter = 0;
            animate_16x16_meta(p_player_sprite);
        }
    } else {
        anim_counter = 0;
        reset_16x16_meta_anim(p_player_sprite);
    }
}