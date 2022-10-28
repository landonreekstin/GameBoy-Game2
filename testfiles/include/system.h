#include <gb/gb.h>
#include <stdio.h>
#include <stdint.h>

#ifndef SYSTEM_H
#define SYSTEM_H

void cpu_wait(uint8_t ms);

// ----------------- CPU functions ----------------

/** A less CPU intensive delay() using screen refreshes.
 * @param ms Number of ms to delay. */
void cpu_wait(uint8_t ms){
    uint32_t numloops = (ms / 1000) * 60;
    uint8_t i;
    for(i = 0; i < numloops; i++){
        wait_vbl_done();
    }     
}

#endif