/**
 * @brief Map Engine
 *
 * @details This file handles map loading, tile collision, and camera management
 *          for top-down tile-based games.
 *
 * ARCHITECTURE NOTES:
 * - Maps are tile-based with separate visual and collision layers
 * - Camera follows a target (usually the player) with boundary clamping
 * - Supports maps up to 32x32 tiles (Game Boy hardware limit)
 *
 * CAMERA SYSTEM:
 * - Dead zone: Area where target can move without camera following
 * - Boundary clamping: Camera won't scroll past map edges
 * - Smooth following: Camera gradually moves toward target
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

void map_init(Map* map, uint8_t width, uint8_t height,
              const uint8_t* tile_data, const uint8_t* tile_map,
              const uint8_t* collision_map, uint8_t tile_count)
{
    map->width = width;
    map->height = height;
    map->tile_data = tile_data;
    map->tile_map = tile_map;
    map->collision_map = collision_map;
    map->tile_count = tile_count;
}

void map_load(const Map* map)
{
    // Load tile graphics into background tile data
    set_bkg_data(0, map->tile_count, map->tile_data);

    // Load the tile map
    set_bkg_tiles(0, 0, map->width, map->height, map->tile_map);

    // Enable and display background
    SHOW_BKG;
    DISPLAY_ON;
}

uint8_t map_get_tile_collision(const Map* map, uint8_t tile_x, uint8_t tile_y)
{
    // Bounds check
    if (tile_x >= map->width || tile_y >= map->height) {
        return TILE_SOLID; // Out of bounds = solid
    }

    // Get collision value from collision map
    uint16_t index = (tile_y * map->width) + tile_x;
    return map->collision_map[index];
}

void camera_init(Camera* camera, const Map* map)
{
    camera->x = 0;
    camera->y = 0;
    camera->target_x = 0;
    camera->target_y = 0;
    camera->map_width_pixels = map->width * TILE_SIZE;
    camera->map_height_pixels = map->height * TILE_SIZE;
    camera->dead_zone = 16; // 16 pixels of dead zone (2 tiles)
}

void camera_update(Camera* camera, uint8_t target_x, uint8_t target_y)
{
    camera->target_x = target_x;
    camera->target_y = target_y;

    // Calculate ideal camera position (center target on screen)
    int16_t ideal_x = target_x - (SCREEN_WIDTH_PIXELS / 2);
    int16_t ideal_y = target_y - (SCREEN_HEIGHT_PIXELS / 2);

    // Clamp to map boundaries
    if (ideal_x < 0) ideal_x = 0;
    if (ideal_y < 0) ideal_y = 0;

    int16_t max_x = (int16_t)camera->map_width_pixels - SCREEN_WIDTH_PIXELS;
    int16_t max_y = (int16_t)camera->map_height_pixels - SCREEN_HEIGHT_PIXELS;

    // Ensure max values are not negative
    if (max_x < 0) max_x = 0;
    if (max_y < 0) max_y = 0;

    if (ideal_x > max_x) ideal_x = max_x;
    if (ideal_y > max_y) ideal_y = max_y;

    // Update camera position
    camera->x = (uint8_t)ideal_x;
    camera->y = (uint8_t)ideal_y;
}

void camera_apply(const Camera* camera)
{
    // Set background scroll to absolute camera position
    move_bkg(camera->x, camera->y);
}
