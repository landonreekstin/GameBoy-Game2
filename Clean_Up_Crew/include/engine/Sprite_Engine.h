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

/***************************************
 * Defines
 * ************************************/
#define DEFAULT_SCROLL_SPEED 1
#define SPRITE_SIZE 8

typedef struct {
  uint8_t id;
  uint8_t init_tile;
  uint8_t max_tile;
  uint8_t x;
  uint8_t y;
  uint8_t velocity;
  bool    is_visible;
  bool    has_hitbox;
} Sprite;

typedef struct {
  uint8_t meta_id;
  uint8_t init_tile;
  uint8_t max_tile;
  uint8_t texture_idx;
  uint8_t x;
  uint8_t y;
  uint8_t velocity;
  bool    is_visible;
  bool    has_hitbox;
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
 * @param x The sprite's x position.
 * @param y The sprite's y position.
 * @param velocity The sprite's velocity.
 * @param is_visible Whether the sprite is visible or not.
 * @param has_hitbox Whether the sprite has a hitbox or not.
 * 
 * @return void
*/
void init_sprite(Sprite* sprite, uint8_t id, uint8_t init_tile, uint8_t max_tile, uint8_t x, uint8_t y, uint8_t velocity, bool is_visible, bool has_hitbox);

/**
 * @brief Initializes a 16x16 meta sprite.
 * 
 * @param meta Pointer to the meta sprite to initialize.
 * @param meta_id  The meta sprite's id. 
 * @param init_tile  The meta sprite's initial tile.
 * @param max_tile  The meta sprite's maximum tile.
 * @param texture_idx  The meta sprite's texture index.
 * @param x  The meta sprite's x position.
 * @param y  The meta sprite's y position.
 * @param velocity  The meta sprite's velocity.
 * @param is_visible  Whether the meta sprite is visible or not.
 * @param tile0  
 * @param tile1 
 * @param tile2 
 * @param tile3 
 * 
 * @return void
 */
void init_16x16_meta(MetaSprite16x16* meta, uint8_t meta_id, uint8_t init_tile, uint8_t max_tile, uint8_t texture_idx, 
                    uint8_t x, uint8_t y, uint8_t velocity, bool is_visible, bool has_hitbox, Sprite* tile0, Sprite* tile1, Sprite* tile2, Sprite* tile3);

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
void change_sprite_tile(Sprite *s, uint8_t texture_idx);

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
void setup_sprite(Sprite *s, unsigned char pixels[]);

/**
 * @brief Loads meta sprite pixel data, sets initial tile and position. 
 * 
 * @param sprite Pointer to the sprite to set up.
 * @param pixels The pixel data char array to load to the sprite.
 * 
 * @return void
*/
void setup_16x16_meta(MetaSprite16x16 *meta, unsigned char pixels[]);

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
uint8_t detect_map_collision(Sprite *sprite, unsigned char *map);

/**
 * @brief Detects collision between a meta sprite and map tiles.
 * 
 * @param meta Pointer to the meta sprite.
 * @param map Pointer to the map.
 * 
 * @return uint8_t Returns 1 if collision detected, 0 otherwise.
 * 
 */
uint8_t detect_meta_map_collision(MetaSprite16x16 *meta, unsigned char *map);

#endif // SPRITE_ENGINE_H