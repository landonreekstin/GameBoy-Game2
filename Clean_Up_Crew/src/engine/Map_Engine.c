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

/***************************************
 * Functions
 * ************************************/

void map_setup(uint8_t* mapTile) 
{  // in the future will pass in parameters to specify what map is being setup
    set_bkg_data(0, 7, mapTile);
    //set_bkg_tiles(0, 0, x, y, mapTile);
    SHOW_BKG;
    DISPLAY_ON;
}

void scroll_map(uint8_t scrollSpeed_x, uint8_t scrollSpeed_y) 
{
    scroll_bkg(scrollSpeed_x, scrollSpeed_y);
    cpu_wait(1000);
}