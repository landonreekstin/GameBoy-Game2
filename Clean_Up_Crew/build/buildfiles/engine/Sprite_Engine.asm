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
	.globl _joypad
	.globl _delay
	.globl _init_sprite
	.globl _init_16x16_meta
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
	C$Sprite_Engine.c$31$0_0$114	= .
	.globl	C$Sprite_Engine.c$31$0_0$114
;src/engine/Sprite_Engine.c:31: void init_sprite(Sprite* sprite, uint8_t id, uint8_t init_tile, uint8_t max_tile, uint8_t x, uint8_t y, uint8_t velocity, uint8_t is_visible, uint8_t has_hitbox)
;	---------------------------------
; Function init_sprite
; ---------------------------------
_init_sprite::
	C$Sprite_Engine.c$33$1_0$114	= .
	.globl	C$Sprite_Engine.c$33$1_0$114
;src/engine/Sprite_Engine.c:33: sprite->id = id;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	C$Sprite_Engine.c$34$1_0$114	= .
	.globl	C$Sprite_Engine.c$34$1_0$114
;src/engine/Sprite_Engine.c:34: sprite->init_tile = init_tile;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	C$Sprite_Engine.c$35$1_0$114	= .
	.globl	C$Sprite_Engine.c$35$1_0$114
;src/engine/Sprite_Engine.c:35: sprite->max_tile = max_tile;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	C$Sprite_Engine.c$36$1_0$114	= .
	.globl	C$Sprite_Engine.c$36$1_0$114
;src/engine/Sprite_Engine.c:36: sprite->x = x;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$37$1_0$114	= .
	.globl	C$Sprite_Engine.c$37$1_0$114
;src/engine/Sprite_Engine.c:37: sprite->y = y;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$38$1_0$114	= .
	.globl	C$Sprite_Engine.c$38$1_0$114
;src/engine/Sprite_Engine.c:38: sprite->velocity = velocity;
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$39$1_0$114	= .
	.globl	C$Sprite_Engine.c$39$1_0$114
;src/engine/Sprite_Engine.c:39: sprite->is_visible = is_visible;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$40$1_0$114	= .
	.globl	C$Sprite_Engine.c$40$1_0$114
;src/engine/Sprite_Engine.c:40: sprite->has_hitbox = has_hitbox;
	ld	hl, #0x0007
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$41$1_0$114	= .
	.globl	C$Sprite_Engine.c$41$1_0$114
;src/engine/Sprite_Engine.c:41: }
	C$Sprite_Engine.c$41$1_0$114	= .
	.globl	C$Sprite_Engine.c$41$1_0$114
	XG$init_sprite$0$0	= .
	.globl	XG$init_sprite$0$0
	ret
	G$init_16x16_meta$0$0	= .
	.globl	G$init_16x16_meta$0$0
	C$Sprite_Engine.c$43$1_0$116	= .
	.globl	C$Sprite_Engine.c$43$1_0$116
;src/engine/Sprite_Engine.c:43: void init_16x16_meta(MetaSprite16x16* meta, uint8_t meta_id, uint8_t init_tile, uint8_t max_tile, uint8_t texture_idx, 
;	---------------------------------
; Function init_16x16_meta
; ---------------------------------
_init_16x16_meta::
	add	sp, #-8
	C$Sprite_Engine.c$47$1_0$116	= .
	.globl	C$Sprite_Engine.c$47$1_0$116
;src/engine/Sprite_Engine.c:47: meta->meta_id = meta_id;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	C$Sprite_Engine.c$48$1_0$116	= .
	.globl	C$Sprite_Engine.c$48$1_0$116
;src/engine/Sprite_Engine.c:48: meta->init_tile = init_tile;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
	C$Sprite_Engine.c$49$1_0$116	= .
	.globl	C$Sprite_Engine.c$49$1_0$116
;src/engine/Sprite_Engine.c:49: meta->max_tile = max_tile;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	C$Sprite_Engine.c$50$1_0$116	= .
	.globl	C$Sprite_Engine.c$50$1_0$116
;src/engine/Sprite_Engine.c:50: meta->texture_idx = texture_idx;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$51$1_0$116	= .
	.globl	C$Sprite_Engine.c$51$1_0$116
;src/engine/Sprite_Engine.c:51: meta->x = x;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$52$1_0$116	= .
	.globl	C$Sprite_Engine.c$52$1_0$116
;src/engine/Sprite_Engine.c:52: meta->y = y;
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#17
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$53$1_0$116	= .
	.globl	C$Sprite_Engine.c$53$1_0$116
;src/engine/Sprite_Engine.c:53: meta->velocity = velocity;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#18
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$54$1_0$116	= .
	.globl	C$Sprite_Engine.c$54$1_0$116
;src/engine/Sprite_Engine.c:54: meta->is_visible = is_visible;
	ld	hl, #0x0007
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#19
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$55$1_0$116	= .
	.globl	C$Sprite_Engine.c$55$1_0$116
;src/engine/Sprite_Engine.c:55: meta->has_hitbox = has_hitbox;
	ld	hl, #0x0008
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#20
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$58$1_0$116	= .
	.globl	C$Sprite_Engine.c$58$1_0$116
;src/engine/Sprite_Engine.c:58: meta->tile0 = tile0;
	ld	hl, #0x0009
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$59$1_0$116	= .
	.globl	C$Sprite_Engine.c$59$1_0$116
;src/engine/Sprite_Engine.c:59: meta->tile1 = tile1;
	ld	hl, #0x000b
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ldhl	sp,	#23
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$60$1_0$116	= .
	.globl	C$Sprite_Engine.c$60$1_0$116
;src/engine/Sprite_Engine.c:60: meta->tile2 = tile2;
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
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$61$1_0$116	= .
	.globl	C$Sprite_Engine.c$61$1_0$116
;src/engine/Sprite_Engine.c:61: meta->tile3 = tile3;
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
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$64$1_0$116	= .
	.globl	C$Sprite_Engine.c$64$1_0$116
;src/engine/Sprite_Engine.c:64: meta->tile0->id = meta->meta_id;
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#12
	ld	a, (hl)
	ld	(bc), a
	C$Sprite_Engine.c$65$1_0$116	= .
	.globl	C$Sprite_Engine.c$65$1_0$116
;src/engine/Sprite_Engine.c:65: meta->tile1->id = meta->meta_id + 1;
	ldhl	sp,	#23
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#12
	ld	e, (hl)
	ld	a, e
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$66$1_0$116	= .
	.globl	C$Sprite_Engine.c$66$1_0$116
;src/engine/Sprite_Engine.c:66: meta->tile2->id = meta->meta_id + 2;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	c, a
	C$Sprite_Engine.c$67$1_0$116	= .
	.globl	C$Sprite_Engine.c$67$1_0$116
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
	C$Sprite_Engine.c$70$1_0$116	= .
	.globl	C$Sprite_Engine.c$70$1_0$116
;src/engine/Sprite_Engine.c:70: meta->tile0->init_tile = (meta->init_tile * meta->texture_idx);
	ldhl	sp,	#21
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
	C$Sprite_Engine.c$71$1_0$116	= .
	.globl	C$Sprite_Engine.c$71$1_0$116
;src/engine/Sprite_Engine.c:71: meta->tile1->init_tile = (meta->init_tile * meta->texture_idx) + 1;
	ldhl	sp,	#23
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	inc	bc
	ldhl	sp,	#7
	ld	e, (hl)
	ld	a, e
	inc	a
	ld	(bc), a
	C$Sprite_Engine.c$72$1_0$116	= .
	.globl	C$Sprite_Engine.c$72$1_0$116
;src/engine/Sprite_Engine.c:72: meta->tile2->init_tile = (meta->init_tile * meta->texture_idx) + 2;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	c, a
	C$Sprite_Engine.c$73$1_0$116	= .
	.globl	C$Sprite_Engine.c$73$1_0$116
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
	C$Sprite_Engine.c$76$1_0$116	= .
	.globl	C$Sprite_Engine.c$76$1_0$116
;src/engine/Sprite_Engine.c:76: meta->tile0->max_tile = (meta->max_tile * meta->texture_idx);
	ldhl	sp,	#21
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
	C$Sprite_Engine.c$77$1_0$116	= .
	.globl	C$Sprite_Engine.c$77$1_0$116
;src/engine/Sprite_Engine.c:77: meta->tile1->max_tile = (meta->max_tile * meta->texture_idx) + 1;
	ldhl	sp,	#23
	ld	a, (hl+)
	ld	e, a
	C$Sprite_Engine.c$78$1_0$116	= .
	.globl	C$Sprite_Engine.c$78$1_0$116
;src/engine/Sprite_Engine.c:78: meta->tile2->max_tile = (meta->max_tile * meta->texture_idx) + 2;
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
	C$Sprite_Engine.c$79$1_0$116	= .
	.globl	C$Sprite_Engine.c$79$1_0$116
;src/engine/Sprite_Engine.c:79: meta->tile3->max_tile = (meta->max_tile * meta->texture_idx) + 3;
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
	C$Sprite_Engine.c$82$1_0$116	= .
	.globl	C$Sprite_Engine.c$82$1_0$116
;src/engine/Sprite_Engine.c:82: meta->tile0->x = meta->x;
	ldhl	sp,	#21
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$83$1_0$116	= .
	.globl	C$Sprite_Engine.c$83$1_0$116
;src/engine/Sprite_Engine.c:83: meta->tile1->x = meta->x + SPRITE_SIZE;
	ldhl	sp,	#23
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
	C$Sprite_Engine.c$84$1_0$116	= .
	.globl	C$Sprite_Engine.c$84$1_0$116
;src/engine/Sprite_Engine.c:84: meta->tile2->x = meta->x;
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(de), a
	C$Sprite_Engine.c$85$1_0$116	= .
	.globl	C$Sprite_Engine.c$85$1_0$116
;src/engine/Sprite_Engine.c:85: meta->tile3->x = meta->x + SPRITE_SIZE;
	ldhl	sp,	#27
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, c
	ld	(de), a
	C$Sprite_Engine.c$88$1_0$116	= .
	.globl	C$Sprite_Engine.c$88$1_0$116
;src/engine/Sprite_Engine.c:88: meta->tile0->y = meta->y;
	ldhl	sp,#21
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
	C$Sprite_Engine.c$89$1_0$116	= .
	.globl	C$Sprite_Engine.c$89$1_0$116
;src/engine/Sprite_Engine.c:89: meta->tile1->y = meta->y;
	ldhl	sp,#23
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
	C$Sprite_Engine.c$90$1_0$116	= .
	.globl	C$Sprite_Engine.c$90$1_0$116
;src/engine/Sprite_Engine.c:90: meta->tile2->y = meta->y + SPRITE_SIZE;
	ldhl	sp,#25
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
	C$Sprite_Engine.c$91$1_0$116	= .
	.globl	C$Sprite_Engine.c$91$1_0$116
;src/engine/Sprite_Engine.c:91: meta->tile3->y = meta->y + SPRITE_SIZE;
	ldhl	sp,#27
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0004
	add	hl, de
	ld	e, l
	ld	d, h
	ld	a, c
	ld	(de), a
	C$Sprite_Engine.c$94$1_0$116	= .
	.globl	C$Sprite_Engine.c$94$1_0$116
;src/engine/Sprite_Engine.c:94: init_sprite(meta->tile0, meta->tile0->id, meta->tile0->init_tile, meta->tile0->max_tile, 
	ldhl	sp,	#20
	ld	a, (hl-)
	push	af
	inc	sp
	ld	a, (hl-)
	dec	hl
	ld	d, a
	ld	e, #0x01
	push	de
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#13
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#19
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#29
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_init_sprite
	add	sp, #10
	C$Sprite_Engine.c$97$1_0$116	= .
	.globl	C$Sprite_Engine.c$97$1_0$116
;src/engine/Sprite_Engine.c:97: meta->tile1->x, meta->tile1->y, DEFAULT_SCROLL_SPEED, is_visible, has_hitbox);
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
	C$Sprite_Engine.c$96$1_0$116	= .
	.globl	C$Sprite_Engine.c$96$1_0$116
;src/engine/Sprite_Engine.c:96: init_sprite(meta->tile1, meta->tile1->id, meta->tile1->init_tile, meta->tile1->max_tile, 
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
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
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
	ldhl	sp,	#11
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
	call	_init_sprite
	add	sp, #10
	C$Sprite_Engine.c$99$1_0$116	= .
	.globl	C$Sprite_Engine.c$99$1_0$116
;src/engine/Sprite_Engine.c:99: meta->tile2->x, meta->tile2->y, DEFAULT_SCROLL_SPEED, is_visible, has_hitbox);
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
	C$Sprite_Engine.c$98$1_0$116	= .
	.globl	C$Sprite_Engine.c$98$1_0$116
;src/engine/Sprite_Engine.c:98: init_sprite(meta->tile2, meta->tile2->id, meta->tile2->init_tile, meta->tile2->max_tile, 
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
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
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
	ldhl	sp,	#11
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
	call	_init_sprite
	add	sp, #10
	C$Sprite_Engine.c$101$1_0$116	= .
	.globl	C$Sprite_Engine.c$101$1_0$116
;src/engine/Sprite_Engine.c:101: meta->tile3->x, meta->tile3->y, DEFAULT_SCROLL_SPEED, is_visible, has_hitbox);
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
	C$Sprite_Engine.c$100$1_0$116	= .
	.globl	C$Sprite_Engine.c$100$1_0$116
;src/engine/Sprite_Engine.c:100: init_sprite(meta->tile3, meta->tile3->id, meta->tile3->init_tile, meta->tile3->max_tile, 
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
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#20
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ld	h, #0x01
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
	ldhl	sp,	#11
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
	call	_init_sprite
	C$Sprite_Engine.c$102$1_0$116	= .
	.globl	C$Sprite_Engine.c$102$1_0$116
;src/engine/Sprite_Engine.c:102: }
	add	sp, #18
	C$Sprite_Engine.c$102$1_0$116	= .
	.globl	C$Sprite_Engine.c$102$1_0$116
	XG$init_16x16_meta$0$0	= .
	.globl	XG$init_16x16_meta$0$0
	ret
	G$setup_sprite$0$0	= .
	.globl	G$setup_sprite$0$0
	C$Sprite_Engine.c$104$1_0$118	= .
	.globl	C$Sprite_Engine.c$104$1_0$118
;src/engine/Sprite_Engine.c:104: void setup_sprite(Sprite *s, unsigned char pixels[]) 
;	---------------------------------
; Function setup_sprite
; ---------------------------------
_setup_sprite::
	dec	sp
	C$Sprite_Engine.c$106$1_0$118	= .
	.globl	C$Sprite_Engine.c$106$1_0$118
;src/engine/Sprite_Engine.c:106: set_sprite_data(s->init_tile, s->max_tile, pixels);    // (initial tile, final tile, sprite char array)
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
;src/engine/Sprite_Engine.c:107: set_sprite_tile(s->id, s->init_tile);                  // (sprite index, tile), gives sprite its id
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
;src/engine/Sprite_Engine.c:108: move_sprite(0, s->x, s->y);                            // (sprite index, x, y)
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
	C$Sprite_Engine.c$108$3_0$118	= .
	.globl	C$Sprite_Engine.c$108$3_0$118
;src/engine/Sprite_Engine.c:108: move_sprite(0, s->x, s->y);                            // (sprite index, x, y)
	C$Sprite_Engine.c$109$3_0$118	= .
	.globl	C$Sprite_Engine.c$109$3_0$118
;src/engine/Sprite_Engine.c:109: }
	inc	sp
	C$Sprite_Engine.c$109$3_0$118	= .
	.globl	C$Sprite_Engine.c$109$3_0$118
	XG$setup_sprite$0$0	= .
	.globl	XG$setup_sprite$0$0
	ret
	G$setup_16x16_meta$0$0	= .
	.globl	G$setup_16x16_meta$0$0
	C$Sprite_Engine.c$111$3_0$126	= .
	.globl	C$Sprite_Engine.c$111$3_0$126
;src/engine/Sprite_Engine.c:111: void setup_16x16_meta(MetaSprite16x16 *meta, unsigned char pixels[]) 
;	---------------------------------
; Function setup_16x16_meta
; ---------------------------------
_setup_16x16_meta::
	add	sp, #-8
	C$Sprite_Engine.c$114$1_0$126	= .
	.globl	C$Sprite_Engine.c$114$1_0$126
;src/engine/Sprite_Engine.c:114: set_sprite_data(meta->init_tile, meta->max_tile, pixels);    // (initial tile, final tile, sprite char array)
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
;src/engine/Sprite_Engine.c:117: set_sprite_tile(meta->tile0->id, meta->tile0->init_tile);    // (sprite index, tile), gives sprite its id
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
;src/engine/Sprite_Engine.c:118: set_sprite_tile(meta->tile1->id, meta->tile1->init_tile);    // (sprite index, tile), gives sprite its id
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
;src/engine/Sprite_Engine.c:119: set_sprite_tile(meta->tile2->id, meta->tile2->init_tile);    // (sprite index, tile), gives sprite its id
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
;src/engine/Sprite_Engine.c:120: set_sprite_tile(meta->tile3->id, meta->tile3->init_tile);    // (sprite index, tile), gives sprite its id
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
;src/engine/Sprite_Engine.c:123: move_sprite(meta->tile0->id, meta->tile0->x, meta->tile0->y);
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
;src/engine/Sprite_Engine.c:124: move_sprite(meta->tile1->id, meta->tile1->x, meta->tile1->y);
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
;src/engine/Sprite_Engine.c:125: move_sprite(meta->tile2->id, meta->tile2->x, meta->tile2->y);
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
;src/engine/Sprite_Engine.c:126: move_sprite(meta->tile3->id, meta->tile3->x, meta->tile3->y);
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
	C$Sprite_Engine.c$126$3_0$126	= .
	.globl	C$Sprite_Engine.c$126$3_0$126
;src/engine/Sprite_Engine.c:126: move_sprite(meta->tile3->id, meta->tile3->x, meta->tile3->y);
	C$Sprite_Engine.c$127$3_0$126	= .
	.globl	C$Sprite_Engine.c$127$3_0$126
;src/engine/Sprite_Engine.c:127: }
	add	sp, #8
	C$Sprite_Engine.c$127$3_0$126	= .
	.globl	C$Sprite_Engine.c$127$3_0$126
	XG$setup_16x16_meta$0$0	= .
	.globl	XG$setup_16x16_meta$0$0
	ret
	G$change_sprite_tile$0$0	= .
	.globl	G$change_sprite_tile$0$0
	C$Sprite_Engine.c$129$3_0$152	= .
	.globl	C$Sprite_Engine.c$129$3_0$152
;src/engine/Sprite_Engine.c:129: void change_sprite_tile(Sprite *s) 
;	---------------------------------
; Function change_sprite_tile
; ---------------------------------
_change_sprite_tile::
	add	sp, #-4
;src/engine/Sprite_Engine.c:132: uint8_t current_tile = get_sprite_tile(s->id);
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
	C$Sprite_Engine.c$133$1_0$152	= .
	.globl	C$Sprite_Engine.c$133$1_0$152
;src/engine/Sprite_Engine.c:133: if (current_tile < s->max_tile - 1) {
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
;src/engine/Sprite_Engine.c:134: set_sprite_tile(s->id, ++current_tile);
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
	C$Sprite_Engine.c$134$1_0$152	= .
	.globl	C$Sprite_Engine.c$134$1_0$152
;src/engine/Sprite_Engine.c:134: set_sprite_tile(s->id, ++current_tile);
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
	C$Sprite_Engine.c$137$1_0$152	= .
	.globl	C$Sprite_Engine.c$137$1_0$152
;src/engine/Sprite_Engine.c:137: set_sprite_tile(s->id, 0);
00107$:
	C$Sprite_Engine.c$139$1_0$152	= .
	.globl	C$Sprite_Engine.c$139$1_0$152
;src/engine/Sprite_Engine.c:139: }
	add	sp, #4
	C$Sprite_Engine.c$139$1_0$152	= .
	.globl	C$Sprite_Engine.c$139$1_0$152
	XG$change_sprite_tile$0$0	= .
	.globl	XG$change_sprite_tile$0$0
	ret
	G$animate_sprite$0$0	= .
	.globl	G$animate_sprite$0$0
	C$Sprite_Engine.c$141$1_0$166	= .
	.globl	C$Sprite_Engine.c$141$1_0$166
;src/engine/Sprite_Engine.c:141: void animate_sprite(Sprite *s) 
;	---------------------------------
; Function animate_sprite
; ---------------------------------
_animate_sprite::
	add	sp, #-4
	C$Sprite_Engine.c$143$2_0$166	= .
	.globl	C$Sprite_Engine.c$143$2_0$166
;src/engine/Sprite_Engine.c:143: for (uint8_t tile_idx = 0; tile_idx < s->max_tile; tile_idx++) {
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
;src/engine/Sprite_Engine.c:144: set_sprite_tile(s->id, tile_idx);
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
	C$Sprite_Engine.c$145$3_0$167	= .
	.globl	C$Sprite_Engine.c$145$3_0$167
;src/engine/Sprite_Engine.c:145: delay(350);
	push	bc
	ld	de, #0x015e
	push	de
	call	_delay
	pop	hl
	pop	bc
	C$Sprite_Engine.c$143$2_0$166	= .
	.globl	C$Sprite_Engine.c$143$2_0$166
;src/engine/Sprite_Engine.c:143: for (uint8_t tile_idx = 0; tile_idx < s->max_tile; tile_idx++) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00104$
00106$:
	C$Sprite_Engine.c$147$2_0$166	= .
	.globl	C$Sprite_Engine.c$147$2_0$166
;src/engine/Sprite_Engine.c:147: }
	add	sp, #4
	C$Sprite_Engine.c$147$2_0$166	= .
	.globl	C$Sprite_Engine.c$147$2_0$166
	XG$animate_sprite$0$0	= .
	.globl	XG$animate_sprite$0$0
	ret
	G$translate_sprite$0$0	= .
	.globl	G$translate_sprite$0$0
	C$Sprite_Engine.c$149$2_0$172	= .
	.globl	C$Sprite_Engine.c$149$2_0$172
;src/engine/Sprite_Engine.c:149: void translate_sprite(Sprite *s) {
;	---------------------------------
; Function translate_sprite
; ---------------------------------
_translate_sprite::
	C$Sprite_Engine.c$151$1_0$172	= .
	.globl	C$Sprite_Engine.c$151$1_0$172
;src/engine/Sprite_Engine.c:151: switch(joypad()) {
	call	_joypad
	ld	c, e
	C$Sprite_Engine.c$153$1_0$172	= .
	.globl	C$Sprite_Engine.c$153$1_0$172
;src/engine/Sprite_Engine.c:153: scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	C$Sprite_Engine.c$151$1_0$172	= .
	.globl	C$Sprite_Engine.c$151$1_0$172
;src/engine/Sprite_Engine.c:151: switch(joypad()) {
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
	C$Sprite_Engine.c$152$2_0$173	= .
	.globl	C$Sprite_Engine.c$152$2_0$173
;src/engine/Sprite_Engine.c:152: case J_LEFT:
00101$:
;src/engine/Sprite_Engine.c:153: scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	a, (de)
	ld	c, a
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
	C$Sprite_Engine.c$154$2_0$173	= .
	.globl	C$Sprite_Engine.c$154$2_0$173
;src/engine/Sprite_Engine.c:154: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
	C$Sprite_Engine.c$155$2_0$173	= .
	.globl	C$Sprite_Engine.c$155$2_0$173
;src/engine/Sprite_Engine.c:155: break;
	jr	00105$
	C$Sprite_Engine.c$156$2_0$173	= .
	.globl	C$Sprite_Engine.c$156$2_0$173
;src/engine/Sprite_Engine.c:156: case J_RIGHT:
00102$:
;src/engine/Sprite_Engine.c:157: scroll_sprite(s->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	a, (de)
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
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
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
	C$Sprite_Engine.c$158$2_0$173	= .
	.globl	C$Sprite_Engine.c$158$2_0$173
;src/engine/Sprite_Engine.c:158: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
	C$Sprite_Engine.c$159$2_0$173	= .
	.globl	C$Sprite_Engine.c$159$2_0$173
;src/engine/Sprite_Engine.c:159: break;
	jr	00105$
	C$Sprite_Engine.c$160$2_0$173	= .
	.globl	C$Sprite_Engine.c$160$2_0$173
;src/engine/Sprite_Engine.c:160: case J_UP:
00103$:
;src/engine/Sprite_Engine.c:161: scroll_sprite(s->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	a, (de)
	ld	c, a
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
	C$Sprite_Engine.c$162$2_0$173	= .
	.globl	C$Sprite_Engine.c$162$2_0$173
;src/engine/Sprite_Engine.c:162: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
	C$Sprite_Engine.c$163$2_0$173	= .
	.globl	C$Sprite_Engine.c$163$2_0$173
;src/engine/Sprite_Engine.c:163: break;
	jr	00105$
	C$Sprite_Engine.c$164$2_0$173	= .
	.globl	C$Sprite_Engine.c$164$2_0$173
;src/engine/Sprite_Engine.c:164: case J_DOWN:
00104$:
;src/engine/Sprite_Engine.c:165: scroll_sprite(s->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	a, (de)
	ld	c, a
;C:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;C:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
	C$Sprite_Engine.c$166$2_0$173	= .
	.globl	C$Sprite_Engine.c$166$2_0$173
;src/engine/Sprite_Engine.c:166: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
	C$Sprite_Engine.c$168$1_0$172	= .
	.globl	C$Sprite_Engine.c$168$1_0$172
;src/engine/Sprite_Engine.c:168: }
00105$:
	C$Sprite_Engine.c$169$1_0$172	= .
	.globl	C$Sprite_Engine.c$169$1_0$172
;src/engine/Sprite_Engine.c:169: cpu_wait(5000); // change to wait function
	ld	de, #0x1388
	push	de
	call	_cpu_wait
	pop	hl
	C$Sprite_Engine.c$170$1_0$172	= .
	.globl	C$Sprite_Engine.c$170$1_0$172
;src/engine/Sprite_Engine.c:170: }
	C$Sprite_Engine.c$170$1_0$172	= .
	.globl	C$Sprite_Engine.c$170$1_0$172
	XG$translate_sprite$0$0	= .
	.globl	XG$translate_sprite$0$0
	ret
	G$translate_16x16_meta$0$0	= .
	.globl	G$translate_16x16_meta$0$0
	C$Sprite_Engine.c$172$1_0$187	= .
	.globl	C$Sprite_Engine.c$172$1_0$187
;src/engine/Sprite_Engine.c:172: void translate_16x16_meta(MetaSprite16x16 *meta) {
;	---------------------------------
; Function translate_16x16_meta
; ---------------------------------
_translate_16x16_meta::
	dec	sp
	dec	sp
	C$Sprite_Engine.c$174$1_0$187	= .
	.globl	C$Sprite_Engine.c$174$1_0$187
;src/engine/Sprite_Engine.c:174: switch(joypad()) {
	call	_joypad
	C$Sprite_Engine.c$176$1_0$187	= .
	.globl	C$Sprite_Engine.c$176$1_0$187
;src/engine/Sprite_Engine.c:176: scroll_sprite(meta->tile0->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0009
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	C$Sprite_Engine.c$174$1_0$187	= .
	.globl	C$Sprite_Engine.c$174$1_0$187
;src/engine/Sprite_Engine.c:174: switch(joypad()) {
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
	C$Sprite_Engine.c$175$2_0$188	= .
	.globl	C$Sprite_Engine.c$175$2_0$188
;src/engine/Sprite_Engine.c:175: case J_LEFT:
00101$:
;src/engine/Sprite_Engine.c:176: scroll_sprite(meta->tile0->id, -1 * DEFAULT_SCROLL_SPEED, 0);
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
;src/engine/Sprite_Engine.c:177: scroll_sprite(meta->tile1->id, -1 * DEFAULT_SCROLL_SPEED, 0);
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
;src/engine/Sprite_Engine.c:178: scroll_sprite(meta->tile2->id, -1 * DEFAULT_SCROLL_SPEED, 0);
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
;src/engine/Sprite_Engine.c:179: scroll_sprite(meta->tile3->id, -1 * DEFAULT_SCROLL_SPEED, 0);
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
	C$Sprite_Engine.c$180$2_0$188	= .
	.globl	C$Sprite_Engine.c$180$2_0$188
;src/engine/Sprite_Engine.c:180: break;
	jp	00105$
	C$Sprite_Engine.c$181$2_0$188	= .
	.globl	C$Sprite_Engine.c$181$2_0$188
;src/engine/Sprite_Engine.c:181: case J_RIGHT:
00102$:
;src/engine/Sprite_Engine.c:182: scroll_sprite(meta->tile0->id, 1 * DEFAULT_SCROLL_SPEED, 0);
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
;src/engine/Sprite_Engine.c:183: scroll_sprite(meta->tile1->id, 1 * DEFAULT_SCROLL_SPEED, 0);
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
;src/engine/Sprite_Engine.c:184: scroll_sprite(meta->tile2->id, 1 * DEFAULT_SCROLL_SPEED, 0);
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
;src/engine/Sprite_Engine.c:185: scroll_sprite(meta->tile3->id, 1 * DEFAULT_SCROLL_SPEED, 0);
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
	C$Sprite_Engine.c$186$2_0$188	= .
	.globl	C$Sprite_Engine.c$186$2_0$188
;src/engine/Sprite_Engine.c:186: break;
	jp	00105$
	C$Sprite_Engine.c$187$2_0$188	= .
	.globl	C$Sprite_Engine.c$187$2_0$188
;src/engine/Sprite_Engine.c:187: case J_UP:
00103$:
;src/engine/Sprite_Engine.c:188: scroll_sprite(meta->tile0->id, 0, -1 * DEFAULT_SCROLL_SPEED);
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
;src/engine/Sprite_Engine.c:189: scroll_sprite(meta->tile1->id, 0, -1 * DEFAULT_SCROLL_SPEED);
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
;src/engine/Sprite_Engine.c:190: scroll_sprite(meta->tile2->id, 0, -1 * DEFAULT_SCROLL_SPEED);
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
;src/engine/Sprite_Engine.c:191: scroll_sprite(meta->tile3->id, 0, -1 * DEFAULT_SCROLL_SPEED);
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
	C$Sprite_Engine.c$192$2_0$188	= .
	.globl	C$Sprite_Engine.c$192$2_0$188
;src/engine/Sprite_Engine.c:192: break;
	jr	00105$
	C$Sprite_Engine.c$193$2_0$188	= .
	.globl	C$Sprite_Engine.c$193$2_0$188
;src/engine/Sprite_Engine.c:193: case J_DOWN:
00104$:
;src/engine/Sprite_Engine.c:194: scroll_sprite(meta->tile0->id, 0, 1 * DEFAULT_SCROLL_SPEED);
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
;src/engine/Sprite_Engine.c:195: scroll_sprite(meta->tile1->id, 0, 1 * DEFAULT_SCROLL_SPEED);
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
;src/engine/Sprite_Engine.c:196: scroll_sprite(meta->tile2->id, 0, 1 * DEFAULT_SCROLL_SPEED);
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
;src/engine/Sprite_Engine.c:197: scroll_sprite(meta->tile3->id, 0, 1 * DEFAULT_SCROLL_SPEED);
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
	C$Sprite_Engine.c$199$1_0$187	= .
	.globl	C$Sprite_Engine.c$199$1_0$187
;src/engine/Sprite_Engine.c:199: }
00105$:
	C$Sprite_Engine.c$200$1_0$187	= .
	.globl	C$Sprite_Engine.c$200$1_0$187
;src/engine/Sprite_Engine.c:200: cpu_wait(5000); // change to wait function
	ld	de, #0x1388
	push	de
	call	_cpu_wait
	pop	hl
	C$Sprite_Engine.c$201$1_0$187	= .
	.globl	C$Sprite_Engine.c$201$1_0$187
;src/engine/Sprite_Engine.c:201: }
	inc	sp
	inc	sp
	C$Sprite_Engine.c$201$1_0$187	= .
	.globl	C$Sprite_Engine.c$201$1_0$187
	XG$translate_16x16_meta$0$0	= .
	.globl	XG$translate_16x16_meta$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
