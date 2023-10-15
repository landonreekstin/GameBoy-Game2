/** 
 * @brief The Sound file is used to play sounds in the game.
 * 
 * @details The Sound file is used to play sounds in the game. It is a wrapper for the Gameboy sound registers.
*/

/***************************************
 * Includes
 * ************************************/
#include "../../include/engine/Sound.h"
#include <gb/gb.h>

/***************************************
 * Functions
 * ************************************/

void sound_setup(void) 
{
    NR52_REG = 0x80; // enable sound
    NR50_REG = 0x77; // set volume for both channels to max
    NR51_REG = 0xFF; // select channels to use
}

void play_sound(Sound *s) 
{
    NR10_REG = s-> freqSweep;
    NR11_REG = s-> dutyAndLength;
    NR12_REG = s-> volEnvelope;
    NR13_REG = s-> freqlsb;
    NR14_REG = s-> pbAndFreqMsb;
}