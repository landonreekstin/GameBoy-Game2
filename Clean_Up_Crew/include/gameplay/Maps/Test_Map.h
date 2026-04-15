/**
 * @brief Test Map Header
 *
 * @details Provides access to test map data for camera/engine testing
 */

#ifndef TEST_MAP_H
#define TEST_MAP_H

#include "../../engine/Map_Engine.h"
#include <stdint.h>

/***************************************
 * Defines
 * ************************************/
#define TEST_MAP_WIDTH  32
#define TEST_MAP_HEIGHT 32
#define TEST_MAP_TILE_COUNT 3

/***************************************
 * External Data
 * ************************************/
extern const uint8_t test_map_tiles[];
extern const uint8_t test_map_data[];
extern const uint8_t test_map_collision[];

#endif // TEST_MAP_H
