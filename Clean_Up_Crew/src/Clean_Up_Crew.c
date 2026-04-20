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
#include "../include/gameplay/Maps/Haunted_House.h"
#include "../include/engine/Entity_Engine.h"
#include "../include/gameplay/Ghost/Ghost.h"
#include "../include/gameplay/Sanity/Sanity.h"
#include "../include/gameplay/GameState/GameState.h"
#include "../include/gameplay/Inventory/Inventory.h"
#include "../include/gameplay/Evidence/Evidence.h"
#include "../include/gameplay/Items/ItemSprites.h"
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
void check_item_pickups();


/***************************************
 * Local Variables
 * ************************************/
Map haunted_house_map;
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
    init_game();
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
    Entity* e;

    // Initialize the Haunted House map
    map_init(&haunted_house_map, HAUNTED_HOUSE_WIDTH, HAUNTED_HOUSE_HEIGHT,
             haunted_house_tiles, haunted_house_data, haunted_house_collision,
             HAUNTED_HOUSE_TILE_COUNT);

    // Load the map into the Game Boy background
    map_load(&haunted_house_map);

    // Initialize the camera for the map
    camera_init(&main_camera, &haunted_house_map);

    // Set player map boundaries and map pointer for collision detection
    player_map_width  = haunted_house_map.width;
    player_map_height = haunted_house_map.height;
    player_map        = &haunted_house_map;

    // Create player sprite
    create_player();

    // Initialize all game systems
    entity_pool_init();
    gamestate_init();
    sanity_init();
    inventory_init();

    // Spawn item entities at their room positions.
    // ai_dir is repurposed to store the item subtype (ITEM_SUBTYPE_*).
    // init_tile values map to sprite VRAM slots 8-23.
    e = entity_spawn(ENTITY_ITEM, 160,  40, ITEM_SPRITE_EMF_INIT_TILE,   4, EMFReaderSprite);
    if (e) e->ai_dir = ITEM_SUBTYPE_EMF;

    e = entity_spawn(ENTITY_ITEM,  64, 144, ITEM_SPRITE_FLASH_INIT_TILE, 4, FlashlightSprite);
    if (e) e->ai_dir = ITEM_SUBTYPE_FLASHLIGHT;

    e = entity_spawn(ENTITY_ITEM, 176, 128, ITEM_SPRITE_THERM_INIT_TILE, 4, ThermometerSprite);
    if (e) e->ai_dir = ITEM_SUBTYPE_THERMOMETER;

    e = entity_spawn(ENTITY_ITEM, 160, 216, ITEM_SPRITE_SBOX_INIT_TILE,  4, SpiritBoxSprite);
    if (e) e->ai_dir = ITEM_SUBTYPE_SPIRIT_BOX;

    // Spawn ghost in Library; pseudo-random ghost type from frame_count boot seed
    ghost_spawn(200, 136);

    // Assign ghost type after entity pool is populated (evidence_init reads ghost_type)
    evidence_init((uint8_t)((frame_count & 3) + 1));

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
        if (game_state != GAME_PLAYING) {
            // Freeze on win/lose — Phase 5 will add proper screens
            if (game_state == GAME_WIN)  debug_print("YOU WIN!");
            if (game_state == GAME_LOSE) debug_print("GAME OVER");
            while(1) { wait_vbl_done(); }
        }

        input();
        update();
        wait_vbl_done();
    }
}

/**
 * @brief Scans entity pool for ENTITY_ITEM entries and picks them up on player contact.
 */
void check_item_pickups()
{
    uint8_t i;
    for (i = 0; i < ENTITY_POOL_SIZE; i++) {
        Entity* e = &entity_pool[i];
        if (e->type != ENTITY_ITEM) continue;
        if (entity_collides_player(e, player_world_x, player_world_y)) {
            inventory_add(e->ai_dir);
            entity_despawn(e);
        }
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
    uint8_t ghost_hit;

    frame_count++;

    // Update camera to follow player's WORLD position
    camera_update(&main_camera, player_world_x, player_world_y);
    camera_apply(&main_camera);

    // Update all entities (AI, tile collision, screen position sync)
    entity_update_all(&main_camera, &haunted_house_map);

    // Update ghost; returns 1 if it caught the player this frame
    ghost_hit = ghost_update(&main_camera, &haunted_house_map);

    // Sync sprite screen position: world position relative to camera
    set_16x16_meta_position(p_player_sprite,
                            player_world_x - main_camera.x,
                            player_world_y - main_camera.y);

    // Check for item pickups
    check_item_pickups();

    // Update room tracking and sanity
    player_current_room = get_player_room(player_world_x, player_world_y);
    sanity_update(is_player_in_dark(), ghost_hit);

    // Lose condition: sanity drained to zero
    if (player_sanity == 0) {
        game_set_state(GAME_LOSE);
        return;
    }

    // Periodic debug output (every 15 frames)
    if (frame_count % 15 == 0) {
        debug_print_value("Player World X",    player_world_x);
        debug_print_value("Player World Y",    player_world_y);
        debug_print_value("player_sanity",     player_sanity);
        debug_print_value("player_room",       player_current_room);
        debug_print_value("evidence_mask",     evidence_collected);
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
