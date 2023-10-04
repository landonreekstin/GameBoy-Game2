/** 
 * @brief System calls header file.
 * 
*/

/***************************************
 * Includes
 * ************************************/
#ifndef SYSTEM_H
#define SYSTEM_H
#include <gb/gb.h>

/*********************************
 * Function Prototype(s)
 *********************************/

/** 
 * @brief A less CPU intensive delay() using screen refreshes.
 * 
 * @param ms Number of ms to delay. 
 * 
 * @return void
*/
void cpu_wait(uint8_t ms);

/**
 * @brief Function for rendering the game.
 * 
 * @details This function is responsible for rendering the game.
 * 
 */
void render(void);

#endif // SYSTEM_H