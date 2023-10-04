/** 
 * @brief The Sound file is used to play sounds in the game.
 * 
 * @details The Sound file is used to play sounds in the game. It is a wrapper for the Gameboy sound registers.
*/

/***************************************
 * Includes
 * ************************************/
#ifndef SOUND_H
#define SOUND_H
#include <gb/gb.h>

/***************************************
 * Defines
 * ************************************/

typedef struct {
  uint8_t freqSweep;
  uint8_t dutyAndLength;
  uint8_t volEnvelope;
  uint8_t freqlsb;
  uint8_t pbAndFreqMsb;
} Sound;

/***************************************
 * Function Prototypes
 * ************************************/

/**
* @brief Sets up the sound. Run once to enable sound.
* 
* @return void
*/
void sound_setup(void);

/** 
 * @brief Plays the sound with attributes saved as Sound struct s.
 * 
 * @param s Sound struct to play 
 * 
 * @return void
*/
void play_sound(Sound *s);