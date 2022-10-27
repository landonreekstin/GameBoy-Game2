/* This file is a testing and learning example for using the gbdk library 
Author: Landon Reekstin
Sprite design: Christian Blaney
*/

#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>
#include "sprites.h"
#include "sprites.c"


// ----------------- Map functions ----------------
/*

void map_setup() {  // in the future will pass in parameters to specify what map is being setup
    set_bkg_data(0, 7, maptilesname);
    set_bkg_tiles(0, 0, x, y, mapname);
    SHOW_BKG;
    DISPLAY_ON;
}

void scroll_map() {
    scroll_bkg(1, 0);
    delay(100);
}
*/

// ----------------- CPU functions ----------------

/** A less CPU intensive delay() using screen refreshes.
 * @param numloops Number of screen refreshes to perform. */
void wait(UINT8 numloops){
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}


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

    sprite_constructor(guyPtr, 0, 0, 5, 84, 78, 0, 10);

    printf("My first \nGameBoy game!");
    sprite_setup(guyPtr, SmileToSurprised);
    event_loop();
}