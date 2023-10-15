;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Map_Engine
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _cpu_wait
	.globl _set_bkg_data
	.globl _map_setup
	.globl _scroll_map
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
	G$map_setup$0$0	= .
	.globl	G$map_setup$0$0
	C$Map_Engine.c$18$0_0$103	= .
	.globl	C$Map_Engine.c$18$0_0$103
;src/engine/Map_Engine.c:18: void map_setup(UINT8* mapTile) 
;	---------------------------------
; Function map_setup
; ---------------------------------
_map_setup::
	C$Map_Engine.c$20$1_0$103	= .
	.globl	C$Map_Engine.c$20$1_0$103
;src/engine/Map_Engine.c:20: set_bkg_data(0, 7, mapTile);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #0x700
	push	hl
	call	_set_bkg_data
	add	sp, #4
	C$Map_Engine.c$22$1_0$103	= .
	.globl	C$Map_Engine.c$22$1_0$103
;src/engine/Map_Engine.c:22: SHOW_BKG;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x01
	ldh	(_LCDC_REG + 0), a
	C$Map_Engine.c$23$1_0$103	= .
	.globl	C$Map_Engine.c$23$1_0$103
;src/engine/Map_Engine.c:23: DISPLAY_ON;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x80
	ldh	(_LCDC_REG + 0), a
	C$Map_Engine.c$24$1_0$103	= .
	.globl	C$Map_Engine.c$24$1_0$103
;src/engine/Map_Engine.c:24: }
	C$Map_Engine.c$24$1_0$103	= .
	.globl	C$Map_Engine.c$24$1_0$103
	XG$map_setup$0$0	= .
	.globl	XG$map_setup$0$0
	ret
	G$scroll_map$0$0	= .
	.globl	G$scroll_map$0$0
	C$Map_Engine.c$26$1_0$105	= .
	.globl	C$Map_Engine.c$26$1_0$105
;src/engine/Map_Engine.c:26: void scroll_map(UINT8 scrollSpeed_x, UINT8 scrollSpeed_y) 
;	---------------------------------
; Function scroll_map
; ---------------------------------
_scroll_map::
;src/engine/Map_Engine.c:28: scroll_bkg(scrollSpeed_x, scrollSpeed_y);
	ldhl	sp,	#3
	ld	a, (hl-)
	ld	c, a
	ld	b, (hl)
;C:/gbdk/include/gb/gb.h:1094: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG + 0)
	add	a, b
	ldh	(_SCX_REG + 0), a
	ldh	a, (_SCY_REG + 0)
	add	a, c
	ldh	(_SCY_REG + 0), a
	C$Map_Engine.c$29$1_0$105	= .
	.globl	C$Map_Engine.c$29$1_0$105
;src/engine/Map_Engine.c:29: cpu_wait(1000);
	ld	de, #0x03e8
	push	de
	call	_cpu_wait
	pop	hl
	C$Map_Engine.c$30$1_0$105	= .
	.globl	C$Map_Engine.c$30$1_0$105
;src/engine/Map_Engine.c:30: }
	C$Map_Engine.c$30$1_0$105	= .
	.globl	C$Map_Engine.c$30$1_0$105
	XG$scroll_map$0$0	= .
	.globl	XG$scroll_map$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
