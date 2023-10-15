/**
 * @brief Sprite Engine
 * 
 * @details This file is responsible for handling sprite related functions.
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
void init_sprite(Sprite* sprite, UINT8 id, UINT8 init_tile, UINT8 max_tile)
{
    sprite->id = id;
    sprite->init_tile = init_tile;
    sprite->max_tile = max_tile;
}

void init_sprite_old(Sprite* sprite, uint8_t id, uint8_t init_tile, uint8_t max_tile, uint8_t x, uint8_t y, uint8_t velocity) {
    sprite->id = id;
    sprite->init_tile = init_tile;
    sprite->max_tile = max_tile;
    sprite->x = x;
    sprite->y = y;
    sprite->velocity = velocity;
}

void init_16x16_meta(MetaSprite16x16* meta, UINT8 meta_id, UINT8 init_tile, UINT8 max_tile, UINT8 texture_idx,
                    Sprite* tile0, Sprite* tile1, Sprite* tile2, Sprite* tile3)
{
    meta->meta_id = meta_id;
    meta->init_tile = init_tile;
    meta->max_tile = max_tile;
    meta->texture_idx = texture_idx;

    // point to sub sprite structs
    meta->tile0 = tile0;
    meta->tile1 = tile1;
    meta->tile2 = tile2;
    meta->tile3 = tile3;

    // set sprite id for each sub sprite
    meta->tile0->id = meta->meta_id;
    meta->tile1->id = meta->meta_id + 1;
    meta->tile2->id = meta->meta_id + 2;
    meta->tile3->id = meta->meta_id + 3;

    // set sprite tile for each sub sprite
    meta->tile0->init_tile = (meta->init_tile * meta->texture_idx);
    meta->tile1->init_tile = (meta->init_tile * meta->texture_idx) + 1;
    meta->tile2->init_tile = (meta->init_tile * meta->texture_idx) + 2;
    meta->tile3->init_tile = (meta->init_tile * meta->texture_idx) + 3;

    // set sprite max tile for each sub sprite
    meta->tile0->max_tile = (meta->max_tile * meta->texture_idx);
    meta->tile1->max_tile = (meta->max_tile * meta->texture_idx) + 1;
    meta->tile2->max_tile = (meta->max_tile * meta->texture_idx) + 2;
    meta->tile3->max_tile = (meta->max_tile * meta->texture_idx) + 3;

    // set sub sprite attributes
    // sub sprite 0
    set_sprite_position(meta->tile0, meta->tile0->x, meta->tile0->y);
    set_sprite_velocity(meta->tile0, meta->velocity);
    set_sprite_visibility(meta->tile0, meta->is_visible);
    set_sprite_hitbox(meta->tile0, meta->has_hitbox);
    init_sprite(meta->tile0, meta->tile0->id, meta->tile0->init_tile, meta->tile0->max_tile);
    // sub sprite 1
    set_sprite_position(meta->tile1, meta->tile1->x, meta->tile1->y);
    set_sprite_velocity(meta->tile1, meta->velocity);
    set_sprite_visibility(meta->tile1, meta->is_visible);
    set_sprite_hitbox(meta->tile1, meta->has_hitbox);
    init_sprite(meta->tile1, meta->tile1->id, meta->tile1->init_tile, meta->tile1->max_tile);
    // sub sprite 2
    set_sprite_position(meta->tile2, meta->tile2->x, meta->tile2->y);
    set_sprite_velocity(meta->tile2, meta->velocity);
    set_sprite_visibility(meta->tile2, meta->is_visible);
    set_sprite_hitbox(meta->tile2, meta->has_hitbox);
    init_sprite(meta->tile2, meta->tile2->id, meta->tile2->init_tile, meta->tile2->max_tile);
    // sub sprite 3
    set_sprite_position(meta->tile3, meta->tile3->x, meta->tile3->y);
    set_sprite_velocity(meta->tile3, meta->velocity);
    set_sprite_visibility(meta->tile3, meta->is_visible);
    set_sprite_hitbox(meta->tile3, meta->has_hitbox);
    init_sprite(meta->tile3, meta->tile3->id, meta->tile3->init_tile, meta->tile3->max_tile);
}

void init_16x16_meta_old(MetaSprite16x16* meta, uint8_t meta_id, uint8_t init_tile, uint8_t max_tile, uint8_t texture_idx, uint8_t x, uint8_t y, Sprite* tile0, Sprite* tile1, Sprite* tile2, Sprite* tile3) {
    meta->meta_id = meta_id;
    meta->init_tile = init_tile;
    meta->max_tile = max_tile;
    meta->texture_idx = texture_idx;
    meta->x = x;
    meta->y = y;

    // point to sub sprite structs
    meta->tile0 = tile0;
    meta->tile1 = tile1;
    meta->tile2 = tile2;
    meta->tile3 = tile3;

    /* Change sub tiles to be stored in array and do initialization in a loop
    uint8_t i = 0;
    for (i = 0; i < 4; i++) {
        // set sub sprite tile
        tile0->init_tile = init_tile * texture_idx + i;
    }
    */

    // set sprite id for each sub sprite
    meta->tile0->id = meta->meta_id;
    meta->tile1->id = meta->meta_id + 1;
    meta->tile2->id = meta->meta_id + 2;
    meta->tile3->id = meta->meta_id + 3;

    // set sprite tile for each sub sprite
    meta->tile0->init_tile = (meta->init_tile * meta->texture_idx);
    meta->tile1->init_tile = (meta->init_tile * meta->texture_idx) + 1;
    meta->tile2->init_tile = (meta->init_tile * meta->texture_idx) + 2;
    meta->tile3->init_tile = (meta->init_tile * meta->texture_idx) + 3;

    // set sprite max tile for each sub sprite
    meta->tile0->max_tile = (meta->max_tile * meta->texture_idx);
    meta->tile1->max_tile = (meta->max_tile * meta->texture_idx) + 1;
    meta->tile2->max_tile = (meta->max_tile * meta->texture_idx) + 2;
    meta->tile3->max_tile = (meta->max_tile * meta->texture_idx) + 3;

    // set sprite x for each sub sprite
    meta->tile0->x = meta->x;
    meta->tile1->x = meta->x + SPRITE_SIZE;
    meta->tile2->x = meta->x;
    meta->tile3->x = meta->x + SPRITE_SIZE;

    // set sprite y for each sub sprite
    meta->tile0->y = meta->y;
    meta->tile1->y = meta->y;
    meta->tile2->y = meta->y + SPRITE_SIZE;
    meta->tile3->y = meta->y + SPRITE_SIZE;

    // set sub sprite attributes
    init_sprite_old(meta->tile0, meta->tile0->id, meta->tile0->init_tile, meta->tile0->max_tile, meta->tile0->x, meta->tile0->y, DEFAULT_SCROLL_SPEED);
    init_sprite_old(meta->tile1, meta->tile1->id, meta->tile1->init_tile, meta->tile1->max_tile, meta->tile1->x, meta->tile1->y, DEFAULT_SCROLL_SPEED);
    init_sprite_old(meta->tile2, meta->tile2->id, meta->tile2->init_tile, meta->tile2->max_tile, meta->tile2->x, meta->tile2->y, DEFAULT_SCROLL_SPEED);
    init_sprite_old(meta->tile3, meta->tile3->id, meta->tile3->init_tile, meta->tile3->max_tile, meta->tile3->x, meta->tile3->y, DEFAULT_SCROLL_SPEED);

}

void set_sprite_position(Sprite* sprite, UINT8 x, UINT8 y)
{
    sprite->x = x;
    sprite->y = y;
}

void set_sprite_velocity(Sprite* sprite, UINT8 velocity)
{
    sprite->velocity = velocity;
}

void set_sprite_visibility(Sprite* sprite, UINT8 is_visible)
{
    sprite->is_visible = is_visible;
}

void set_sprite_hitbox(Sprite* sprite, UINT8 has_hitbox)
{
    sprite->has_hitbox = has_hitbox;
}

void set_16x16_meta_position(MetaSprite16x16* meta, UINT8 x, UINT8 y)
{
    meta->x = x;
    meta->y = y;

    // set sprite x for each sub sprite
    meta->tile0->x = meta->x;
    meta->tile1->x = meta->x + SPRITE_SIZE;
    meta->tile2->x = meta->x;
    meta->tile3->x = meta->x + SPRITE_SIZE;

    // set sprite y for each sub sprite
    meta->tile0->y = meta->y;
    meta->tile1->y = meta->y;
    meta->tile2->y = meta->y + SPRITE_SIZE;
    meta->tile3->y = meta->y + SPRITE_SIZE;
}

void set_16x16_meta_velocity(MetaSprite16x16* meta, UINT8 velocity)
{
    meta->velocity = velocity;

    // set sprite velocity for each sub sprite
    meta->tile0->velocity = meta->velocity;
    meta->tile1->velocity = meta->velocity;
    meta->tile2->velocity = meta->velocity;
    meta->tile3->velocity = meta->velocity;
}

void set_16x16_meta_visibility(MetaSprite16x16* meta, UINT8 is_visible)
{
    meta->is_visible = is_visible;

    // set sprite visibility for each sub sprite
    meta->tile0->is_visible = meta->is_visible;
    meta->tile1->is_visible = meta->is_visible;
    meta->tile2->is_visible = meta->is_visible;
    meta->tile3->is_visible = meta->is_visible;
}

void set_16x16_meta_hitbox(MetaSprite16x16* meta, UINT8 has_hitbox)
{
    meta->has_hitbox = has_hitbox;

    // set sprite hitbox for each sub sprite
    meta->tile0->has_hitbox = meta->has_hitbox;
    meta->tile1->has_hitbox = meta->has_hitbox;
    meta->tile2->has_hitbox = meta->has_hitbox;
    meta->tile3->has_hitbox = meta->has_hitbox;
}

void setup_sprite(Sprite *s, UINT8 pixels[]) 
{   
    set_sprite_data(s->init_tile, s->max_tile, pixels);    // (initial tile, final tile, sprite char array)
    set_sprite_tile(s->id, s->init_tile);                  // (sprite index, tile), gives sprite its id
    move_sprite(0, s->x, s->y);                            // (sprite index, x, y)
}

void setup_16x16_meta(MetaSprite16x16 *meta, UINT8 pixels[]) 
{   
    // set sprite tile data
    set_sprite_data(meta->init_tile, meta->max_tile, pixels);    // (initial tile, final tile, sprite char array)

    // set sprite tile index
    set_sprite_tile(meta->tile0->id, meta->tile0->init_tile);    // (sprite index, tile), gives sprite its id
    set_sprite_tile(meta->tile1->id, meta->tile1->init_tile);    // (sprite index, tile), gives sprite its id
    set_sprite_tile(meta->tile2->id, meta->tile2->init_tile);    // (sprite index, tile), gives sprite its id
    set_sprite_tile(meta->tile3->id, meta->tile3->init_tile);    // (sprite index, tile), gives sprite its id

    // set sprite position for each sub sprite
    move_sprite(meta->tile0->id, meta->tile0->x, meta->tile0->y);
    move_sprite(meta->tile1->id, meta->tile1->x, meta->tile1->y);
    move_sprite(meta->tile2->id, meta->tile2->x, meta->tile2->y);
    move_sprite(meta->tile3->id, meta->tile3->x, meta->tile3->y);

    SHOW_SPRITES;
    wait_vbl_done();
}

void change_sprite_tile(Sprite *s) 
{
    //Sprite s = &ps;
    UINT8 current_tile = get_sprite_tile(s->id);
    if (current_tile < s->max_tile - 1) {
        set_sprite_tile(s->id, ++current_tile);
    }
    else {
        set_sprite_tile(s->id, 0);
    }
}

void animate_sprite(Sprite *s) 
{
    for (UINT8 tile_idx = 0; tile_idx < s->max_tile; tile_idx++) {
        set_sprite_tile(s->id, tile_idx);
        delay(350);
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
    cpu_wait(5000); // change to wait function
}

void translate_16x16_meta(MetaSprite16x16 *meta) {
        
    switch(joypad()) {
        case J_LEFT:
            scroll_sprite(meta->tile0->id, -1 * DEFAULT_SCROLL_SPEED, 0);
            scroll_sprite(meta->tile1->id, -1 * DEFAULT_SCROLL_SPEED, 0);
            scroll_sprite(meta->tile2->id, -1 * DEFAULT_SCROLL_SPEED, 0);
            scroll_sprite(meta->tile3->id, -1 * DEFAULT_SCROLL_SPEED, 0);
            break;
        case J_RIGHT:
            scroll_sprite(meta->tile0->id, 1 * DEFAULT_SCROLL_SPEED, 0);
            scroll_sprite(meta->tile1->id, 1 * DEFAULT_SCROLL_SPEED, 0);
            scroll_sprite(meta->tile2->id, 1 * DEFAULT_SCROLL_SPEED, 0);
            scroll_sprite(meta->tile3->id, 1 * DEFAULT_SCROLL_SPEED, 0);
            break;
        case J_UP:
            scroll_sprite(meta->tile0->id, 0, -1 * DEFAULT_SCROLL_SPEED);
            scroll_sprite(meta->tile1->id, 0, -1 * DEFAULT_SCROLL_SPEED);
            scroll_sprite(meta->tile2->id, 0, -1 * DEFAULT_SCROLL_SPEED);
            scroll_sprite(meta->tile3->id, 0, -1 * DEFAULT_SCROLL_SPEED);
            break;
        case J_DOWN:
            scroll_sprite(meta->tile0->id, 0, 1 * DEFAULT_SCROLL_SPEED);
            scroll_sprite(meta->tile1->id, 0, 1 * DEFAULT_SCROLL_SPEED);
            scroll_sprite(meta->tile2->id, 0, 1 * DEFAULT_SCROLL_SPEED);
            scroll_sprite(meta->tile3->id, 0, 1 * DEFAULT_SCROLL_SPEED);
            break;
    }
    cpu_wait(50); // change to wait function
}