/**
 * @brief Debug utilities for development
 *
 * @details Provides debugging output for Emulicious and testing
 */

#ifndef DEBUG_H
#define DEBUG_H

#include <gb/gb.h>
#include <stdint.h>
#include <stdio.h>

/***************************************
 * Defines
 * ************************************/
#define DEBUG_ENABLED 1

/***************************************
 * Function Prototypes
 * ************************************/

#if DEBUG_ENABLED

/**
 * @brief Print debug message to Emulicious console
 *
 * @param msg Message to print
 */
void debug_print(const char* msg);

/**
 * @brief Print debug value to Emulicious console
 *
 * @param label Label for the value
 * @param value Value to print
 */
void debug_print_value(const char* label, uint16_t value);

/**
 * @brief Print camera debug info
 *
 * @param camera Pointer to camera
 */
void debug_print_camera(const void* camera);

#else
// No-op macros when debugging is disabled
#define debug_print(msg)
#define debug_print_value(label, value)
#define debug_print_camera(camera)
#endif

#endif // DEBUG_H
