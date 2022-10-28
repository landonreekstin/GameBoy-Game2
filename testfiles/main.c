/* This file is a testing and learning example for using the gbdk library 
Author: Landon Reekstin
Sprite design: Christian Blaney
*/

#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>
#include "sprites.h"
#include "system.h"
#include "sprites.c"



// ----------------- Game functions ----------------

// main game event loop
void event_loop(MetaSprite16x16* meta) {
    uint8_t currentSpriteIdx = 0;
    
    while(1) {

        translate_16x16_meta(meta);
        //animate_sprite(0);

    }
}

void main() {
    Sprite guy;       // Make struct object
    Sprite* guyPtr;   // Make pointer
    guyPtr = &guy;

    MetaSprite16x16 meta;
    MetaSprite16x16* metaPtr;
    metaPtr = &meta;
    Sprite sub_tile0;
    Sprite sub_tile1;
    Sprite sub_tile2;
    Sprite sub_tile3;
    Sprite* sub_tile0Ptr = &sub_tile0;
    Sprite* sub_tile1Ptr = &sub_tile1;
    Sprite* sub_tile2Ptr = &sub_tile2;
    Sprite* sub_tile3Ptr = &sub_tile3;
    

    // initialize  meta 16x16 sprite
    init_16x16_meta(metaPtr, 0, 0, 4, 0, 50, 50, sub_tile0Ptr, sub_tile1Ptr, sub_tile2Ptr, sub_tile3Ptr);


    printf("My first \nGameBoy game!");     // delete in future, stdio wastes memory, implement own text tiles
    //sprite_setup(guyPtr, SmileToSurprised);
    setup_16x16_meta(metaPtr, Tomcat_pixels);
    event_loop(metaPtr);
}