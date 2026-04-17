/* CLEAN UP CREW : A PHASMOPHOBIA SEQUEL FOR THE NINTENDO GAMEBOY */

/**
 * @brief Authors: Landon Reekstin - Software Development, Christian Blaney - Artistic Design
 *  
 * 
 * @details This file is the main file for the game. It contains the main game loop and the main function.
 * 
 */

/***************************************
 * Includes
 * ************************************/
/* Engine */
#include "../include/engine/Sprite_Engine.h"
#include "../include/engine/Sound.h"
#include "../include/engine/Map_Engine.h"
#include "../include/engine/System.h"
#include "../include/engine/Debug.h"
/* Gameplay */
#include "../include/gameplay/Players/Player.h"
#include "../include/gameplay/Maps/Test_Map.h"
#include "../include/engine/Entity_Engine.h"
#include "../include/gameplay/Ghost/Ghost.h"
#include <gb/gb.h>
#include <stdint.h>


/***************************************
 * Defines
 * ************************************/


/***************************************
 * Local Prototypes
 * ************************************/
void init_game();
void game_loop();
void update();
void input();


/***************************************
 * Local Variables
 * ************************************/
Map test_map;
Camera main_camera;
uint16_t frame_count = 0;


/***************************************
 * Functions
 * ************************************/


/**
 * @brief Main function for the game.
 * 
 * @details This function initializes the game and starts the main game loop.
 * 
 * @param argc Number of command line arguments. 2
 * 
 * @param argv Array of command line arguments.
 *             argv[0] - Name of the program. "Clean_Up_Crew"
 *             argv[1] - Name of a map file to load on startup. 
 *                       Default: Main Menu
 * 
 * @return int 
 */
int main(int argc, char *argv[]) 
{
    // TODO: initialize game
    init_game();

    // TODO: start game loop
    game_loop();

    return 0;
}

/**
 * @brief Function for initializing the game.
 *
 * @details This function is responsible for initializing the game.
 *
 */
void init_game()
{
    // Initialize the test map
    map_init(&test_map, TEST_MAP_WIDTH, TEST_MAP_HEIGHT,
             test_map_tiles, test_map_data, test_map_collision, TEST_MAP_TILE_COUNT);

    // Load the map into the Game Boy background
    map_load(&test_map);

    // Initialize the camera for the map
    camera_init(&main_camera, &test_map);

    // Set player map boundaries and map pointer for collision detection
    player_map_width = test_map.width;
    player_map_height = test_map.height;
    player_map = &test_map;

    // Create player sprite
    create_player();

    // Initialize entity pool and spawn a test NPC with patrol AI.
    // Reuses PhasmoPlaceholder tiles (already loaded by create_player) — no extra VRAM cost.
    entity_pool_init();
    {
        Entity* npc = entity_spawn(ENTITY_NPC, 32, 64, 0, 4, PhasmoPlaceholder);
        if (npc) {
            entity_set_patrol(npc, 32, 64, 128, 64);
        }
    }

    // Spawn ghost far from the player's starting position
    ghost_spawn(192, 80);

    // Position camera at player's initial world position
    camera_update(&main_camera, player_world_x, player_world_y);
    camera_apply(&main_camera);

    debug_print("Game initialized!");
}

/**
 * @brief Main game loop.
 *
 * @details This function is the main game loop. It is responsible for updating the game state and rendering the game.
 *
 */
void game_loop()
{
    while(1)
    {
        // Handle input
        input();

        // Update game state
        update();

        // Wait for VBlank (prevents screen tearing)
        wait_vbl_done();
    }
}

/**
 * @brief Function for updating the game state.
 *
 * @details This function is responsible for updating the game state.
 *
 */
void update()
{
    frame_count++;

    // Update camera to follow player's WORLD position
    camera_update(&main_camera, player_world_x, player_world_y);
    camera_apply(&main_camera);

    // Update all entities (AI, tile collision, screen position sync)
    entity_update_all(&main_camera, &test_map);

    // Update ghost (separate from entity pool loop)
    ghost_update(&main_camera, &test_map);

    // Sync sprite screen position: world position relative to camera
    set_16x16_meta_position(p_player_sprite,
                            player_world_x - main_camera.x,
                            player_world_y - main_camera.y);

    // More frequent debug output to catch movement issues (every 15 frames)
    if (frame_count % 15 == 0) {
        uint8_t input = joypad();
        debug_print("=== INPUT DEBUG ===");
        debug_print_value("Joypad State", input);
        debug_print_value("Player World X", player_world_x);
        debug_print_value("Player World Y", player_world_y);
        debug_print_value("Camera X", main_camera.x);
        debug_print_value("Camera Y", main_camera.y);
    }
}

/**
 * @brief Function for handling input.
 *
 * @details This function is responsible for handling input.
 *
 */
void input()
{
    move_player();
}

