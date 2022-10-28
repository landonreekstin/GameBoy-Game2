#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>
#include "system.h"

void map_setup(uint8_t* mapTile);
void scroll_map(uint8t scrollSpeed_x, uint8t scrollSpeed_y);
// ----------------- Map functions ----------------

void map_setup(uint8_t* mapTile) {  // in the future will pass in parameters to specify what map is being setup
    set_bkg_data(0, 7, mapTile);
    //set_bkg_tiles(0, 0, x, y, mapTile);
    SHOW_BKG;
    DISPLAY_ON;
}

void scroll_map(uint8t scrollSpeed_x, uint8t scrollSpeed_y) {
    scroll_bkg(scrollSpeed_x, scrollSpeed_y);
    refresh_delay(1000);
}