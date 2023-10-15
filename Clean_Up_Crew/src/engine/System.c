/** 
 * @brief System calls.
 * 
 * @details This file is responsible for handling system calls.
*/

/***************************************
 * Includes
 * ************************************/
#include "../../include/engine/System.h"
#include <gb/gb.h>

/***************************************
 * Functions
 * ************************************/
void cpu_wait(UINT16 ms)
{
    UINT32 numloops = (ms / 1000) * 60;
    UINT8 i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

void render(void)
{
    // TODO: render game
    SHOW_SPRITES;
}