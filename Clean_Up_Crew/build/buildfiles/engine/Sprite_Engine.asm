;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Sprite_Engine
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _animate_sprite
	.globl _cpu_wait
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _init_sprite
	.globl _init_sprite_old
	.globl _init_16x16_meta
	.globl _init_16x16_meta_old
	.globl _set_sprite_position
	.globl _set_sprite_velocity
	.globl _set_sprite_visibility
	.globl _set_sprite_hitbox
	.globl _set_16x16_meta_position
	.globl _set_16x16_meta_velocity
	.globl _set_16x16_meta_visibility
	.globl _set_16x16_meta_hitbox
	.globl _setup_sprite
	.globl _setup_16x16_meta
	.globl _change_sprite_tile
	.globl _translate_sprite
	.globl _translate_16x16_meta
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
	G$init_sprite$0$0	= .
	.globl	G$init_sprite$0$0
	C$Sprite_Engine.c$33$0_0$124	= .
	.globl	C$Sprite_Engine.c$33$0_0$124
;src/engine/Sprite_Engine.c:33: void init_sprite(Sprite* sprite, UINT8 id, UINT8 init_tile, UINT8 max_tile)
;	---------------------------------
; Function init_sprite
; ---------------------------------
_init_sprite::
	C$Sprite_Engine.c$35$1_0$124	= .
	.globl	C$Sprite_Engine.c$35$1_0$124
;src/engine/Sprite_Engine.c:35: sprite->id = id;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	C$Sprite_Engine.c$36$1_0$124	= .
	.globl	C$Sprite_Engine.c$36$1_0$124
;src/engine/Sprite_Engine.c:36: sprite->init_tile = init_tile;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	C$Sprite_Engine.c$37$1_0$124	= .
	.globl	C$Sprite_Engine.c$37$1_0$124
;src/engine/Sprite_Engine.c:37: sprite->max_tile = max_tile;
	ld	a, (hl+)
	ld	(de), a
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$38$1_0$124	= .
	.globl	C$Sprite_Engine.c$38$1_0$124
;src/engine/Sprite_Engine.c:38: }
	C$Sprite_Engine.c$38$1_0$124	= .
	.globl	C$Sprite_Engine.c$38$1_0$124
	XG$init_sprite$0$0	= .
	.globl	XG$init_sprite$0$0
	ret
	G$init_sprite_old$0$0	= .
	.globl	G$init_sprite_old$0$0
	C$Sprite_Engine.c$40$1_0$126	= .
	.globl	C$Sprite_Engine.c$40$1_0$126
;src/engine/Sprite_Engine.c:40: void init_sprite_old(Sprite* sprite, uint8_t id, uint8_t init_tile, uint8_t max_tile, uint8_t x, uint8_t y, uint8_t velocity) {
;	---------------------------------
; Function init_sprite_old
; ---------------------------------
_init_sprite_old::
	C$Sprite_Engine.c$41$1_0$126	= .
	.globl	C$Sprite_Engine.c$41$1_0$126
;src/engine/Sprite_Engine.c:41: sprite->id = id;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	C$Sprite_Engine.c$42$1_0$126	= .
	.globl	C$Sprite_Engine.c$42$1_0$126
;src/engine/Sprite_Engine.c:42: sprite->init_tile = init_tile;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	C$Sprite_Engine.c$43$1_0$126	= .
	.globl	C$Sprite_Engine.c$43$1_0$126
;src/engine/Sprite_Engine.c:43: sprite->max_tile = max_tile;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	C$Sprite_Engine.c$44$1_0$126	= .
	.globl	C$Sprite_Engine.c$44$1_0$126
;src/engine/Sprite_Engine.c:44: sprite->x = x;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$45$1_0$126	= .
	.globl	C$Sprite_Engine.c$45$1_0$126
;src/engine/Sprite_Engine.c:45: sprite->y = y;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	C$Sprite_Engine.c$46$1_0$126	= .
	.globl	C$Sprite_Engine.c$46$1_0$126
;src/engine/Sprite_Engine.c:46: sprite->velocity = velocity;
	ld	a, (hl+)
	ld	(de), a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$47$1_0$126	= .
	.globl	C$Sprite_Engine.c$47$1_0$126
;src/engine/Sprite_Engine.c:47: }
	C$Sprite_Engine.c$47$1_0$126	= .
	.globl	C$Sprite_Engine.c$47$1_0$126
	XG$init_sprite_old$0$0	= .
	.globl	XG$init_sprite_old$0$0
	ret
	G$init_16x16_meta$0$0	= .
	.globl	G$init_16x16_meta$0$0
	C$Sprite_Engine.c$49$1_0$128	= .
	.globl	C$Sprite_Engine.c$49$1_0$128
;src/engine/Sprite_Engine.c:49: void init_16x16_meta(MetaSprite16x16* meta, UINT8 meta_id, UINT8 init_tile, UINT8 max_tile, UINT8 texture_idx,
;	---------------------------------
; Function init_16x16_meta
; ---------------------------------
_init_16x16_meta::
	add	sp, #-16
	C$Sprite_Engine.c$52$1_0$128	= .
	.globl	C$Sprite_Engine.c$52$1_0$128
;src/engine/Sprite_Engine.c:52: meta->meta_id = meta_id;
	ldhl	sp,	#18
	ld	a, (hl)
	ldhl	sp,	#0
	ld	(hl), a
	ldhl	sp,	#19
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	pop	de
	push	de
	ldhl	sp,	#20
	C$Sprite_Engine.c$53$1_0$128	= .
	.globl	C$Sprite_Engine.c$53$1_0$128
;src/engine/Sprite_Engine.c:53: meta->init_tile = init_tile;
	ld	a, (hl+)
	ld	(de), a
	pop	bc
	push	bc
	inc	bc
	C$Sprite_Engine.c$54$1_0$128	= .
	.globl	C$Sprite_Engine.c$54$1_0$128
;src/engine/Sprite_Engine.c:54: meta->max_tile = max_tile;
	ld	a, (hl+)
	ld	(bc), a
	pop	bc
	push	bc
	inc	bc
	inc	bc
	C$Sprite_Engine.c$55$1_0$128	= .
	.globl	C$Sprite_Engine.c$55$1_0$128
;src/engine/Sprite_Engine.c:55: meta->texture_idx = texture_idx;
	ld	a, (hl+)
	ld	(bc), a
	pop	bc
	push	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$58$1_0$128	= .
	.globl	C$Sprite_Engine.c$58$1_0$128
;src/engine/Sprite_Engine.c:58: meta->tile0 = tile0;
	pop	de
	push	de
	ld	hl, #0x0009
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$59$1_0$128	= .
	.globl	C$Sprite_Engine.c$59$1_0$128
;src/engine/Sprite_Engine.c:59: meta->tile1 = tile1;
	pop	de
	push	de
	ld	hl, #0x000b
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$60$1_0$128	= .
	.globl	C$Sprite_Engine.c$60$1_0$128
;src/engine/Sprite_Engine.c:60: meta->tile2 = tile2;
	pop	de
	push	de
	ld	hl, #0x000d
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#28
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$61$1_0$128	= .
	.globl	C$Sprite_Engine.c$61$1_0$128
;src/engine/Sprite_Engine.c:61: meta->tile3 = tile3;
	pop	de
	push	de
	ld	hl, #0x000f
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#30
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$64$1_0$128	= .
	.globl	C$Sprite_Engine.c$64$1_0$128
;src/engine/Sprite_Engine.c:64: meta->tile0->id = meta->meta_id;
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#20
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$65$1_0$128	= .
	.globl	C$Sprite_Engine.c$65$1_0$128
;src/engine/Sprite_Engine.c:65: meta->tile1->id = meta->meta_id + 1;
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#20
	ld	e, (hl)
	ld	a, e
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$66$1_0$128	= .
	.globl	C$Sprite_Engine.c$66$1_0$128
;src/engine/Sprite_Engine.c:66: meta->tile2->id = meta->meta_id + 2;
	ldhl	sp,	#28
	ld	a, (hl+)
	ld	c, a
	C$Sprite_Engine.c$67$1_0$128	= .
	.globl	C$Sprite_Engine.c$67$1_0$128
;src/engine/Sprite_Engine.c:67: meta->tile3->id = meta->meta_id + 3;
	ld	a, (hl+)
	ld	b, a
	ld	a, e
	inc	a
	inc	a
	ld	(bc), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, e
	inc	a
	inc	a
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$70$1_0$128	= .
	.globl	C$Sprite_Engine.c$70$1_0$128
;src/engine/Sprite_Engine.c:70: meta->tile0->init_tile = (meta->init_tile * meta->texture_idx);
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	dec	hl
	ld	b, a
	inc	bc
	push	bc
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	__muluchar
	pop	hl
	pop	bc
	ld	a, e
	ld	(bc), a
	C$Sprite_Engine.c$71$1_0$128	= .
	.globl	C$Sprite_Engine.c$71$1_0$128
;src/engine/Sprite_Engine.c:71: meta->tile1->init_tile = (meta->init_tile * meta->texture_idx) + 1;
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	c, a
	C$Sprite_Engine.c$72$1_0$128	= .
	.globl	C$Sprite_Engine.c$72$1_0$128
;src/engine/Sprite_Engine.c:72: meta->tile2->init_tile = (meta->init_tile * meta->texture_idx) + 2;
	ld	a, (hl+)
	ld	b, a
	inc	bc
	ld	a, e
	inc	a
	ld	(bc), a
	ld	a, (hl+)
	ld	c, a
	C$Sprite_Engine.c$73$1_0$128	= .
	.globl	C$Sprite_Engine.c$73$1_0$128
;src/engine/Sprite_Engine.c:73: meta->tile3->init_tile = (meta->init_tile * meta->texture_idx) + 3;
	ld	a, (hl+)
	ld	b, a
	inc	bc
	ld	a, e
	inc	a
	inc	a
	ld	(bc), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, e
	inc	a
	inc	a
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$76$1_0$128	= .
	.globl	C$Sprite_Engine.c$76$1_0$128
;src/engine/Sprite_Engine.c:76: meta->tile0->max_tile = (meta->max_tile * meta->texture_idx);
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl-)
	dec	hl
	ld	b, a
	inc	bc
	inc	bc
	push	bc
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	__muluchar
	pop	hl
	pop	bc
	ld	a, e
	ld	(bc), a
	C$Sprite_Engine.c$77$1_0$128	= .
	.globl	C$Sprite_Engine.c$77$1_0$128
;src/engine/Sprite_Engine.c:77: meta->tile1->max_tile = (meta->max_tile * meta->texture_idx) + 1;
	ldhl	sp,	#26
	ld	a, (hl+)
	ld	c, a
	C$Sprite_Engine.c$78$1_0$128	= .
	.globl	C$Sprite_Engine.c$78$1_0$128
;src/engine/Sprite_Engine.c:78: meta->tile2->max_tile = (meta->max_tile * meta->texture_idx) + 2;
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, e
	inc	a
	ld	(bc), a
	ld	a, (hl+)
	ld	c, a
	C$Sprite_Engine.c$79$1_0$128	= .
	.globl	C$Sprite_Engine.c$79$1_0$128
;src/engine/Sprite_Engine.c:79: meta->tile3->max_tile = (meta->max_tile * meta->texture_idx) + 3;
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	ld	a, e
	inc	a
	inc	a
	ld	(bc), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	ld	a, e
	inc	a
	inc	a
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$83$1_0$128	= .
	.globl	C$Sprite_Engine.c$83$1_0$128
;src/engine/Sprite_Engine.c:83: set_sprite_position(meta->tile0, meta->tile0->x, meta->tile0->y);
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	c, l
	ld	b, h
	ld	a, (bc)
	ld	b, a
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	ld	d, a
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	push	af
	inc	sp
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_set_sprite_position
	add	sp, #4
	C$Sprite_Engine.c$84$1_0$128	= .
	.globl	C$Sprite_Engine.c$84$1_0$128
;src/engine/Sprite_Engine.c:84: set_sprite_velocity(meta->tile0, meta->velocity);
	pop	de
	push	de
	ld	hl, #0x0006
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#12
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#11
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_velocity
	add	sp, #3
	C$Sprite_Engine.c$85$1_0$128	= .
	.globl	C$Sprite_Engine.c$85$1_0$128
;src/engine/Sprite_Engine.c:85: set_sprite_visibility(meta->tile0, meta->is_visible);
	pop	de
	push	de
	ld	hl, #0x0007
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#14
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#13
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_visibility
	add	sp, #3
	C$Sprite_Engine.c$86$1_0$128	= .
	.globl	C$Sprite_Engine.c$86$1_0$128
;src/engine/Sprite_Engine.c:86: set_sprite_hitbox(meta->tile0, meta->has_hitbox);
	pop	de
	push	de
	ld	hl, #0x0008
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#16
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#15
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_hitbox
	add	sp, #3
	C$Sprite_Engine.c$84$1_0$128	= .
	.globl	C$Sprite_Engine.c$84$1_0$128
;src/engine/Sprite_Engine.c:84: set_sprite_velocity(meta->tile0, meta->velocity);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	C$Sprite_Engine.c$87$1_0$128	= .
	.globl	C$Sprite_Engine.c$87$1_0$128
;src/engine/Sprite_Engine.c:87: init_sprite(meta->tile0, meta->tile0->id, meta->tile0->init_tile, meta->tile0->max_tile);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (bc)
	ld	e, h
	push	de
	push	af
	inc	sp
	push	bc
	call	_init_sprite
	add	sp, #5
	C$Sprite_Engine.c$89$1_0$128	= .
	.globl	C$Sprite_Engine.c$89$1_0$128
;src/engine/Sprite_Engine.c:89: set_sprite_position(meta->tile1, meta->tile1->x, meta->tile1->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	push	de
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_set_sprite_position
	add	sp, #4
	C$Sprite_Engine.c$90$1_0$128	= .
	.globl	C$Sprite_Engine.c$90$1_0$128
;src/engine/Sprite_Engine.c:90: set_sprite_velocity(meta->tile1, meta->velocity);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_velocity
	add	sp, #3
	C$Sprite_Engine.c$91$1_0$128	= .
	.globl	C$Sprite_Engine.c$91$1_0$128
;src/engine/Sprite_Engine.c:91: set_sprite_visibility(meta->tile1, meta->is_visible);
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_visibility
	add	sp, #3
	C$Sprite_Engine.c$92$1_0$128	= .
	.globl	C$Sprite_Engine.c$92$1_0$128
;src/engine/Sprite_Engine.c:92: set_sprite_hitbox(meta->tile1, meta->has_hitbox);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_hitbox
	add	sp, #3
	C$Sprite_Engine.c$89$1_0$128	= .
	.globl	C$Sprite_Engine.c$89$1_0$128
;src/engine/Sprite_Engine.c:89: set_sprite_position(meta->tile1, meta->tile1->x, meta->tile1->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	C$Sprite_Engine.c$93$1_0$128	= .
	.globl	C$Sprite_Engine.c$93$1_0$128
;src/engine/Sprite_Engine.c:93: init_sprite(meta->tile1, meta->tile1->id, meta->tile1->init_tile, meta->tile1->max_tile);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (bc)
	ld	e, h
	push	de
	push	af
	inc	sp
	push	bc
	call	_init_sprite
	add	sp, #5
	C$Sprite_Engine.c$95$1_0$128	= .
	.globl	C$Sprite_Engine.c$95$1_0$128
;src/engine/Sprite_Engine.c:95: set_sprite_position(meta->tile2, meta->tile2->x, meta->tile2->y);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	push	de
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_set_sprite_position
	add	sp, #4
	C$Sprite_Engine.c$96$1_0$128	= .
	.globl	C$Sprite_Engine.c$96$1_0$128
;src/engine/Sprite_Engine.c:96: set_sprite_velocity(meta->tile2, meta->velocity);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_velocity
	add	sp, #3
	C$Sprite_Engine.c$97$1_0$128	= .
	.globl	C$Sprite_Engine.c$97$1_0$128
;src/engine/Sprite_Engine.c:97: set_sprite_visibility(meta->tile2, meta->is_visible);
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_visibility
	add	sp, #3
	C$Sprite_Engine.c$98$1_0$128	= .
	.globl	C$Sprite_Engine.c$98$1_0$128
;src/engine/Sprite_Engine.c:98: set_sprite_hitbox(meta->tile2, meta->has_hitbox);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_hitbox
	add	sp, #3
	C$Sprite_Engine.c$95$1_0$128	= .
	.globl	C$Sprite_Engine.c$95$1_0$128
;src/engine/Sprite_Engine.c:95: set_sprite_position(meta->tile2, meta->tile2->x, meta->tile2->y);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	C$Sprite_Engine.c$99$1_0$128	= .
	.globl	C$Sprite_Engine.c$99$1_0$128
;src/engine/Sprite_Engine.c:99: init_sprite(meta->tile2, meta->tile2->id, meta->tile2->init_tile, meta->tile2->max_tile);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (bc)
	ld	e, h
	push	de
	push	af
	inc	sp
	push	bc
	call	_init_sprite
	add	sp, #5
	C$Sprite_Engine.c$101$1_0$128	= .
	.globl	C$Sprite_Engine.c$101$1_0$128
;src/engine/Sprite_Engine.c:101: set_sprite_position(meta->tile3, meta->tile3->x, meta->tile3->y);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	a, (hl)
	push	de
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_set_sprite_position
	add	sp, #4
	C$Sprite_Engine.c$102$1_0$128	= .
	.globl	C$Sprite_Engine.c$102$1_0$128
;src/engine/Sprite_Engine.c:102: set_sprite_velocity(meta->tile3, meta->velocity);
	ldhl	sp,#10
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl-)
	dec	hl
	dec	hl
	ld	d, a
	ld	a, (de)
	ld	b, a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_velocity
	add	sp, #3
	C$Sprite_Engine.c$103$1_0$128	= .
	.globl	C$Sprite_Engine.c$103$1_0$128
;src/engine/Sprite_Engine.c:103: set_sprite_visibility(meta->tile3, meta->is_visible);
	ldhl	sp,#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_visibility
	add	sp, #3
	C$Sprite_Engine.c$104$1_0$128	= .
	.globl	C$Sprite_Engine.c$104$1_0$128
;src/engine/Sprite_Engine.c:104: set_sprite_hitbox(meta->tile3, meta->has_hitbox);
	ldhl	sp,#14
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	b, a
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	push	bc
	inc	sp
	ld	b, a
	push	bc
	call	_set_sprite_hitbox
	add	sp, #3
	C$Sprite_Engine.c$101$1_0$128	= .
	.globl	C$Sprite_Engine.c$101$1_0$128
;src/engine/Sprite_Engine.c:101: set_sprite_position(meta->tile3, meta->tile3->x, meta->tile3->y);
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	C$Sprite_Engine.c$105$1_0$128	= .
	.globl	C$Sprite_Engine.c$105$1_0$128
;src/engine/Sprite_Engine.c:105: init_sprite(meta->tile3, meta->tile3->id, meta->tile3->init_tile, meta->tile3->max_tile);
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	h, (hl)
;	spillPairReg hl
	ld	a, (bc)
	ld	e, h
	push	de
	push	af
	inc	sp
	push	bc
	call	_init_sprite
	C$Sprite_Engine.c$106$1_0$128	= .
	.globl	C$Sprite_Engine.c$106$1_0$128
;src/engine/Sprite_Engine.c:106: }
	add	sp, #21
	C$Sprite_Engine.c$106$1_0$128	= .
	.globl	C$Sprite_Engine.c$106$1_0$128
	XG$init_16x16_meta$0$0	= .
	.globl	XG$init_16x16_meta$0$0
	ret
	G$init_16x16_meta_old$0$0	= .
	.globl	G$init_16x16_meta_old$0$0
	C$Sprite_Engine.c$108$1_0$130	= .
	.globl	C$Sprite_Engine.c$108$1_0$130
;src/engine/Sprite_Engine.c:108: void init_16x16_meta_old(MetaSprite16x16* meta, uint8_t meta_id, uint8_t init_tile, uint8_t max_tile, uint8_t texture_idx, uint8_t x, uint8_t y, Sprite* tile0, Sprite* tile1, Sprite* tile2, Sprite* tile3) {
;	---------------------------------
; Function init_16x16_meta_old
; ---------------------------------
_init_16x16_meta_old::
	add	sp, #-8
	C$Sprite_Engine.c$109$1_0$130	= .
	.globl	C$Sprite_Engine.c$109$1_0$130
;src/engine/Sprite_Engine.c:109: meta->meta_id = meta_id;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	C$Sprite_Engine.c$110$1_0$130	= .
	.globl	C$Sprite_Engine.c$110$1_0$130
;src/engine/Sprite_Engine.c:110: meta->init_tile = init_tile;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	C$Sprite_Engine.c$111$1_0$130	= .
	.globl	C$Sprite_Engine.c$111$1_0$130
;src/engine/Sprite_Engine.c:111: meta->max_tile = max_tile;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	C$Sprite_Engine.c$112$1_0$130	= .
	.globl	C$Sprite_Engine.c$112$1_0$130
;src/engine/Sprite_Engine.c:112: meta->texture_idx = texture_idx;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$113$1_0$130	= .
	.globl	C$Sprite_Engine.c$113$1_0$130
;src/engine/Sprite_Engine.c:113: meta->x = x;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$114$1_0$130	= .
	.globl	C$Sprite_Engine.c$114$1_0$130
;src/engine/Sprite_Engine.c:114: meta->y = y;
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#17
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$117$1_0$130	= .
	.globl	C$Sprite_Engine.c$117$1_0$130
;src/engine/Sprite_Engine.c:117: meta->tile0 = tile0;
	ld	hl, #0x0009
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$118$1_0$130	= .
	.globl	C$Sprite_Engine.c$118$1_0$130
;src/engine/Sprite_Engine.c:118: meta->tile1 = tile1;
	ld	hl, #0x000b
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$119$1_0$130	= .
	.globl	C$Sprite_Engine.c$119$1_0$130
;src/engine/Sprite_Engine.c:119: meta->tile2 = tile2;
	ld	hl, #0x000d
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$120$1_0$130	= .
	.globl	C$Sprite_Engine.c$120$1_0$130
;src/engine/Sprite_Engine.c:120: meta->tile3 = tile3;
	ld	hl, #0x000f
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$131$1_0$130	= .
	.globl	C$Sprite_Engine.c$131$1_0$130
;src/engine/Sprite_Engine.c:131: meta->tile0->id = meta->meta_id;
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#12
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$132$1_0$130	= .
	.globl	C$Sprite_Engine.c$132$1_0$130
;src/engine/Sprite_Engine.c:132: meta->tile1->id = meta->meta_id + 1;
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#12
	ld	e, (hl)
	ld	a, e
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$133$1_0$130	= .
	.globl	C$Sprite_Engine.c$133$1_0$130
;src/engine/Sprite_Engine.c:133: meta->tile2->id = meta->meta_id + 2;
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	c, a
	C$Sprite_Engine.c$134$1_0$130	= .
	.globl	C$Sprite_Engine.c$134$1_0$130
;src/engine/Sprite_Engine.c:134: meta->tile3->id = meta->meta_id + 3;
	ld	a, (hl+)
	ld	b, a
	ld	a, e
	inc	a
	inc	a
	ld	(bc), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, e
	inc	a
	inc	a
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$137$1_0$130	= .
	.globl	C$Sprite_Engine.c$137$1_0$130
;src/engine/Sprite_Engine.c:137: meta->tile0->init_tile = (meta->init_tile * meta->texture_idx);
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	push	bc
	ldhl	sp,	#17
	ld	a, (hl-)
	dec	hl
	push	af
	inc	sp
	ld	a, (hl)
	push	af
	inc	sp
	call	__muluchar
	pop	hl
	ldhl	sp,	#9
	ld	(hl), e
	pop	bc
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$138$1_0$130	= .
	.globl	C$Sprite_Engine.c$138$1_0$130
;src/engine/Sprite_Engine.c:138: meta->tile1->init_tile = (meta->init_tile * meta->texture_idx) + 1;
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ldhl	sp,	#7
	ld	e, (hl)
	ld	a, e
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$139$1_0$130	= .
	.globl	C$Sprite_Engine.c$139$1_0$130
;src/engine/Sprite_Engine.c:139: meta->tile2->init_tile = (meta->init_tile * meta->texture_idx) + 2;
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	c, a
	C$Sprite_Engine.c$140$1_0$130	= .
	.globl	C$Sprite_Engine.c$140$1_0$130
;src/engine/Sprite_Engine.c:140: meta->tile3->init_tile = (meta->init_tile * meta->texture_idx) + 3;
	ld	a, (hl+)
	ld	b, a
	inc	bc
	ld	a, e
	inc	a
	inc	a
	ld	(bc), a
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ld	a, e
	inc	a
	inc	a
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$143$1_0$130	= .
	.globl	C$Sprite_Engine.c$143$1_0$130
;src/engine/Sprite_Engine.c:143: meta->tile0->max_tile = (meta->max_tile * meta->texture_idx);
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	push	de
	ldhl	sp,	#17
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	call	__muluchar
	pop	hl
	ld	b, e
	pop	de
	ld	a, b
	ld	(de), a
	C$Sprite_Engine.c$144$1_0$130	= .
	.globl	C$Sprite_Engine.c$144$1_0$130
;src/engine/Sprite_Engine.c:144: meta->tile1->max_tile = (meta->max_tile * meta->texture_idx) + 1;
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	e, a
	C$Sprite_Engine.c$145$1_0$130	= .
	.globl	C$Sprite_Engine.c$145$1_0$130
;src/engine/Sprite_Engine.c:145: meta->tile2->max_tile = (meta->max_tile * meta->texture_idx) + 2;
	ld	a, (hl+)
	ld	d, a
	inc	de
	inc	de
	ld	c, b
	ld	a, c
	inc	a
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	C$Sprite_Engine.c$146$1_0$130	= .
	.globl	C$Sprite_Engine.c$146$1_0$130
;src/engine/Sprite_Engine.c:146: meta->tile3->max_tile = (meta->max_tile * meta->texture_idx) + 3;
	ld	a, (hl+)
	ld	d, a
	inc	de
	inc	de
	ld	a, c
	inc	a
	inc	a
	ld	(de), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	ld	a, c
	inc	a
	inc	a
	inc	a
	ld	(de), a
	C$Sprite_Engine.c$149$1_0$130	= .
	.globl	C$Sprite_Engine.c$149$1_0$130
;src/engine/Sprite_Engine.c:149: meta->tile0->x = meta->x;
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$150$1_0$130	= .
	.globl	C$Sprite_Engine.c$150$1_0$130
;src/engine/Sprite_Engine.c:150: meta->tile1->x = meta->x + SPRITE_SIZE;
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ldhl	sp,	#16
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
	ld	(de), a
	C$Sprite_Engine.c$151$1_0$130	= .
	.globl	C$Sprite_Engine.c$151$1_0$130
;src/engine/Sprite_Engine.c:151: meta->tile2->x = meta->x;
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$152$1_0$130	= .
	.globl	C$Sprite_Engine.c$152$1_0$130
;src/engine/Sprite_Engine.c:152: meta->tile3->x = meta->x + SPRITE_SIZE;
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, c
	ld	(de), a
	C$Sprite_Engine.c$155$1_0$130	= .
	.globl	C$Sprite_Engine.c$155$1_0$130
;src/engine/Sprite_Engine.c:155: meta->tile0->y = meta->y;
	ldhl	sp,#18
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#17
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$156$1_0$130	= .
	.globl	C$Sprite_Engine.c$156$1_0$130
;src/engine/Sprite_Engine.c:156: meta->tile1->y = meta->y;
	ldhl	sp,#20
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#17
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$157$1_0$130	= .
	.globl	C$Sprite_Engine.c$157$1_0$130
;src/engine/Sprite_Engine.c:157: meta->tile2->y = meta->y + SPRITE_SIZE;
	ldhl	sp,#22
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ldhl	sp,	#17
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
	ld	(de), a
	C$Sprite_Engine.c$158$1_0$130	= .
	.globl	C$Sprite_Engine.c$158$1_0$130
;src/engine/Sprite_Engine.c:158: meta->tile3->y = meta->y + SPRITE_SIZE;
	ldhl	sp,#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
	C$Sprite_Engine.c$161$1_0$130	= .
	.globl	C$Sprite_Engine.c$161$1_0$130
;src/engine/Sprite_Engine.c:161: init_sprite_old(meta->tile0, meta->tile0->id, meta->tile0->init_tile, meta->tile0->max_tile, meta->tile0->x, meta->tile0->y, DEFAULT_SCROLL_SPEED);
	ld	a, #0x01
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#11
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#17
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_init_sprite_old
	add	sp, #8
	C$Sprite_Engine.c$162$1_0$130	= .
	.globl	C$Sprite_Engine.c$162$1_0$130
;src/engine/Sprite_Engine.c:162: init_sprite_old(meta->tile1, meta->tile1->id, meta->tile1->init_tile, meta->tile1->max_tile, meta->tile1->x, meta->tile1->y, DEFAULT_SCROLL_SPEED);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	e, (hl)
	ld	a, (bc)
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#7
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	de
	inc	sp
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_init_sprite_old
	add	sp, #8
	C$Sprite_Engine.c$163$1_0$130	= .
	.globl	C$Sprite_Engine.c$163$1_0$130
;src/engine/Sprite_Engine.c:163: init_sprite_old(meta->tile2, meta->tile2->id, meta->tile2->init_tile, meta->tile2->max_tile, meta->tile2->x, meta->tile2->y, DEFAULT_SCROLL_SPEED);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	e, (hl)
	ld	a, (bc)
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#7
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	de
	inc	sp
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_init_sprite_old
	add	sp, #8
	C$Sprite_Engine.c$164$1_0$130	= .
	.globl	C$Sprite_Engine.c$164$1_0$130
;src/engine/Sprite_Engine.c:164: init_sprite_old(meta->tile3, meta->tile3->id, meta->tile3->init_tile, meta->tile3->max_tile, meta->tile3->x, meta->tile3->y, DEFAULT_SCROLL_SPEED);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#6
	ld	(hl), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ldhl	sp,	#7
	ld	(hl), a
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	e, (hl)
	ld	a, (bc)
	ld	h, #0x01
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#7
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#9
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	de
	inc	sp
	ld	h, e
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	push	bc
	call	_init_sprite_old
	C$Sprite_Engine.c$166$1_0$130	= .
	.globl	C$Sprite_Engine.c$166$1_0$130
;src/engine/Sprite_Engine.c:166: }
	add	sp, #16
	C$Sprite_Engine.c$166$1_0$130	= .
	.globl	C$Sprite_Engine.c$166$1_0$130
	XG$init_16x16_meta_old$0$0	= .
	.globl	XG$init_16x16_meta_old$0$0
	ret
	G$set_sprite_position$0$0	= .
	.globl	G$set_sprite_position$0$0
	C$Sprite_Engine.c$168$1_0$132	= .
	.globl	C$Sprite_Engine.c$168$1_0$132
;src/engine/Sprite_Engine.c:168: void set_sprite_position(Sprite* sprite, UINT8 x, UINT8 y)
;	---------------------------------
; Function set_sprite_position
; ---------------------------------
_set_sprite_position::
	C$Sprite_Engine.c$170$1_0$132	= .
	.globl	C$Sprite_Engine.c$170$1_0$132
;src/engine/Sprite_Engine.c:170: sprite->x = x;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	C$Sprite_Engine.c$171$1_0$132	= .
	.globl	C$Sprite_Engine.c$171$1_0$132
;src/engine/Sprite_Engine.c:171: sprite->y = y;
	ld	a, (hl+)
	ld	(de), a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$172$1_0$132	= .
	.globl	C$Sprite_Engine.c$172$1_0$132
;src/engine/Sprite_Engine.c:172: }
	C$Sprite_Engine.c$172$1_0$132	= .
	.globl	C$Sprite_Engine.c$172$1_0$132
	XG$set_sprite_position$0$0	= .
	.globl	XG$set_sprite_position$0$0
	ret
	G$set_sprite_velocity$0$0	= .
	.globl	G$set_sprite_velocity$0$0
	C$Sprite_Engine.c$174$1_0$134	= .
	.globl	C$Sprite_Engine.c$174$1_0$134
;src/engine/Sprite_Engine.c:174: void set_sprite_velocity(Sprite* sprite, UINT8 velocity)
;	---------------------------------
; Function set_sprite_velocity
; ---------------------------------
_set_sprite_velocity::
	C$Sprite_Engine.c$176$1_0$134	= .
	.globl	C$Sprite_Engine.c$176$1_0$134
;src/engine/Sprite_Engine.c:176: sprite->velocity = velocity;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$177$1_0$134	= .
	.globl	C$Sprite_Engine.c$177$1_0$134
;src/engine/Sprite_Engine.c:177: }
	C$Sprite_Engine.c$177$1_0$134	= .
	.globl	C$Sprite_Engine.c$177$1_0$134
	XG$set_sprite_velocity$0$0	= .
	.globl	XG$set_sprite_velocity$0$0
	ret
	G$set_sprite_visibility$0$0	= .
	.globl	G$set_sprite_visibility$0$0
	C$Sprite_Engine.c$179$1_0$136	= .
	.globl	C$Sprite_Engine.c$179$1_0$136
;src/engine/Sprite_Engine.c:179: void set_sprite_visibility(Sprite* sprite, UINT8 is_visible)
;	---------------------------------
; Function set_sprite_visibility
; ---------------------------------
_set_sprite_visibility::
	C$Sprite_Engine.c$181$1_0$136	= .
	.globl	C$Sprite_Engine.c$181$1_0$136
;src/engine/Sprite_Engine.c:181: sprite->is_visible = is_visible;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x06
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	inc	hl
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$182$1_0$136	= .
	.globl	C$Sprite_Engine.c$182$1_0$136
;src/engine/Sprite_Engine.c:182: }
	C$Sprite_Engine.c$182$1_0$136	= .
	.globl	C$Sprite_Engine.c$182$1_0$136
	XG$set_sprite_visibility$0$0	= .
	.globl	XG$set_sprite_visibility$0$0
	ret
	G$set_sprite_hitbox$0$0	= .
	.globl	G$set_sprite_hitbox$0$0
	C$Sprite_Engine.c$184$1_0$138	= .
	.globl	C$Sprite_Engine.c$184$1_0$138
;src/engine/Sprite_Engine.c:184: void set_sprite_hitbox(Sprite* sprite, UINT8 has_hitbox)
;	---------------------------------
; Function set_sprite_hitbox
; ---------------------------------
_set_sprite_hitbox::
	C$Sprite_Engine.c$186$1_0$138	= .
	.globl	C$Sprite_Engine.c$186$1_0$138
;src/engine/Sprite_Engine.c:186: sprite->has_hitbox = has_hitbox;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x07
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	inc	hl
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$187$1_0$138	= .
	.globl	C$Sprite_Engine.c$187$1_0$138
;src/engine/Sprite_Engine.c:187: }
	C$Sprite_Engine.c$187$1_0$138	= .
	.globl	C$Sprite_Engine.c$187$1_0$138
	XG$set_sprite_hitbox$0$0	= .
	.globl	XG$set_sprite_hitbox$0$0
	ret
	G$set_16x16_meta_position$0$0	= .
	.globl	G$set_16x16_meta_position$0$0
	C$Sprite_Engine.c$189$1_0$140	= .
	.globl	C$Sprite_Engine.c$189$1_0$140
;src/engine/Sprite_Engine.c:189: void set_16x16_meta_position(MetaSprite16x16* meta, UINT8 x, UINT8 y)
;	---------------------------------
; Function set_16x16_meta_position
; ---------------------------------
_set_16x16_meta_position::
	add	sp, #-9
	C$Sprite_Engine.c$191$1_0$140	= .
	.globl	C$Sprite_Engine.c$191$1_0$140
;src/engine/Sprite_Engine.c:191: meta->x = x;
	ldhl	sp,	#11
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#13
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$192$1_0$140	= .
	.globl	C$Sprite_Engine.c$192$1_0$140
;src/engine/Sprite_Engine.c:192: meta->y = y;
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$195$1_0$140	= .
	.globl	C$Sprite_Engine.c$195$1_0$140
;src/engine/Sprite_Engine.c:195: meta->tile0->x = meta->x;
	ld	hl, #0x0009
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#13
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$196$1_0$140	= .
	.globl	C$Sprite_Engine.c$196$1_0$140
;src/engine/Sprite_Engine.c:196: meta->tile1->x = meta->x + SPRITE_SIZE;
	ld	hl, #0x000b
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#13
	ld	a, (hl)
	add	a, #0x08
	ldhl	sp,	#4
	ld	(hl), a
	ld	(de), a
	C$Sprite_Engine.c$197$1_0$140	= .
	.globl	C$Sprite_Engine.c$197$1_0$140
;src/engine/Sprite_Engine.c:197: meta->tile2->x = meta->x;
	ld	hl, #0x000d
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#7
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#6
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#13
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$198$1_0$140	= .
	.globl	C$Sprite_Engine.c$198$1_0$140
;src/engine/Sprite_Engine.c:198: meta->tile3->x = meta->x + SPRITE_SIZE;
	ld	hl, #0x000f
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#9
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#8
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$201$1_0$140	= .
	.globl	C$Sprite_Engine.c$201$1_0$140
;src/engine/Sprite_Engine.c:201: meta->tile0->y = meta->y;
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#14
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$202$1_0$140	= .
	.globl	C$Sprite_Engine.c$202$1_0$140
;src/engine/Sprite_Engine.c:202: meta->tile1->y = meta->y;
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#14
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$203$1_0$140	= .
	.globl	C$Sprite_Engine.c$203$1_0$140
;src/engine/Sprite_Engine.c:203: meta->tile2->y = meta->y + SPRITE_SIZE;
	ldhl	sp,#5
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (hl)
	add	a, #0x08
	ld	c, a
	ld	(de), a
	C$Sprite_Engine.c$204$1_0$140	= .
	.globl	C$Sprite_Engine.c$204$1_0$140
;src/engine/Sprite_Engine.c:204: meta->tile3->y = meta->y + SPRITE_SIZE;
	ldhl	sp,#7
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	inc	hl
	ld	(hl), c
	C$Sprite_Engine.c$205$1_0$140	= .
	.globl	C$Sprite_Engine.c$205$1_0$140
;src/engine/Sprite_Engine.c:205: }
	add	sp, #9
	C$Sprite_Engine.c$205$1_0$140	= .
	.globl	C$Sprite_Engine.c$205$1_0$140
	XG$set_16x16_meta_position$0$0	= .
	.globl	XG$set_16x16_meta_position$0$0
	ret
	G$set_16x16_meta_velocity$0$0	= .
	.globl	G$set_16x16_meta_velocity$0$0
	C$Sprite_Engine.c$207$1_0$142	= .
	.globl	C$Sprite_Engine.c$207$1_0$142
;src/engine/Sprite_Engine.c:207: void set_16x16_meta_velocity(MetaSprite16x16* meta, UINT8 velocity)
;	---------------------------------
; Function set_16x16_meta_velocity
; ---------------------------------
_set_16x16_meta_velocity::
	C$Sprite_Engine.c$209$1_0$142	= .
	.globl	C$Sprite_Engine.c$209$1_0$142
;src/engine/Sprite_Engine.c:209: meta->velocity = velocity;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$212$1_0$142	= .
	.globl	C$Sprite_Engine.c$212$1_0$142
;src/engine/Sprite_Engine.c:212: meta->tile0->velocity = meta->velocity;
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	add	a, #0x05
	ld	e, a
	ld	a, l
	adc	a, #0x00
	ld	d, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$213$1_0$142	= .
	.globl	C$Sprite_Engine.c$213$1_0$142
;src/engine/Sprite_Engine.c:213: meta->tile1->velocity = meta->velocity;
	ld	hl, #0x000b
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	add	a, #0x05
	ld	e, a
	ld	a, l
	adc	a, #0x00
	ld	d, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$214$1_0$142	= .
	.globl	C$Sprite_Engine.c$214$1_0$142
;src/engine/Sprite_Engine.c:214: meta->tile2->velocity = meta->velocity;
	ld	hl, #0x000d
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	add	a, #0x05
	ld	e, a
	ld	a, l
	adc	a, #0x00
	ld	d, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$215$1_0$142	= .
	.globl	C$Sprite_Engine.c$215$1_0$142
;src/engine/Sprite_Engine.c:215: meta->tile3->velocity = meta->velocity;
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	inc	bc
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$216$1_0$142	= .
	.globl	C$Sprite_Engine.c$216$1_0$142
;src/engine/Sprite_Engine.c:216: }
	C$Sprite_Engine.c$216$1_0$142	= .
	.globl	C$Sprite_Engine.c$216$1_0$142
	XG$set_16x16_meta_velocity$0$0	= .
	.globl	XG$set_16x16_meta_velocity$0$0
	ret
	G$set_16x16_meta_visibility$0$0	= .
	.globl	G$set_16x16_meta_visibility$0$0
	C$Sprite_Engine.c$218$1_0$144	= .
	.globl	C$Sprite_Engine.c$218$1_0$144
;src/engine/Sprite_Engine.c:218: void set_16x16_meta_visibility(MetaSprite16x16* meta, UINT8 is_visible)
;	---------------------------------
; Function set_16x16_meta_visibility
; ---------------------------------
_set_16x16_meta_visibility::
	C$Sprite_Engine.c$220$1_0$144	= .
	.globl	C$Sprite_Engine.c$220$1_0$144
;src/engine/Sprite_Engine.c:220: meta->is_visible = is_visible;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0007
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$223$1_0$144	= .
	.globl	C$Sprite_Engine.c$223$1_0$144
;src/engine/Sprite_Engine.c:223: meta->tile0->is_visible = meta->is_visible;
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	add	a, #0x06
	ld	e, a
	ld	a, l
	adc	a, #0x00
	ld	d, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$224$1_0$144	= .
	.globl	C$Sprite_Engine.c$224$1_0$144
;src/engine/Sprite_Engine.c:224: meta->tile1->is_visible = meta->is_visible;
	ld	hl, #0x000b
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	add	a, #0x06
	ld	e, a
	ld	a, l
	adc	a, #0x00
	ld	d, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$225$1_0$144	= .
	.globl	C$Sprite_Engine.c$225$1_0$144
;src/engine/Sprite_Engine.c:225: meta->tile2->is_visible = meta->is_visible;
	ld	hl, #0x000d
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	add	a, #0x06
	ld	e, a
	ld	a, l
	adc	a, #0x00
	ld	d, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$226$1_0$144	= .
	.globl	C$Sprite_Engine.c$226$1_0$144
;src/engine/Sprite_Engine.c:226: meta->tile3->is_visible = meta->is_visible;
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x06
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$227$1_0$144	= .
	.globl	C$Sprite_Engine.c$227$1_0$144
;src/engine/Sprite_Engine.c:227: }
	C$Sprite_Engine.c$227$1_0$144	= .
	.globl	C$Sprite_Engine.c$227$1_0$144
	XG$set_16x16_meta_visibility$0$0	= .
	.globl	XG$set_16x16_meta_visibility$0$0
	ret
	G$set_16x16_meta_hitbox$0$0	= .
	.globl	G$set_16x16_meta_hitbox$0$0
	C$Sprite_Engine.c$229$1_0$146	= .
	.globl	C$Sprite_Engine.c$229$1_0$146
;src/engine/Sprite_Engine.c:229: void set_16x16_meta_hitbox(MetaSprite16x16* meta, UINT8 has_hitbox)
;	---------------------------------
; Function set_16x16_meta_hitbox
; ---------------------------------
_set_16x16_meta_hitbox::
	C$Sprite_Engine.c$231$1_0$146	= .
	.globl	C$Sprite_Engine.c$231$1_0$146
;src/engine/Sprite_Engine.c:231: meta->has_hitbox = has_hitbox;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$234$1_0$146	= .
	.globl	C$Sprite_Engine.c$234$1_0$146
;src/engine/Sprite_Engine.c:234: meta->tile0->has_hitbox = meta->has_hitbox;
	ld	hl, #0x0009
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	add	a, #0x07
	ld	e, a
	ld	a, l
	adc	a, #0x00
	ld	d, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$235$1_0$146	= .
	.globl	C$Sprite_Engine.c$235$1_0$146
;src/engine/Sprite_Engine.c:235: meta->tile1->has_hitbox = meta->has_hitbox;
	ld	hl, #0x000b
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	add	a, #0x07
	ld	e, a
	ld	a, l
	adc	a, #0x00
	ld	d, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$236$1_0$146	= .
	.globl	C$Sprite_Engine.c$236$1_0$146
;src/engine/Sprite_Engine.c:236: meta->tile2->has_hitbox = meta->has_hitbox;
	ld	hl, #0x000d
	add	hl, bc
	ld	a, (hl+)
	ld	l, (hl)
;	spillPairReg hl
	add	a, #0x07
	ld	e, a
	ld	a, l
	adc	a, #0x00
	ld	d, a
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$237$1_0$146	= .
	.globl	C$Sprite_Engine.c$237$1_0$146
;src/engine/Sprite_Engine.c:237: meta->tile3->has_hitbox = meta->has_hitbox;
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl+)
	ld	b, (hl)
	add	a, #0x07
	ld	c, a
	jr	NC, 00103$
	inc	b
00103$:
	ldhl	sp,	#4
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$238$1_0$146	= .
	.globl	C$Sprite_Engine.c$238$1_0$146
;src/engine/Sprite_Engine.c:238: }
	C$Sprite_Engine.c$238$1_0$146	= .
	.globl	C$Sprite_Engine.c$238$1_0$146
	XG$set_16x16_meta_hitbox$0$0	= .
	.globl	XG$set_16x16_meta_hitbox$0$0
	ret
	G$setup_sprite$0$0	= .
	.globl	G$setup_sprite$0$0
	C$Sprite_Engine.c$240$1_0$148	= .
	.globl	C$Sprite_Engine.c$240$1_0$148
;src/engine/Sprite_Engine.c:240: void setup_sprite(Sprite *s, UINT8 pixels[]) 
;	---------------------------------
; Function setup_sprite
; ---------------------------------
_setup_sprite::
	dec	sp
	C$Sprite_Engine.c$242$1_0$148	= .
	.globl	C$Sprite_Engine.c$242$1_0$148
;src/engine/Sprite_Engine.c:242: set_sprite_data(s->init_tile, s->max_tile, pixels);    // (initial tile, final tile, sprite char array)
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	c, e
	ld	b, d
	inc	bc
	inc	bc
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ld	c, e
	ld	b, d
	inc	bc
	ld	a, (bc)
	push	de
	push	af
	ldhl	sp,	#9
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	pop	af
	push	hl
	ldhl	sp,	#4
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
	pop	de
;src/engine/Sprite_Engine.c:243: set_sprite_tile(s->id, s->init_tile);                  // (sprite index, tile), gives sprite its id
	ld	a, (bc)
	ld	c, a
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), c
;src/engine/Sprite_Engine.c:244: move_sprite(0, s->x, s->y);                            // (sprite index, x, y)
	ld	hl, #0x0004
	add	hl, de
	ld	b, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, (de)
	ld	c, a
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
	C$Sprite_Engine.c$244$3_0$148	= .
	.globl	C$Sprite_Engine.c$244$3_0$148
;src/engine/Sprite_Engine.c:244: move_sprite(0, s->x, s->y);                            // (sprite index, x, y)
	C$Sprite_Engine.c$245$3_0$148	= .
	.globl	C$Sprite_Engine.c$245$3_0$148
;src/engine/Sprite_Engine.c:245: }
	inc	sp
	C$Sprite_Engine.c$245$3_0$148	= .
	.globl	C$Sprite_Engine.c$245$3_0$148
	XG$setup_sprite$0$0	= .
	.globl	XG$setup_sprite$0$0
	ret
	G$setup_16x16_meta$0$0	= .
	.globl	G$setup_16x16_meta$0$0
	C$Sprite_Engine.c$247$3_0$156	= .
	.globl	C$Sprite_Engine.c$247$3_0$156
;src/engine/Sprite_Engine.c:247: void setup_16x16_meta(MetaSprite16x16 *meta, UINT8 pixels[]) 
;	---------------------------------
; Function setup_16x16_meta
; ---------------------------------
_setup_16x16_meta::
	add	sp, #-8
	C$Sprite_Engine.c$250$1_0$156	= .
	.globl	C$Sprite_Engine.c$250$1_0$156
;src/engine/Sprite_Engine.c:250: set_sprite_data(meta->init_tile, meta->max_tile, pixels);    // (initial tile, final tile, sprite char array)
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	e, (hl)
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	push	de
	call	_set_sprite_data
	add	sp, #4
;src/engine/Sprite_Engine.c:253: set_sprite_tile(meta->tile0->id, meta->tile0->init_tile);    // (sprite index, tile), gives sprite its id
	ld	hl, #0x0009
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	inc	de
	ld	a, (de)
	ld	e, a
	ld	d, (hl)
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;src/engine/Sprite_Engine.c:254: set_sprite_tile(meta->tile1->id, meta->tile1->init_tile);    // (sprite index, tile), gives sprite its id
	ld	hl, #0x000b
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#4
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	inc	de
	ld	a, (de)
	ld	e, a
	ld	d, (hl)
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;src/engine/Sprite_Engine.c:255: set_sprite_tile(meta->tile2->id, meta->tile2->init_tile);    // (sprite index, tile), gives sprite its id
	ld	hl, #0x000d
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#6
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#5
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, l
	ld	d, h
	inc	de
	ld	a, (de)
	ld	e, a
	ld	d, (hl)
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, d
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;src/engine/Sprite_Engine.c:256: set_sprite_tile(meta->tile3->id, meta->tile3->init_tile);    // (sprite index, tile), gives sprite its id
	ld	hl, #0x000f
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	c, l
	ld	b, h
	inc	bc
	ld	a, (bc)
	ld	c, a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	de, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
;src/engine/Sprite_Engine.c:259: move_sprite(meta->tile0->id, meta->tile0->x, meta->tile0->y);
	pop	de
	push	de
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	ld	a, (bc)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;src/engine/Sprite_Engine.c:260: move_sprite(meta->tile1->id, meta->tile1->x, meta->tile1->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	ld	a, (bc)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;src/engine/Sprite_Engine.c:261: move_sprite(meta->tile2->id, meta->tile2->x, meta->tile2->y);
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	ld	a, (bc)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;src/engine/Sprite_Engine.c:262: move_sprite(meta->tile3->id, meta->tile3->x, meta->tile3->y);
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ld	c, a
	inc	de
	ld	a, (de)
	ld	b, a
	ld	hl, #0x0004
	add	hl, bc
	ld	d, (hl)
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	inc	hl
	ld	e, (hl)
	ld	a, (bc)
;C:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
	C$Sprite_Engine.c$264$1_0$156	= .
	.globl	C$Sprite_Engine.c$264$1_0$156
;src/engine/Sprite_Engine.c:264: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$Sprite_Engine.c$265$1_0$156	= .
	.globl	C$Sprite_Engine.c$265$1_0$156
;src/engine/Sprite_Engine.c:265: wait_vbl_done();
	call	_wait_vbl_done
	C$Sprite_Engine.c$266$1_0$156	= .
	.globl	C$Sprite_Engine.c$266$1_0$156
;src/engine/Sprite_Engine.c:266: }
	add	sp, #8
	C$Sprite_Engine.c$266$1_0$156	= .
	.globl	C$Sprite_Engine.c$266$1_0$156
	XG$setup_16x16_meta$0$0	= .
	.globl	XG$setup_16x16_meta$0$0
	ret
	G$change_sprite_tile$0$0	= .
	.globl	G$change_sprite_tile$0$0
	C$Sprite_Engine.c$268$1_0$182	= .
	.globl	C$Sprite_Engine.c$268$1_0$182
;src/engine/Sprite_Engine.c:268: void change_sprite_tile(Sprite *s) 
;	---------------------------------
; Function change_sprite_tile
; ---------------------------------
_change_sprite_tile::
	add	sp, #-4
;src/engine/Sprite_Engine.c:271: UINT8 current_tile = get_sprite_tile(s->id);
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
	ldhl	sp,	#0
	ld	(hl), a
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	a, (hl)
	ldhl	sp,	#1
	ld	(hl), a
	C$Sprite_Engine.c$272$1_0$182	= .
	.globl	C$Sprite_Engine.c$272$1_0$182
;src/engine/Sprite_Engine.c:272: if (current_tile < s->max_tile - 1) {
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
	ld	b, #0x00
	dec	bc
	ldhl	sp,	#1
	ld	a, (hl+)
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	sub	a, c
	ld	a, (hl)
	sbc	a, b
	ld	d, (hl)
	ld	a, b
	bit	7,a
	jr	Z, 00114$
	bit	7, d
	jr	NZ, 00115$
	cp	a, a
	jr	00115$
00114$:
	bit	7, d
	jr	Z, 00115$
	scf
00115$:
	jr	NC, 00102$
;src/engine/Sprite_Engine.c:273: set_sprite_tile(s->id, ++current_tile);
	ldhl	sp,	#1
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	c, a
	inc	c
	ld	de, #_shadow_OAM+0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), c
	C$Sprite_Engine.c$273$1_0$182	= .
	.globl	C$Sprite_Engine.c$273$1_0$182
;src/engine/Sprite_Engine.c:273: set_sprite_tile(s->id, ++current_tile);
	jr	00107$
00102$:
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ldhl	sp,	#0
	ld	l, (hl)
	ld	h, #0x00
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	(hl), #0x00
	C$Sprite_Engine.c$276$1_0$182	= .
	.globl	C$Sprite_Engine.c$276$1_0$182
;src/engine/Sprite_Engine.c:276: set_sprite_tile(s->id, 0);
00107$:
	C$Sprite_Engine.c$278$1_0$182	= .
	.globl	C$Sprite_Engine.c$278$1_0$182
;src/engine/Sprite_Engine.c:278: }
	add	sp, #4
	C$Sprite_Engine.c$278$1_0$182	= .
	.globl	C$Sprite_Engine.c$278$1_0$182
	XG$change_sprite_tile$0$0	= .
	.globl	XG$change_sprite_tile$0$0
	ret
	G$animate_sprite$0$0	= .
	.globl	G$animate_sprite$0$0
	C$Sprite_Engine.c$280$1_0$196	= .
	.globl	C$Sprite_Engine.c$280$1_0$196
;src/engine/Sprite_Engine.c:280: void animate_sprite(Sprite *s) 
;	---------------------------------
; Function animate_sprite
; ---------------------------------
_animate_sprite::
	add	sp, #-4
	C$Sprite_Engine.c$282$2_0$196	= .
	.globl	C$Sprite_Engine.c$282$2_0$196
;src/engine/Sprite_Engine.c:282: for (UINT8 tile_idx = 0; tile_idx < s->max_tile; tile_idx++) {
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0002
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#3
	ld	(hl), #0x00
00104$:
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	a, (hl-)
	sub	a, (hl)
	jr	NC, 00106$
;src/engine/Sprite_Engine.c:283: set_sprite_tile(s->id, tile_idx);
	ld	a, (bc)
	ld	e, a
;C:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	ld	e, l
	ld	d, h
	ldhl	sp,	#3
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$284$3_0$197	= .
	.globl	C$Sprite_Engine.c$284$3_0$197
;src/engine/Sprite_Engine.c:284: delay(350);
	push	bc
	ld	de, #0x015e
	push	de
	call	_delay
	pop	hl
	pop	bc
	C$Sprite_Engine.c$282$2_0$196	= .
	.globl	C$Sprite_Engine.c$282$2_0$196
;src/engine/Sprite_Engine.c:282: for (UINT8 tile_idx = 0; tile_idx < s->max_tile; tile_idx++) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00104$
00106$:
	C$Sprite_Engine.c$286$2_0$196	= .
	.globl	C$Sprite_Engine.c$286$2_0$196
;src/engine/Sprite_Engine.c:286: }
	add	sp, #4
	C$Sprite_Engine.c$286$2_0$196	= .
	.globl	C$Sprite_Engine.c$286$2_0$196
	XG$animate_sprite$0$0	= .
	.globl	XG$animate_sprite$0$0
	ret
	G$translate_sprite$0$0	= .
	.globl	G$translate_sprite$0$0
	C$Sprite_Engine.c$288$2_0$202	= .
	.globl	C$Sprite_Engine.c$288$2_0$202
;src/engine/Sprite_Engine.c:288: void translate_sprite(Sprite *s) {
;	---------------------------------
; Function translate_sprite
; ---------------------------------
_translate_sprite::
	C$Sprite_Engine.c$290$1_0$202	= .
	.globl	C$Sprite_Engine.c$290$1_0$202
;src/engine/Sprite_Engine.c:290: switch(joypad()) {
	call	_joypad
	ld	c, e
	C$Sprite_Engine.c$292$1_0$202	= .
	.globl	C$Sprite_Engine.c$292$1_0$202
;src/engine/Sprite_Engine.c:292: scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	C$Sprite_Engine.c$290$1_0$202	= .
	.globl	C$Sprite_Engine.c$290$1_0$202
;src/engine/Sprite_Engine.c:290: switch(joypad()) {
	ld	a, c
	dec	a
	jr	Z, 00102$
	ld	a,c
	cp	a,#0x02
	jr	Z, 00101$
	cp	a,#0x04
	jr	Z, 00103$
	sub	a, #0x08
	jr	Z, 00104$
	jr	00105$
	C$Sprite_Engine.c$291$2_0$203	= .
	.globl	C$Sprite_Engine.c$291$2_0$203
;src/engine/Sprite_Engine.c:291: case J_LEFT:
00101$:
;src/engine/Sprite_Engine.c:292: scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
	C$Sprite_Engine.c$294$2_0$203	= .
	.globl	C$Sprite_Engine.c$294$2_0$203
;src/engine/Sprite_Engine.c:294: break;
	jr	00105$
	C$Sprite_Engine.c$295$2_0$203	= .
	.globl	C$Sprite_Engine.c$295$2_0$203
;src/engine/Sprite_Engine.c:295: case J_RIGHT:
00102$:
;src/engine/Sprite_Engine.c:296: scroll_sprite(s->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
	C$Sprite_Engine.c$298$2_0$203	= .
	.globl	C$Sprite_Engine.c$298$2_0$203
;src/engine/Sprite_Engine.c:298: break;
	jr	00105$
	C$Sprite_Engine.c$299$2_0$203	= .
	.globl	C$Sprite_Engine.c$299$2_0$203
;src/engine/Sprite_Engine.c:299: case J_UP:
00103$:
;src/engine/Sprite_Engine.c:300: scroll_sprite(s->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
	C$Sprite_Engine.c$302$2_0$203	= .
	.globl	C$Sprite_Engine.c$302$2_0$203
;src/engine/Sprite_Engine.c:302: break;
	jr	00105$
	C$Sprite_Engine.c$303$2_0$203	= .
	.globl	C$Sprite_Engine.c$303$2_0$203
;src/engine/Sprite_Engine.c:303: case J_DOWN:
00104$:
;src/engine/Sprite_Engine.c:304: scroll_sprite(s->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
	ld	bc, #_shadow_OAM+0
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
	C$Sprite_Engine.c$307$1_0$202	= .
	.globl	C$Sprite_Engine.c$307$1_0$202
;src/engine/Sprite_Engine.c:307: }
00105$:
	C$Sprite_Engine.c$308$1_0$202	= .
	.globl	C$Sprite_Engine.c$308$1_0$202
;src/engine/Sprite_Engine.c:308: cpu_wait(5000); // change to wait function
	ld	de, #0x1388
	push	de
	call	_cpu_wait
	pop	hl
	C$Sprite_Engine.c$309$1_0$202	= .
	.globl	C$Sprite_Engine.c$309$1_0$202
;src/engine/Sprite_Engine.c:309: }
	C$Sprite_Engine.c$309$1_0$202	= .
	.globl	C$Sprite_Engine.c$309$1_0$202
	XG$translate_sprite$0$0	= .
	.globl	XG$translate_sprite$0$0
	ret
	G$translate_16x16_meta$0$0	= .
	.globl	G$translate_16x16_meta$0$0
	C$Sprite_Engine.c$311$1_0$217	= .
	.globl	C$Sprite_Engine.c$311$1_0$217
;src/engine/Sprite_Engine.c:311: void translate_16x16_meta(MetaSprite16x16 *meta) {
;	---------------------------------
; Function translate_16x16_meta
; ---------------------------------
_translate_16x16_meta::
	dec	sp
	dec	sp
	C$Sprite_Engine.c$313$1_0$217	= .
	.globl	C$Sprite_Engine.c$313$1_0$217
;src/engine/Sprite_Engine.c:313: switch(joypad()) {
	call	_joypad
	C$Sprite_Engine.c$315$1_0$217	= .
	.globl	C$Sprite_Engine.c$315$1_0$217
;src/engine/Sprite_Engine.c:315: scroll_sprite(meta->tile0->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0009
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	C$Sprite_Engine.c$313$1_0$217	= .
	.globl	C$Sprite_Engine.c$313$1_0$217
;src/engine/Sprite_Engine.c:313: switch(joypad()) {
	ld	a, e
	dec	a
	jr	Z, 00102$
	ld	a,e
	cp	a,#0x02
	jr	Z, 00101$
	cp	a,#0x04
	jp	Z,00103$
	sub	a, #0x08
	jp	Z,00104$
	jp	00105$
	C$Sprite_Engine.c$314$2_0$218	= .
	.globl	C$Sprite_Engine.c$314$2_0$218
;src/engine/Sprite_Engine.c:314: case J_LEFT:
00101$:
;src/engine/Sprite_Engine.c:315: scroll_sprite(meta->tile0->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
;src/engine/Sprite_Engine.c:316: scroll_sprite(meta->tile1->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000b
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
;src/engine/Sprite_Engine.c:317: scroll_sprite(meta->tile2->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000d
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, (hl)
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
;src/engine/Sprite_Engine.c:318: scroll_sprite(meta->tile3->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
	C$Sprite_Engine.c$319$2_0$218	= .
	.globl	C$Sprite_Engine.c$319$2_0$218
;src/engine/Sprite_Engine.c:319: break;
	jp	00105$
	C$Sprite_Engine.c$320$2_0$218	= .
	.globl	C$Sprite_Engine.c$320$2_0$218
;src/engine/Sprite_Engine.c:320: case J_RIGHT:
00102$:
;src/engine/Sprite_Engine.c:321: scroll_sprite(meta->tile0->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
;src/engine/Sprite_Engine.c:322: scroll_sprite(meta->tile1->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000b
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
;src/engine/Sprite_Engine.c:323: scroll_sprite(meta->tile2->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000d
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
;src/engine/Sprite_Engine.c:324: scroll_sprite(meta->tile3->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
	C$Sprite_Engine.c$325$2_0$218	= .
	.globl	C$Sprite_Engine.c$325$2_0$218
;src/engine/Sprite_Engine.c:325: break;
	jp	00105$
	C$Sprite_Engine.c$326$2_0$218	= .
	.globl	C$Sprite_Engine.c$326$2_0$218
;src/engine/Sprite_Engine.c:326: case J_UP:
00103$:
;src/engine/Sprite_Engine.c:327: scroll_sprite(meta->tile0->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;src/engine/Sprite_Engine.c:328: scroll_sprite(meta->tile1->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000b
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;src/engine/Sprite_Engine.c:329: scroll_sprite(meta->tile2->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000d
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;src/engine/Sprite_Engine.c:330: scroll_sprite(meta->tile3->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
	C$Sprite_Engine.c$331$2_0$218	= .
	.globl	C$Sprite_Engine.c$331$2_0$218
;src/engine/Sprite_Engine.c:331: break;
	jr	00105$
	C$Sprite_Engine.c$332$2_0$218	= .
	.globl	C$Sprite_Engine.c$332$2_0$218
;src/engine/Sprite_Engine.c:332: case J_DOWN:
00104$:
;src/engine/Sprite_Engine.c:333: scroll_sprite(meta->tile0->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	pop	de
	push	de
	ld	a, (de)
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	inc	de
	ld	a, (de)
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;src/engine/Sprite_Engine.c:334: scroll_sprite(meta->tile1->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000b
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;src/engine/Sprite_Engine.c:335: scroll_sprite(meta->tile2->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000d
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;src/engine/Sprite_Engine.c:336: scroll_sprite(meta->tile3->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000f
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	ld	c, (hl)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
	C$Sprite_Engine.c$338$1_0$217	= .
	.globl	C$Sprite_Engine.c$338$1_0$217
;src/engine/Sprite_Engine.c:338: }
00105$:
	C$Sprite_Engine.c$339$1_0$217	= .
	.globl	C$Sprite_Engine.c$339$1_0$217
;src/engine/Sprite_Engine.c:339: cpu_wait(50); // change to wait function
	ld	de, #0x0032
	push	de
	call	_cpu_wait
	pop	hl
	C$Sprite_Engine.c$340$1_0$217	= .
	.globl	C$Sprite_Engine.c$340$1_0$217
;src/engine/Sprite_Engine.c:340: }
	inc	sp
	inc	sp
	C$Sprite_Engine.c$340$1_0$217	= .
	.globl	C$Sprite_Engine.c$340$1_0$217
	XG$translate_16x16_meta$0$0	= .
	.globl	XG$translate_16x16_meta$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
