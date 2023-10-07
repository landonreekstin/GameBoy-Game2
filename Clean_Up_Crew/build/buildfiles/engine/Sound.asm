;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Sound
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _sound_setup
	.globl _play_sound
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
	G$sound_setup$0$0	= .
	.globl	G$sound_setup$0$0
	C$Sound.c$16$0_0$100	= .
	.globl	C$Sound.c$16$0_0$100
;src/engine/Sound.c:16: void sound_setup() 
;	---------------------------------
; Function sound_setup
; ---------------------------------
_sound_setup::
	C$Sound.c$18$1_0$100	= .
	.globl	C$Sound.c$18$1_0$100
;src/engine/Sound.c:18: NR52_REG = 0x80; // enable sound
	ld	a, #0x80
	ldh	(_NR52_REG + 0), a
	C$Sound.c$19$1_0$100	= .
	.globl	C$Sound.c$19$1_0$100
;src/engine/Sound.c:19: NR50_REG = 0x77; // set volume for both channels to max
	ld	a, #0x77
	ldh	(_NR50_REG + 0), a
	C$Sound.c$20$1_0$100	= .
	.globl	C$Sound.c$20$1_0$100
;src/engine/Sound.c:20: NR51_REG = 0xFF; // select channels to use
	ld	a, #0xff
	ldh	(_NR51_REG + 0), a
	C$Sound.c$21$1_0$100	= .
	.globl	C$Sound.c$21$1_0$100
;src/engine/Sound.c:21: }
	C$Sound.c$21$1_0$100	= .
	.globl	C$Sound.c$21$1_0$100
	XG$sound_setup$0$0	= .
	.globl	XG$sound_setup$0$0
	ret
	G$play_sound$0$0	= .
	.globl	G$play_sound$0$0
	C$Sound.c$23$1_0$102	= .
	.globl	C$Sound.c$23$1_0$102
;src/engine/Sound.c:23: void play_sound(Sound *s) 
;	---------------------------------
; Function play_sound
; ---------------------------------
_play_sound::
	C$Sound.c$25$1_0$102	= .
	.globl	C$Sound.c$25$1_0$102
;src/engine/Sound.c:25: NR10_REG = s-> freqSweep;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ldh	(_NR10_REG + 0), a
	C$Sound.c$26$1_0$102	= .
	.globl	C$Sound.c$26$1_0$102
;src/engine/Sound.c:26: NR11_REG = s-> dutyAndLength;
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	ldh	(_NR11_REG + 0), a
	C$Sound.c$27$1_0$102	= .
	.globl	C$Sound.c$27$1_0$102
;src/engine/Sound.c:27: NR12_REG = s-> volEnvelope;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ldh	(_NR12_REG + 0), a
	C$Sound.c$28$1_0$102	= .
	.globl	C$Sound.c$28$1_0$102
;src/engine/Sound.c:28: NR13_REG = s-> freqlsb;
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ldh	(_NR13_REG + 0), a
	C$Sound.c$29$1_0$102	= .
	.globl	C$Sound.c$29$1_0$102
;src/engine/Sound.c:29: NR14_REG = s-> pbAndFreqMsb;
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ldh	(_NR14_REG + 0), a
	C$Sound.c$30$1_0$102	= .
	.globl	C$Sound.c$30$1_0$102
;src/engine/Sound.c:30: }
	C$Sound.c$30$1_0$102	= .
	.globl	C$Sound.c$30$1_0$102
	XG$play_sound$0$0	= .
	.globl	XG$play_sound$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
