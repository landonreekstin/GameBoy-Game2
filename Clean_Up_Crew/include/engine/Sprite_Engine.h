/**
 * @brief Sprite engine header file. 
 * 
 * @details Contains definitions for the sprite engine.
 * 
 */

/***************************************
 * Includes
 * ************************************/
#ifndef SPRITE_ENGINE_H
#define SPRITE_ENGINE_H
#include <gb/gb.h>
#include <stdint.h>

/***************************************
 * Defines
 * ************************************/
#define DEFAULT_SCROLL_SPEED 1
#define SPRITE_SIZE 8
#define META_SPRITE_TILE_COUNT 4
#define META_SPRITE_SIZE (SPRITE_SIZE * 2)  // 16x16 meta sprite

// Game Boy hardware OAM offsets: move_sprite stores raw OAM values.
// OAM_X = screen_x + 8, OAM_Y = screen_y + 16
#define SPRITE_OAM_X_OFS 8
#define SPRITE_OAM_Y_OFS 16

// Meta sprite tile indices
#define META_TILE_TOP_LEFT     0
#define META_TILE_TOP_RIGHT    1
#define META_TILE_BOTTOM_LEFT  2
#define META_TILE_BOTTOM_RIGHT 3

/***************************************
 * Type Definitions
 * ************************************/
typedef struct {
  uint8_t id;
  uint8_t init_tile;
  uint8_t max_tile;
  uint8_t x;
  uint8_t y;
  uint8_t velocity;
  uint8_t is_visible;
  uint8_t has_hitbox;
} Sprite;

typedef struct {
  uint8_t meta_id;
  uint8_t init_tile;
  uint8_t max_tile;
  uint8_t texture_idx;
  uint8_t x;
  uint8_t y;
  uint8_t velocity;
  uint8_t is_visible;
  uint8_t has_hitbox;
  uint8_t anim_frame;                    // Current animation frame index (0 = idle)
  uint8_t flip_x;                        // 1 = facing left (swap tile columns + S_FLIPX), 0 = facing right
  Sprite tiles[META_SPRITE_TILE_COUNT];  // Embedded array: [0]=top-left, [1]=top-right, [2]=bottom-left, [3]=bottom-right
} MetaSprite16x16;

/***************************************
 * Helper Macros
 * ************************************/
/**
 * @brief Gets a specific tile from a meta sprite
 * Usage: Sprite* tile = GET_META_TILE(&meta, META_TILE_TOP_LEFT);
 */
#define GET_META_TILE(meta, index) (&((meta)->tiles[(index)]))

/***************************************
 * Function Prototypes
 * ************************************/
/**
 * @brief Initializes a sprite with all properties.
 *
 * @param sprite Pointer to the sprite to initialize.
 * @param id The sprite's id.
 * @param init_tile The sprite's initial tile.
 * @param max_tile The sprite's maximum tile.
 * @param x The sprite's x position.
 * @param y The sprite's y position.
 * @param velocity The sprite's velocity.
 *
 * @return void
*/
void init_sprite(Sprite* sprite, uint8_t id, uint8_t init_tile, uint8_t max_tile, uint8_t x, uint8_t y, uint8_t velocity);

/**
 * @brief Sets the sprite's position.
 *
 * @param sprite Pointer to the sprite to set.
 * @param x The sprite's x position.
 * @param y The sprite's y position.
 *
 * @return void
*/
void set_sprite_position(Sprite* sprite, uint8_t x, uint8_t y);

/**
 * @brief Sets the sprite's velocity.
 *
 * @param sprite Pointer to the sprite to set.
 * @param velocity The sprite's velocity.
 *
 * @return void
*/
void set_sprite_velocity(Sprite* sprite, uint8_t velocity);

/**
 * @brief Sets the sprite's visibility.
 *
 * @param sprite Pointer to the sprite to set.
 * @param is_visible Whether the sprite is visible or not.
 *
 * @return void
*/
void set_sprite_visibility(Sprite* sprite, uint8_t is_visible);

/**
 * @brief Sets the sprite's hitbox.
 *
 * @param sprite Pointer to the sprite to set.
 * @param has_hitbox Whether the sprite has a hitbox or not.
 *
 * @return void
*/
void set_sprite_hitbox(Sprite* sprite, uint8_t has_hitbox);

/**
 * @brief Initializes a 16x16 meta sprite with all properties.
 *
 * @param meta Pointer to the meta sprite to initialize.
 * @param meta_id The sprite's meta id (starting sprite index).
 * @param init_tile The sprite's initial tile.
 * @param max_tile The sprite's maximum tile.
 * @param texture_idx The sprite's texture index.
 * @param x The sprite's x position.
 * @param y The sprite's y position.
 *
 * @return void
*/
void init_16x16_meta(MetaSprite16x16* meta, uint8_t meta_id, uint8_t init_tile, uint8_t max_tile, uint8_t texture_idx, uint8_t x, uint8_t y);

/**
 * @brief Sets the meta sprite's position.
 *
 * @param meta Pointer to the meta sprite to set.
 * @param x The sprite's x position.
 * @param y The sprite's y position.
 *
 * @return void
*/
void set_16x16_meta_position(MetaSprite16x16* meta, uint8_t x, uint8_t y);

/**
 * @brief Sets the meta sprite's velocity.
 *
 * @param meta Pointer to the meta sprite to set.
 * @param velocity The sprite's velocity.
 *
 * @return void
*/
void set_16x16_meta_velocity(MetaSprite16x16* meta, uint8_t velocity);

/**
 * @brief Sets the meta sprite's visibility.
 *
 * @param meta Pointer to the meta sprite to set.
 * @param is_visible Whether the sprite is visible or not.
 *
 * @return void
*/
void set_16x16_meta_visibility(MetaSprite16x16* meta, uint8_t is_visible);

/**
 * @brief Sets the meta sprite's hitbox.
 *
 * @param meta Pointer to the meta sprite to set.
 * @param has_hitbox Whether the sprite has a hitbox or not.
 *
 * @return void
*/
void set_16x16_meta_hitbox(MetaSprite16x16* meta, uint8_t has_hitbox);

/**
 * @brief Hides all tiles in a meta sprite.
 *
 * @param meta Pointer to the meta sprite to hide.
 *
 * @return void
*/
void hide_16x16_meta(MetaSprite16x16* meta);

/**
 * @brief Shows all tiles in a meta sprite.
 *
 * @param meta Pointer to the meta sprite to show.
 *
 * @return void
*/
void show_16x16_meta(MetaSprite16x16* meta);

/**
 * @brief Changes the sprite's tile to the next tile in sequence.
 *
 * @param s Pointer to the sprite to change.
 *
 * @return void
*/
void change_sprite_tile(Sprite *s);

/**
 * @brief Animates a sprite by cycling through all its tiles.
 *
 * @param s Pointer to the sprite to animate.
 *
 * @return void
*/
void animate_sprite(Sprite *s);

/**
 * @brief Advances a 16x16 meta sprite to its next animation frame.
 *        Each frame is a group of META_SPRITE_TILE_COUNT consecutive tiles.
 *        No-op if only one frame of tiles is loaded (max_tile <= META_SPRITE_TILE_COUNT).
 *        Call on a frame-counter interval from the game loop — does not block.
 *
 * @param meta Pointer to the meta sprite to animate.
 *
 * @return void
*/
void animate_16x16_meta(MetaSprite16x16 *meta);

/**
 * @brief Resets a 16x16 meta sprite to its idle (frame 0) tiles.
 *        Call when the sprite stops moving to restore the default pose.
 *
 * @param meta Pointer to the meta sprite to reset.
 *
 * @return void
*/
void reset_16x16_meta_anim(MetaSprite16x16 *meta);

/**
 * @brief Awaits joypad input to move the sprite.
 *
 * @param s Pointer to the sprite to move.
 *
 * @return void
*/
void translate_sprite(Sprite *s);

/**
 * @brief Awaits joypad input to move the meta sprite.
 *
 * @param meta Pointer to the meta sprite to move.
 *
 * @return void
*/
void translate_16x16_meta(MetaSprite16x16 *meta);

/**
 * @brief Loads sprite pixel data, sets initial tile and position.
 *        If sprite pixel data is used elsewhere, then use pixel_data().
 *        If setup_sprite is only function which needs the pixel data array, pass that in directly.
 *
 * @param s Pointer to the sprite to set up.
 * @param pixels The pixel data char array to load to the sprite.
 *
 * @return void
*/
void setup_sprite(Sprite *s, const uint8_t pixels[]);

/**
 * @brief Loads meta sprite pixel data, sets initial tile and position.
 *
 * @param meta Pointer to the meta sprite to set up.
 * @param pixels The pixel data char array to load to the sprite.
 *
 * @return void
*/
void setup_16x16_meta(MetaSprite16x16 *meta, const uint8_t pixels[]);

/**
 * @brief Detects collision between two sprites.
 *
 * @param sprite1 Pointer to the first sprite.
 * @param sprite2 Pointer to the second sprite.
 *
 * @return uint8_t Returns 1 if collision detected, 0 otherwise.
 *
 */
uint8_t detect_collision(Sprite *sprite1, Sprite *sprite2);

/**
 * @brief Detects collision between a sprite and a meta sprite.
 *
 * @param sprite Pointer to the sprite.
 * @param meta Pointer to the meta sprite.
 *
 * @return uint8_t Returns 1 if collision detected, 0 otherwise.
 *
 */
uint8_t detect_meta_collision(Sprite *sprite, MetaSprite16x16 *meta);

/**
 * @brief Detects collision between a sprite and map tiles.
 *
 * @param sprite Pointer to the sprite.
 * @param map Pointer to the map.
 *
 * @return uint8_t Returns 1 if collision detected, 0 otherwise.
 *
 */
uint8_t detect_map_collision(Sprite *sprite, uint8_t *map);

/**
 * @brief Detects collision between a meta sprite and map tiles.
 *
 * @param meta Pointer to the meta sprite.
 * @param map Pointer to the map.
 *
 * @return uint8_t Returns 1 if collision detected, 0 otherwise.
 *
 */
uint8_t detect_meta_map_collision(MetaSprite16x16 *meta, uint8_t *map);

#endif // SPRITE_ENGINE_H