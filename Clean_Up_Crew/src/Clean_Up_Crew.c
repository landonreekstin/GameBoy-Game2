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
#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>
#include "../include/engine/Sprite_Engine.h"
#include "../include/engine/Sound.h"
#include "../include/engine/Map_Engine.h"
#include "../include/engine/System.h"


/***************************************
 * Defines
 * ************************************/


/***************************************
 * Local Prototypes
 * ************************************/
void init_game();
void game_loop();
void render();
void update();
void input();


/***************************************
 * Local Variables
 * ************************************/


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
    // TODO: initialize game

    // TODO: Load the starting map
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

    // TODO: update game state

    // TODO: render game
    render();
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
    // TODO: update game state
}

/**
 * @brief Function for handling input.
 * 
 * @details This function is responsible for handling input.
 * 
 */
void input()
{
    // TODO: handle input
}

