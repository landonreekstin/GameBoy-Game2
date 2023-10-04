/**
 * @brief Sprite Engine
 * 
 * @details This file is responsible for handling sprite related functions.
*/

/***************************************
 * Includes
 * ************************************/
#include "Sprite_Engine.h"
#include "System.h"

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

void init_sprite(Sprite* sprite, uint8_t id, uint8_t init_tile, uint8_t max_tile, uint8_t x, uint8_t y, uint8_t velocity, bool is_visible, bool has_hitbox)
{
    sprite->id = id;
    sprite->init_tile = init_tile;
    sprite->max_tile = max_tile;
    sprite->x = x;
    sprite->y = y;
    sprite->velocity = velocity;
    sprite->is_visible = is_visible;
    sprite->has_hitbox = has_hitbox;
}

void init_16x16_meta(MetaSprite16x16* meta, uint8_t meta_id, uint8_t init_tile, uint8_t max_tile, uint8_t texture_idx, 
                    uint8_t x, uint8_t y, uint8_t velocity, bool is_visible, bool has_hitbox,
                    Sprite* tile0, Sprite* tile1, Sprite* tile2, Sprite* tile3)
{
    meta->meta_id = meta_id;
    meta->init_tile = init_tile;
    meta->max_tile = max_tile;
    meta->texture_idx = texture_idx;
    meta->x = x;
    meta->y = y;
    meta->velocity = velocity;
    meta->is_visible = is_visible;
    meta->has_hitbox = has_hitbox;

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
    init_sprite(meta->tile0, meta->tile0->id, meta->tile0->init_tile, meta->tile0->max_tile, 
                meta->tile0->x, meta->tile0->y, DEFAULT_SCROLL_SPEED, is_visible, has_hitbox);
    init_sprite(meta->tile1, meta->tile1->id, meta->tile1->init_tile, meta->tile1->max_tile, 
                meta->tile1->x, meta->tile1->y, DEFAULT_SCROLL_SPEED, is_visible, has_hitbox);
    init_sprite(meta->tile2, meta->tile2->id, meta->tile2->init_tile, meta->tile2->max_tile, 
                meta->tile2->x, meta->tile2->y, DEFAULT_SCROLL_SPEED, is_visible, has_hitbox);
    init_sprite(meta->tile3, meta->tile3->id, meta->tile3->init_tile, meta->tile3->max_tile, 
                meta->tile3->x, meta->tile3->y, DEFAULT_SCROLL_SPEED, is_visible, has_hitbox);
}

void setup_sprite(Sprite *s, unsigned char pixels[]) 
{   
    set_sprite_data(s->init_tile, s->max_tile, pixels);    // (initial tile, final tile, sprite char array)
    set_sprite_tile(s->id, s->init_tile);                  // (sprite index, tile), gives sprite its id
    move_sprite(0, s->x, s->y);                            // (sprite index, x, y)
}

void setup_16x16_meta(MetaSprite16x16 *meta, unsigned char pixels[]) 
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
}

void change_sprite_tile(Sprite *s) 
{
    //Sprite s = &ps;
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

void translate_sprite(Sprite *s) {
    
    switch(joypad()) {
        case J_LEFT:
            scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
            change_sprite_tile(s);
            break;
        case J_RIGHT:
            scroll_sprite(s->id, 1 * DEFAULT_SCROLL_SPEED, 0);
            change_sprite_tile(s);
            break;
        case J_UP:
            scroll_sprite(s->id, 0, -1 * DEFAULT_SCROLL_SPEED);
            change_sprite_tile(s);
            break;
        case J_DOWN:
            scroll_sprite(s->id, 0, 1 * DEFAULT_SCROLL_SPEED);
            change_sprite_tile(s);
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
    cpu_wait(5000); // change to wait function
}