/** 
 * @brief System calls.
 * 
 * @details This file is responsible for handling system calls.
*/

/***************************************
 * Includes
 * ************************************/
#include "System.h"

/***************************************
 * Functions
 * ************************************/
void cpu_wait(uint8_t ms)
{
    uint32_t numloops = (ms / 1000) * 60;
    uint8_t i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void render()
{
    // TODO: render game
    SHOW_SPRITES;
}