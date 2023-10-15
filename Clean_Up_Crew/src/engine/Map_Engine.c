/**
 * @brief Map Engine
 * 
 * @details This file is responsible for handling map related functions.
*/

/***************************************
 * Includes
 * ************************************/
#include "../../include/engine/Map_Engine.h"
#include "../../include/engine/System.h"
#include <gb/gb.h>

/***************************************
 * Functions
 * ************************************/

void map_setup(UINT8* mapTile) 
{  // in the future will pass in parameters to specify what map is being setup
    set_bkg_data(0, 7, mapTile);
    //set_bkg_tiles(0, 0, x, y, mapTile);
    SHOW_BKG;
    DISPLAY_ON;
}

void scroll_map(UINT8 scrollSpeed_x, UINT8 scrollSpeed_y) 
{
    scroll_bkg(scrollSpeed_x, scrollSpeed_y);
    cpu_wait(1000);
}