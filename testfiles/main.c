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
void event_loop() {
    uint8_t currentSpriteIdx = 0;
    
    while(1) {

        translate_sprite(0);
        //animate_sprite(0);

    }
}

void main() {
    //struct Sprite *guyPtr = malloc (sizeof (struct Sprite));;
    Sprite guy;      // Make struct object
    Sprite* guyPtr;   // Make pointer
    guyPtr = &guy;           // Assign pointer to object

    Sprite meta;
    Sprite* metaPtr;
    metaPtr = &meta;

    initSprite(metaPtr, 0, testMeta, 4, 0, 5, 84, 78, 16, 16, 0, 10);

    printf("My first \nGameBoy game!");
    //sprite_setup(guyPtr, SmileToSurprised);
    sprite_setup(metaPtr, testMeta);
    event_loop();
}