/**
 * @brief Sprite Engine
 *
 * @details This file is responsible for handling sprite related functions.
 *
 * ARCHITECTURE NOTES:
 * - Sprites are 8x8 pixels (hardware limitation)
 * - MetaSprite16x16 combines 4 sprites in a 2x2 grid for larger characters
 * - All repetitive operations use loops for efficiency and maintainability
 * - Sprites are embedded in MetaSprite16x16 (not pointers) for better cache locality
 *
 * PERFORMANCE CONSIDERATIONS:
 * - Loop-based operations reduce ROM size vs. unrolled code
 * - Embedded array reduces pointer indirection overhead
 * - Bit operations (i & 1, i & 2) used for tile positioning
 *
 * COLLISION DETECTION:
 * - Uses AABB (Axis-Aligned Bounding Box) algorithm
 * - Map collision functions are stubs pending map engine integration
*/

/***************************************
 * Includes
 * ************************************/
#include "../../include/engine/Sprite_Engine.h"
#include "../../include/engine/Map_Engine.h"
#include "../../include/engine/System.h"
#include <gb/gb.h>
#include <stdint.h>

/***************************************
 * Defines
 * ************************************/
#define SPRITE_COUNT_MAX 40
#define SPRITE_SCANLINE_MAX 10

/***************************************
 * Local Variables
 * ************************************/

/***************************************
 * Function Prototypes
 * ************************************/

/***************************************
 * Functions
 * ************************************/
void init_sprite(Sprite* sprite, uint8_t id, uint8_t init_tile, uint8_t max_tile, uint8_t x, uint8_t y, uint8_t velocity)
{
    sprite->id = id;
    sprite->init_tile = init_tile;
    sprite->max_tile = max_tile;
    sprite->x = x;
    sprite->y = y;
    sprite->velocity = velocity;
    sprite->is_visible = 1;
    sprite->has_hitbox = 1;
}

void init_16x16_meta(MetaSprite16x16* meta, uint8_t meta_id, uint8_t init_tile, uint8_t max_tile, uint8_t texture_idx, uint8_t x, uint8_t y)
{
    meta->meta_id = meta_id;
    meta->init_tile = init_tile;
    meta->max_tile = max_tile;
    meta->texture_idx = texture_idx;
    meta->x = x;
    meta->y = y;
    meta->velocity = DEFAULT_SCROLL_SPEED;
    meta->is_visible = 1;
    meta->has_hitbox = 1;
    meta->anim_frame = 0;
    meta->flip_x = 0;

    // Initialize all 4 sub-sprites in a loop
    // Layout: [0]=top-left, [1]=top-right, [2]=bottom-left, [3]=bottom-right
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        uint8_t tile_x = meta->x + ((i & 1) ? SPRITE_SIZE : 0);  // Right tiles (1,3) get +8 offset
        uint8_t tile_y = meta->y + ((i & 2) ? SPRITE_SIZE : 0);  // Bottom tiles (2,3) get +8 offset

        init_sprite(&meta->tiles[i],
                    meta->meta_id + i,
                    (meta->init_tile * meta->texture_idx) + i,
                    (meta->max_tile * meta->texture_idx) + i,
                    tile_x,
                    tile_y,
                    DEFAULT_SCROLL_SPEED);
    }
}

void set_sprite_position(Sprite* sprite, uint8_t x, uint8_t y)
{
    sprite->x = x;
    sprite->y = y;
}

void set_sprite_velocity(Sprite* sprite, uint8_t velocity)
{
    sprite->velocity = velocity;
}

void set_sprite_visibility(Sprite* sprite, uint8_t is_visible)
{
    sprite->is_visible = is_visible;
}

void set_sprite_hitbox(Sprite* sprite, uint8_t has_hitbox)
{
    sprite->has_hitbox = has_hitbox;
}

void set_16x16_meta_position(MetaSprite16x16* meta, uint8_t x, uint8_t y)
{
    meta->x = x;
    meta->y = y;

    // Update all sub-sprite positions and apply to hardware.
    // When flip_x is set, swap the left/right column offsets so the
    // correct tile occupies each screen column after S_FLIPX is applied.
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        uint8_t x_ofs = meta->flip_x ? ((i & 1) ? 0 : SPRITE_SIZE)   // flipped: odd tiles → left col
                                     : ((i & 1) ? SPRITE_SIZE : 0);   // normal:  odd tiles → right col
        meta->tiles[i].x = meta->x + x_ofs;
        meta->tiles[i].y = meta->y + ((i & 2) ? SPRITE_SIZE : 0);
        move_sprite(meta->tiles[i].id,
                    meta->tiles[i].x + SPRITE_OAM_X_OFS,
                    meta->tiles[i].y + SPRITE_OAM_Y_OFS);
    }
}

void set_16x16_meta_velocity(MetaSprite16x16* meta, uint8_t velocity)
{
    meta->velocity = velocity;

    // Update all sub-sprite velocities using loop
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        meta->tiles[i].velocity = meta->velocity;
    }
}

void set_16x16_meta_visibility(MetaSprite16x16* meta, uint8_t is_visible)
{
    meta->is_visible = is_visible;

    // Update all sub-sprite visibility using loop
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        meta->tiles[i].is_visible = meta->is_visible;
    }
}

void set_16x16_meta_hitbox(MetaSprite16x16* meta, uint8_t has_hitbox)
{
    meta->has_hitbox = has_hitbox;

    // Update all sub-sprite hitboxes using loop
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        meta->tiles[i].has_hitbox = meta->has_hitbox;
    }
}

void hide_16x16_meta(MetaSprite16x16* meta)
{
    // Hide all tiles by moving them off-screen (y=0 is off-screen on Game Boy)
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        move_sprite(meta->tiles[i].id, 0, 0);
    }
    meta->is_visible = 0;
}

void show_16x16_meta(MetaSprite16x16* meta)
{
    // Show all tiles by moving them to their proper positions
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        move_sprite(meta->tiles[i].id,
                    meta->tiles[i].x + SPRITE_OAM_X_OFS,
                    meta->tiles[i].y + SPRITE_OAM_Y_OFS);
    }
    meta->is_visible = 1;
}

void setup_sprite(Sprite *s, const uint8_t pixels[])
{
    set_sprite_data(s->init_tile, s->max_tile, pixels);    // (initial tile, final tile, sprite char array)
    set_sprite_tile(s->id, s->init_tile);                  // (sprite index, tile), gives sprite its id
    move_sprite(s->id, s->x, s->y);                        // (sprite index, x, y)
}

void setup_16x16_meta(MetaSprite16x16 *meta, const uint8_t pixels[])
{
    // Load sprite tile data once for all tiles
    set_sprite_data(meta->init_tile, meta->max_tile, pixels);

    // Configure all sub-sprites using loop
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        set_sprite_tile(meta->tiles[i].id, meta->tiles[i].init_tile);
        move_sprite(meta->tiles[i].id,
                    meta->tiles[i].x + SPRITE_OAM_X_OFS,
                    meta->tiles[i].y + SPRITE_OAM_Y_OFS);
    }

    SHOW_SPRITES;
    wait_vbl_done();
}

void change_sprite_tile(Sprite *s)
{
    uint8_t current_tile = get_sprite_tile(s->id);
    if (current_tile < s->max_tile - 1) {
        set_sprite_tile(s->id, ++current_tile);
    }
    else {
        set_sprite_tile(s->id, 0);
    }
}

void animate_sprite(Sprite *s)
{
    for (uint8_t tile_idx = 0; tile_idx < s->max_tile; tile_idx++) {
        set_sprite_tile(s->id, tile_idx);
        delay(350);
    }
}

void animate_16x16_meta(MetaSprite16x16 *meta)
{
    uint8_t num_frames = meta->max_tile / META_SPRITE_TILE_COUNT;
    if (num_frames <= 1) return;

    meta->anim_frame = (meta->anim_frame + 1) % num_frames;
    uint8_t base_tile = meta->init_tile + (meta->anim_frame * META_SPRITE_TILE_COUNT);
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        set_sprite_tile(meta->tiles[i].id, base_tile + i);
    }
}

void reset_16x16_meta_anim(MetaSprite16x16 *meta)
{
    meta->anim_frame = 0;
    for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
        set_sprite_tile(meta->tiles[i].id, meta->init_tile + i);
    }
}

void translate_sprite(Sprite *s) {
    
    switch(joypad()) {
        case J_LEFT:
            scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
            //change_sprite_tile(s);
            break;
        case J_RIGHT:
            scroll_sprite(s->id, 1 * DEFAULT_SCROLL_SPEED, 0);
            //change_sprite_tile(s);
            break;
        case J_UP:
            scroll_sprite(s->id, 0, -1 * DEFAULT_SCROLL_SPEED);
            //change_sprite_tile(s);
            break;
        case J_DOWN:
            scroll_sprite(s->id, 0, 1 * DEFAULT_SCROLL_SPEED);
            //change_sprite_tile(s);
            break;
    }
    cpu_wait(50); // change to wait function
}

void translate_16x16_meta(MetaSprite16x16 *meta)
{
    int8_t dx = 0, dy = 0;

    // Determine direction based on joypad input
    switch(joypad()) {
        case J_LEFT:
            dx = -DEFAULT_SCROLL_SPEED;
            break;
        case J_RIGHT:
            dx = DEFAULT_SCROLL_SPEED;
            break;
        case J_UP:
            dy = -DEFAULT_SCROLL_SPEED;
            break;
        case J_DOWN:
            dy = DEFAULT_SCROLL_SPEED;
            break;
    }

    // Apply movement to all sub-sprites and update positions
    if (dx != 0 || dy != 0) {
        // Update meta sprite position
        meta->x += dx;
        meta->y += dy;

        // Move all sub-sprites
        for (uint8_t i = 0; i < META_SPRITE_TILE_COUNT; i++) {
            meta->tiles[i].x += dx;
            meta->tiles[i].y += dy;
            scroll_sprite(meta->tiles[i].id, dx, dy);
        }
    }

    cpu_wait(50); // change to wait function
}

uint8_t detect_collision(Sprite *sprite1, Sprite *sprite2)
{
    return (sprite1->x < sprite2->x + SPRITE_SIZE) &&
           (sprite1->x + SPRITE_SIZE > sprite2->x) &&
           (sprite1->y < sprite2->y + SPRITE_SIZE) &&
           (sprite1->y + SPRITE_SIZE > sprite2->y);
}

uint8_t detect_meta_collision(Sprite *sprite, MetaSprite16x16 *meta)
{
    // Check collision between single sprite and meta sprite's bounding box
    return (sprite->x < meta->x + (SPRITE_SIZE * 2)) &&
           (sprite->x + SPRITE_SIZE > meta->x) &&
           (sprite->y < meta->y + (SPRITE_SIZE * 2)) &&
           (sprite->y + SPRITE_SIZE > meta->y);
}

uint8_t detect_map_collision(Sprite *sprite, uint8_t *map)
{
    // TODO: Implement map collision detection
    // This requires map width/height and tile collision data
    // For now, return 0 (no collision)
    (void)sprite;  // Suppress unused parameter warning
    (void)map;
    return 0;
}

uint8_t detect_meta_map_collision(MetaSprite16x16 *meta, uint8_t *map)
{
    // TODO: Implement meta sprite map collision detection
    // This requires map width/height and tile collision data
    // For now, return 0 (no collision)
    (void)meta;  // Suppress unused parameter warning
    (void)map;
    return 0;
}