/**
 * @brief Map engine header file. 
 * 
 * @details Contains definitions for the map engine.
 * 
 */

/***************************************
 * Includes
 * ************************************/
#ifndef MAP_ENGINE_H
#define MAP_ENGINE_H
#include <gb/gb.h>

/***************************************
 * Defines
 * ************************************/

/***************************************
 * Function Prototypes
 * ************************************/

/**
 * @brief Sets up the map.
 * 
 * @param mapTile Pointer to the map tile data.
 * 
 * @return void
 */
void map_setup(UINT8* mapTile);

/**
 * @brief Scrolls the map.
 * 
 * @param scrollSpeed_x Scroll speed in the x direction.
 * @param scrollSpeed_y Scroll speed in the y direction.
 * 
 * @return void
 */
void scroll_map(UINT8 scrollSpeed_x, UINT8 scrollSpeed_y);

#endif // MAP_ENGINE_H