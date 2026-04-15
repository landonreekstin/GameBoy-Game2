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
#include <stdint.h>

/***************************************
 * Defines
 * ************************************/
#define TILE_SIZE 8
#define SCREEN_WIDTH_TILES 20
#define SCREEN_HEIGHT_TILES 18
#define SCREEN_WIDTH_PIXELS 160
#define SCREEN_HEIGHT_PIXELS 144
#define MAX_MAP_WIDTH 32
#define MAX_MAP_HEIGHT 32

// Tile collision types
#define TILE_WALKABLE 0
#define TILE_SOLID    1
#define TILE_WATER    2
#define TILE_DOOR     3

/***************************************
 * Type Definitions
 * ************************************/

/**
 * @brief Map structure for tile-based maps
 */
typedef struct {
    uint8_t width;              // Map width in tiles
    uint8_t height;             // Map height in tiles
    const uint8_t* tile_data;   // Pointer to tile graphics data
    const uint8_t* tile_map;    // Pointer to tile map (which tile at each position)
    const uint8_t* collision_map; // Pointer to collision data (0=walkable, 1=solid, etc.)
    uint8_t tile_count;         // Number of unique tiles in tile_data
} Map;

/**
 * @brief Camera/viewport structure for smooth scrolling
 */
typedef struct {
    uint8_t x;                  // Camera X position in pixels
    uint8_t y;                  // Camera Y position in pixels
    uint8_t target_x;           // Target X to follow (usually player X)
    uint8_t target_y;           // Target Y to follow (usually player Y)
    uint16_t map_width_pixels;  // Map width in pixels (for boundaries) - uint16_t for maps > 255px
    uint16_t map_height_pixels; // Map height in pixels (for boundaries) - uint16_t for maps > 255px
    uint8_t dead_zone;          // Pixels before camera starts following
} Camera;

/***************************************
 * Function Prototypes
 * ************************************/

/**
 * @brief Initializes a map structure
 *
 * @param map Pointer to the map to initialize
 * @param width Map width in tiles
 * @param height Map height in tiles
 * @param tile_data Pointer to tile graphics data
 * @param tile_map Pointer to tile map data
 * @param collision_map Pointer to collision data
 * @param tile_count Number of unique tiles
 *
 * @return void
 */
void map_init(Map* map, uint8_t width, uint8_t height,
              const uint8_t* tile_data, const uint8_t* tile_map,
              const uint8_t* collision_map, uint8_t tile_count);

/**
 * @brief Loads a map into the Game Boy background
 *
 * @param map Pointer to the map to load
 *
 * @return void
 */
void map_load(const Map* map);

/**
 * @brief Gets the collision value at a specific tile position
 *
 * @param map Pointer to the map
 * @param tile_x Tile X coordinate
 * @param tile_y Tile Y coordinate
 *
 * @return uint8_t Collision type (TILE_WALKABLE, TILE_SOLID, etc.)
 */
uint8_t map_get_tile_collision(const Map* map, uint8_t tile_x, uint8_t tile_y);

/**
 * @brief Initializes the camera
 *
 * @param camera Pointer to the camera to initialize
 * @param map Pointer to the map (for boundaries)
 *
 * @return void
 */
void camera_init(Camera* camera, const Map* map);

/**
 * @brief Updates camera position to follow target
 *
 * @param camera Pointer to the camera
 * @param target_x Target X position in pixels
 * @param target_y Target Y position in pixels
 *
 * @return void
 */
void camera_update(Camera* camera, uint8_t target_x, uint8_t target_y);

/**
 * @brief Applies camera position to scroll the background
 *
 * @param camera Pointer to the camera
 *
 * @return void
 */
void camera_apply(const Camera* camera);

#endif // MAP_ENGINE_H