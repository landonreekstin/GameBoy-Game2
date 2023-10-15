;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Player
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _setup_16x16_meta
	.globl _translate_16x16_meta
	.globl _set_16x16_meta_hitbox
	.globl _set_16x16_meta_visibility
	.globl _set_16x16_meta_velocity
	.globl _set_16x16_meta_position
	.globl _init_16x16_meta_old
	.globl _init_16x16_meta
	.globl _PhasmoPlaceholder
	.globl _p_player_sprite
	.globl _p_player_sub_tile3
	.globl _p_player_sub_tile2
	.globl _p_player_sub_tile1
	.globl _p_player_sub_tile0
	.globl _player_sprite
	.globl _player_sub_tile3
	.globl _player_sub_tile2
	.globl _player_sub_tile1
	.globl _player_sub_tile0
	.globl _create_player
	.globl _create_player_old
	.globl _move_player
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
G$player_sub_tile0$0_0$0==.
_player_sub_tile0::
	.ds 8
G$player_sub_tile1$0_0$0==.
_player_sub_tile1::
	.ds 8
G$player_sub_tile2$0_0$0==.
_player_sub_tile2::
	.ds 8
G$player_sub_tile3$0_0$0==.
_player_sub_tile3::
	.ds 8
G$player_sprite$0_0$0==.
_player_sprite::
	.ds 17
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _INITIALIZED
G$p_player_sub_tile0$0_0$0==.
_p_player_sub_tile0::
	.ds 2
G$p_player_sub_tile1$0_0$0==.
_p_player_sub_tile1::
	.ds 2
G$p_player_sub_tile2$0_0$0==.
_p_player_sub_tile2::
	.ds 2
G$p_player_sub_tile3$0_0$0==.
_p_player_sub_tile3::
	.ds 2
G$p_player_sprite$0_0$0==.
_p_player_sprite::
	.ds 2
G$PhasmoPlaceholder$0_0$0==.
_PhasmoPlaceholder::
	.ds 64
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
	G$create_player$0$0	= .
	.globl	G$create_player$0$0
	C$Player.c$42$0_0$123	= .
	.globl	C$Player.c$42$0_0$123
;src/gameplay/Players/Player.c:42: void create_player(void)
;	---------------------------------
; Function create_player
; ---------------------------------
_create_player::
	C$Player.c$46$1_0$123	= .
	.globl	C$Player.c$46$1_0$123
;src/gameplay/Players/Player.c:46: set_16x16_meta_position(p_player_sprite, PLAYER_INIT_X, PLAYER_INIT_Y);
	ld	hl, #0x3232
	push	hl
	ld	hl, #_p_player_sprite
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_set_16x16_meta_position
	add	sp, #4
	C$Player.c$47$1_0$123	= .
	.globl	C$Player.c$47$1_0$123
;src/gameplay/Players/Player.c:47: set_16x16_meta_velocity(p_player_sprite, PLAYER_INIT_VELOCITY);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_p_player_sprite
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_set_16x16_meta_velocity
	add	sp, #3
	C$Player.c$48$1_0$123	= .
	.globl	C$Player.c$48$1_0$123
;src/gameplay/Players/Player.c:48: set_16x16_meta_visibility(p_player_sprite, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_p_player_sprite
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_set_16x16_meta_visibility
	add	sp, #3
	C$Player.c$49$1_0$123	= .
	.globl	C$Player.c$49$1_0$123
;src/gameplay/Players/Player.c:49: set_16x16_meta_hitbox(p_player_sprite, 1);
	ld	a, #0x01
	push	af
	inc	sp
	ld	hl, #_p_player_sprite
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_set_16x16_meta_hitbox
	add	sp, #3
	C$Player.c$51$1_0$123	= .
	.globl	C$Player.c$51$1_0$123
;src/gameplay/Players/Player.c:51: init_16x16_meta(p_player_sprite, PLAYER_SPRITE_ID, PLAYER_INIT_TILE, PLAYER_MAX_TILE, PLAYER_TEXTURE_IDX, 
	ld	hl, #_p_player_sub_tile3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_p_player_sub_tile2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_p_player_sub_tile1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_p_player_sub_tile0
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #0x04
	push	hl
	xor	a, a
	rrca
	push	af
	ld	hl, #_p_player_sprite
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_init_16x16_meta
	add	sp, #14
	C$Player.c$59$1_0$123	= .
	.globl	C$Player.c$59$1_0$123
;src/gameplay/Players/Player.c:59: setup_16x16_meta(p_player_sprite, PhasmoPlaceholder);  
	ld	de, #_PhasmoPlaceholder
	push	de
	ld	hl, #_p_player_sprite
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_setup_16x16_meta
	add	sp, #4
	C$Player.c$60$1_0$123	= .
	.globl	C$Player.c$60$1_0$123
;src/gameplay/Players/Player.c:60: }
	C$Player.c$60$1_0$123	= .
	.globl	C$Player.c$60$1_0$123
	XG$create_player$0$0	= .
	.globl	XG$create_player$0$0
	ret
	G$create_player_old$0$0	= .
	.globl	G$create_player_old$0$0
	C$Player.c$62$1_0$125	= .
	.globl	C$Player.c$62$1_0$125
;src/gameplay/Players/Player.c:62: void create_player_old(void)
;	---------------------------------
; Function create_player_old
; ---------------------------------
_create_player_old::
	C$Player.c$64$1_0$125	= .
	.globl	C$Player.c$64$1_0$125
;src/gameplay/Players/Player.c:64: init_16x16_meta_old(p_player_sprite, 0, 0, 4, 0, 50, 50, p_player_sub_tile0, p_player_sub_tile1, p_player_sub_tile2, p_player_sub_tile3);
	ld	hl, #_p_player_sub_tile3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_p_player_sub_tile2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_p_player_sub_tile1
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #_p_player_sub_tile0
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ld	hl, #0x3232
	push	hl
	ld	hl, #0x04
	push	hl
	xor	a, a
	rrca
	push	af
	ld	hl, #_p_player_sprite
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_init_16x16_meta_old
	add	sp, #16
	C$Player.c$66$1_0$125	= .
	.globl	C$Player.c$66$1_0$125
;src/gameplay/Players/Player.c:66: setup_16x16_meta(p_player_sprite, PhasmoPlaceholder);  
	ld	de, #_PhasmoPlaceholder
	push	de
	ld	hl, #_p_player_sprite
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_setup_16x16_meta
	add	sp, #4
	C$Player.c$67$1_0$125	= .
	.globl	C$Player.c$67$1_0$125
;src/gameplay/Players/Player.c:67: }
	C$Player.c$67$1_0$125	= .
	.globl	C$Player.c$67$1_0$125
	XG$create_player_old$0$0	= .
	.globl	XG$create_player_old$0$0
	ret
	G$move_player$0$0	= .
	.globl	G$move_player$0$0
	C$Player.c$69$1_0$127	= .
	.globl	C$Player.c$69$1_0$127
;src/gameplay/Players/Player.c:69: inline void move_player(void)
;	---------------------------------
; Function move_player
; ---------------------------------
_move_player::
	C$Player.c$71$1_0$127	= .
	.globl	C$Player.c$71$1_0$127
;src/gameplay/Players/Player.c:71: translate_16x16_meta(p_player_sprite);
	ld	hl, #_p_player_sprite
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_translate_16x16_meta
	pop	hl
	C$Player.c$72$1_0$127	= .
	.globl	C$Player.c$72$1_0$127
;src/gameplay/Players/Player.c:72: }
	C$Player.c$72$1_0$127	= .
	.globl	C$Player.c$72$1_0$127
	XG$move_player$0$0	= .
	.globl	XG$move_player$0$0
	ret
	.area _CODE
	.area _INITIALIZER
FPlayer$__xinit_p_player_sub_tile0$0_0$0 == .
__xinit__p_player_sub_tile0:
	.dw _player_sub_tile0
FPlayer$__xinit_p_player_sub_tile1$0_0$0 == .
__xinit__p_player_sub_tile1:
	.dw _player_sub_tile1
FPlayer$__xinit_p_player_sub_tile2$0_0$0 == .
__xinit__p_player_sub_tile2:
	.dw _player_sub_tile2
FPlayer$__xinit_p_player_sub_tile3$0_0$0 == .
__xinit__p_player_sub_tile3:
	.dw _player_sub_tile3
FPlayer$__xinit_p_player_sprite$0_0$0 == .
__xinit__p_player_sprite:
	.dw _player_sprite
FPlayer$__xinit_PhasmoPlaceholder$0_0$0 == .
__xinit__PhasmoPlaceholder:
	.db #0x00	; 0
	.db #0x1f	; 31
	.db #0x0e	; 14
	.db #0x31	; 49	'1'
	.db #0x1f	; 31
	.db #0x20	; 32
	.db #0x00	; 0
	.db #0x3f	; 63
	.db #0x1f	; 31
	.db #0x23	; 35
	.db #0x0f	; 15
	.db #0x33	; 51	'3'
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x00	; 0
	.db #0xf0	; 240
	.db #0x30	; 48	'0'
	.db #0xc8	; 200
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0x00	; 0
	.db #0xff	; 255
	.db #0xf8	; 248
	.db #0x34	; 52	'4'
	.db #0xf8	; 248
	.db #0x34	; 52	'4'
	.db #0xf8	; 248
	.db #0x04	; 4
	.db #0xf0	; 240
	.db #0x0c	; 12
	.db #0xe0	; 224
	.db #0x18	; 24
	.db #0x80	; 128
	.db #0x70	; 112	'p'
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0x40	; 64
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0f	; 15
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x0f	; 15
	.db #0x10	; 16
	.db #0x07	; 7
	.db #0x18	; 24
	.db #0x07	; 7
	.db #0x08	; 8
	.db #0x00	; 0
	.db #0x0f	; 15
	.area _CABS (ABS)
