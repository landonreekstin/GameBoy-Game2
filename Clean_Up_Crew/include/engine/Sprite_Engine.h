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

typedef struct {
  UINT8 id;
  UINT8 init_tile;
  UINT8 max_tile;
  UINT8 x;
  UINT8 y;
  UINT8 velocity;
  UINT8 is_visible;
  UINT8 has_hitbox;
} Sprite;

typedef struct {
  UINT8 meta_id;
  UINT8 init_tile;
  UINT8 max_tile;
  UINT8 texture_idx;
  UINT8 x;
  UINT8 y;
  UINT8 velocity;
  UINT8 is_visible;
  UINT8 has_hitbox;
  Sprite* tile0;
  Sprite* tile1;
  Sprite* tile2;
  Sprite* tile3;
} MetaSprite16x16;

/***************************************
 * Function Prototypes
 * ************************************/
/**
 * @brief Initializes a sprite.
 * 
 * @param sprite Pointer to the sprite to initialize.
 * @param id The sprite's id.
 * @param init_tile The sprite's initial tile.
 * @param max_tile The sprite's maximum tile.
 * 
 * @return Sprite* Returns a pointer to the initialized sprite.
*/
void init_sprite(Sprite* sprite, UINT8 id, UINT8 init_tile, UINT8 max_tile);

void init_sprite_old(Sprite* sprite, uint8_t id, uint8_t init_tile, uint8_t max_tile, uint8_t x, uint8_t y, uint8_t velocity);

/**
 * @brief Sets the sprite's position.
 * 
 * @param sprite Pointer to the sprite to set.
 * @param x The sprite's x position.
 * @param y The sprite's y position.
 * 
 * @return void
*/
void set_sprite_position(Sprite* sprite, UINT8 x, UINT8 y);

/**
 * @brief Sets the sprite's velocity.
 * 
 * @param sprite Pointer to the sprite to set.
 * @param velocity The sprite's velocity.
 * 
 * @return void
*/
void set_sprite_velocity(Sprite* sprite, UINT8 velocity);

/**
 * @brief Sets the sprite's visibility.
 * 
 * @param sprite Pointer to the sprite to set.
 * @param is_visible Whether the sprite is visible or not.
 * 
 * @return void
*/
void set_sprite_visibility(Sprite* sprite, UINT8 is_visible);

/**
 * @brief Sets the sprite's hitbox.
 * 
 * @param sprite Pointer to the sprite to set.
 * @param has_hitbox Whether the sprite has a hitbox or not.
 * 
 * @return void
*/
void set_sprite_hitbox(Sprite* sprite, UINT8 has_hitbox);

/**
 * @brief Sets the sprite's tile.
 * 
 * @param sprite Pointer to the sprite to set.
 * @param meta_id The sprite's meta id.
 * @param init_tile The sprite's initial tile.
 * @param max_tile The sprite's maximum tile.
 * @param texture_idx The sprite's texture index.
 * 
 * @return void
*/
void init_16x16_meta(MetaSprite16x16* meta, UINT8 meta_id, UINT8 init_tile, UINT8 max_tile, UINT8 texture_idx,
                    Sprite* tile0, Sprite* tile1, Sprite* tile2, Sprite* tile3);

void init_16x16_meta_old(MetaSprite16x16* meta, uint8_t meta_id, uint8_t init_tile, uint8_t max_tile, uint8_t texture_idx, uint8_t x, uint8_t y, Sprite* tile0, Sprite* tile1, Sprite* tile2, Sprite* tile3);

/**
 * @brief Sets the sprite's position.
 * 
 * @param sprite Pointer to the sprite to set.
 * @param meta_id The sprite's meta id.
 * @param init_tile The sprite's initial tile.
 * @param max_tile The sprite's maximum tile.
 * @param texture_idx The sprite's texture index.
 * @param tile0 Pointer to the sprite's first sub tile.
 * @param tile1 Pointer to the sprite's second sub tile.
 * @param tile2 Pointer to the sprite's third sub tile.
 * @param tile3 Pointer to the sprite's fourth sub tile.
 * 
 * @return void
*/
void set_16x16_meta_position(MetaSprite16x16* meta, UINT8 x, UINT8 y);

/**
 * @brief Sets the sprite's velocity.
 * 
 * @param sprite Pointer to the sprite to set.
 * @param velocity The sprite's velocity.
 * 
 * @return void
*/
void set_16x16_meta_velocity(MetaSprite16x16* meta, UINT8 velocity);

/**
 * @brief Sets the sprite's visibility.
 * 
 * @param sprite Pointer to the sprite to set.
 * @param is_visible Whether the sprite is visible or not.
 * 
 * @return void
*/
void set_16x16_meta_visibility(MetaSprite16x16* meta, UINT8 is_visible);

/**
 * @brief Sets the sprite's hitbox.
 * 
 * @param sprite Pointer to the sprite to set.
 * @param has_hitbox Whether the sprite has a hitbox or not.
 * 
 * @return void
*/
void set_16x16_meta_hitbox(MetaSprite16x16* meta, UINT8 has_hitbox);

/**
 * @brief Changes the meta sprite's texture index.
 *        If sprite pixel data is used elsewhere, then use pixel_data(). 
 *        If setup is only function which needs the pixel data array, pass that in directly.
 * 
 * @param meta Pointer to the meta sprite to change.
 * @param texture_idx The new texture index.
 * 
 * @return void
*/
void change_sprite_tile(Sprite *s);

/**
 * @brief Awaits joypad input to move the sprite.
 * 
 * @param sprite Pointer to the sprite to move.
 * 
 * @return void
*/
void translate_sprite(Sprite *s);

/**
 * @brief Awaits joypad input to move the meta sprite.
 * 
 * @param sprite Pointer to the sprite to move.
 * 
 * @return void
*/
void translate_16x16_meta(MetaSprite16x16 *meta);

/**
 * @brief Loads sprite pixel data, sets initial tile and position.
 *        If sprite pixel data is used elsewhere, then use pixel_data(). 
 *        If setup_sprite is only function which needs the pixel data array, pass that in directly.
 * 
 * @param sprite Pointer to the sprite to set up.
 * @param pixels The pixel data char array to load to the sprite.
 * 
 * @return void
*/
void setup_sprite(Sprite *s, UINT8 pixels[]);

/**
 * @brief Loads meta sprite pixel data, sets initial tile and position. 
 * 
 * @param sprite Pointer to the sprite to set up.
 * @param pixels The pixel data char array to load to the sprite.
 * 
 * @return void
*/
void setup_16x16_meta(MetaSprite16x16 *meta, UINT8 pixels[]);

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
uint8_t detect_map_collision(Sprite *sprite, UINT8 *map);

/**
 * @brief Detects collision between a meta sprite and map tiles.
 * 
 * @param meta Pointer to the meta sprite.
 * @param map Pointer to the map.
 * 
 * @return uint8_t Returns 1 if collision detected, 0 otherwise.
 * 
 */
uint8_t detect_meta_map_collision(MetaSprite16x16 *meta, UINT8 *map);

#endif // SPRITE_ENGINE_H