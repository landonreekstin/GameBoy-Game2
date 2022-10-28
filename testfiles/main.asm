;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _event_loop
	.globl _printf
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _Tomcat_pixels
	.globl _testMeta
	.globl _SmileToSurprised
	.globl _cpu_wait
	.globl _init_sprite
	.globl _init_16x16_meta
	.globl _sprite_setup
	.globl _setup_16x16_meta
	.globl _change_sprite_tile
	.globl _animate_sprite
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
;system.h:14: void cpu_wait(uint8_t ms){
;	---------------------------------
; Function cpu_wait
; ---------------------------------
_cpu_wait::
	add	sp, #-8
;system.h:15: uint32_t numloops = (ms / 1000) * 60;
	ldhl	sp,	#10
	ld	c, (hl)
	ld	b, #0x00
	ld	de, #0x03e8
	push	de
	push	bc
	call	__divsint
	add	sp, #4
	ld	c, e
	ld	b, d
	ld	l, c
	ld	h, b
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, bc
	add	hl, hl
	add	hl, hl
	ld	c, l
	ld	b, h
	ldhl	sp,	#0
	ld	a, c
	ld	(hl+), a
	ld	a, b
	ld	(hl+), a
	rlca
	sbc	a, a
	ld	(hl+), a
	ld	(hl), a
;system.h:17: for(i = 0; i < numloops; i++){
	ld	b, #0x00
00103$:
	ldhl	sp,	#4
	ld	a, b
	ld	(hl+), a
	xor	a, a
	ld	(hl+), a
	ld	(hl+), a
	ld	(hl), a
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ldhl	sp,	#0
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	inc	de
	sbc	a, (hl)
	inc	hl
	ld	a, (de)
	inc	de
	sbc	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	jr	NC, 00105$
;system.h:18: wait_vbl_done();
	call	_wait_vbl_done
;system.h:17: for(i = 0; i < numloops; i++){
	inc	b
	jr	00103$
00105$:
;system.h:20: }
	add	sp, #8
	ret
;sprites.h:102: void init_sprite(Sprite* sprite, uint8_t id, uint8_t init_tile, uint8_t max_tile, uint8_t x, uint8_t y, uint8_t gravity, uint8_t velocity) {
;	---------------------------------
; Function init_sprite
; ---------------------------------
_init_sprite::
;sprites.h:103: sprite->id = id;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
;sprites.h:104: sprite->init_tile = init_tile;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
;sprites.h:105: sprite->max_tile = max_tile;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
;sprites.h:106: sprite->x = x;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
;sprites.h:107: sprite->y = y;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
;sprites.h:108: sprite->gravity = gravity;
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;sprites.h:109: sprite->velocity = velocity;
	ld	hl, #0x0006
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	a, (hl)
	ld	(bc), a
;sprites.h:110: }
	ret
;sprites.h:120: void init_16x16_meta(MetaSprite16x16* meta, uint8_t meta_id, uint8_t init_tile, uint8_t max_tile, uint8_t texture_idx, uint8_t x, uint8_t y, Sprite* tile0, Sprite* tile1, Sprite* tile2, Sprite* tile3) {
;	---------------------------------
; Function init_16x16_meta
; ---------------------------------
_init_16x16_meta::
	add	sp, #-8
;sprites.h:121: meta->meta_id = meta_id;
	ldhl	sp,	#10
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
;sprites.h:122: meta->init_tile = init_tile;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
;sprites.h:123: meta->max_tile = max_tile;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
;sprites.h:124: meta->texture_idx = texture_idx;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
;sprites.h:125: meta->x = x;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#16
	ld	a, (hl)
	ld	(de), a
;sprites.h:126: meta->y = y;
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#17
	ld	a, (hl)
	ld	(de), a
;sprites.h:129: meta->tile0 = tile0;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;sprites.h:130: meta->tile1 = tile1;
	ld	hl, #0x0008
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
;sprites.h:131: meta->tile2 = tile2;
	ld	hl, #0x000a
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
;sprites.h:132: meta->tile3 = tile3;
	ld	hl, #0x000c
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
;sprites.h:143: meta->tile0->id = meta->meta_id;
	ldhl	sp,	#18
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#12
	ld	a, (hl)
	ld	(bc), a
;sprites.h:144: meta->tile1->id = meta->meta_id + 1;
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ldhl	sp,	#12
	ld	e, (hl)
	ld	a, e
	inc	a
	ld	(bc), a
;sprites.h:145: meta->tile2->id = meta->meta_id + 2;
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	c, a
;sprites.h:146: meta->tile3->id = meta->meta_id + 3;
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
;sprites.h:149: meta->tile0->init_tile = (meta->init_tile * meta->texture_idx);
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
;sprites.h:150: meta->tile1->init_tile = (meta->init_tile * meta->texture_idx) + 1;
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
;sprites.h:151: meta->tile2->init_tile = (meta->init_tile * meta->texture_idx) + 2;
	ldhl	sp,	#22
	ld	a, (hl+)
	ld	c, a
;sprites.h:152: meta->tile3->init_tile = (meta->init_tile * meta->texture_idx) + 3;
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
;sprites.h:155: meta->tile0->max_tile = (meta->max_tile * meta->texture_idx);
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
;sprites.h:156: meta->tile1->max_tile = (meta->max_tile * meta->texture_idx) + 1;
	ldhl	sp,	#20
	ld	a, (hl+)
	ld	e, a
;sprites.h:157: meta->tile2->max_tile = (meta->max_tile * meta->texture_idx) + 2;
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
;sprites.h:158: meta->tile3->max_tile = (meta->max_tile * meta->texture_idx) + 3;
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
;sprites.h:161: meta->tile0->x = meta->x;
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
;sprites.h:162: meta->tile1->x = meta->x + SPRITE_SIZE;
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
;sprites.h:163: meta->tile2->x = meta->x;
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
;sprites.h:164: meta->tile3->x = meta->x + SPRITE_SIZE;
	ldhl	sp,	#24
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	inc	de
	inc	de
	inc	de
	ld	a, c
	ld	(de), a
;sprites.h:167: meta->tile0->y = meta->y;
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
;sprites.h:168: meta->tile1->y = meta->y;
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
;sprites.h:169: meta->tile2->y = meta->y + SPRITE_SIZE;
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
;sprites.h:170: meta->tile3->y = meta->y + SPRITE_SIZE;
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
;sprites.h:173: init_sprite(meta->tile0, meta->tile0->id, meta->tile0->init_tile, meta->tile0->max_tile, meta->tile0->x, meta->tile0->y, DEFAULT_GRAVITY, DEFAULT_SCROLL_SPEED);
	ld	hl, #0x105
	push	hl
	ldhl	sp,	#19
	ld	a, (hl-)
	ld	d, a
	ld	e, (hl)
	push	de
	push	bc
	inc	sp
	ldhl	sp,	#12
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#18
	ld	a, (hl)
	push	af
	inc	sp
	ldhl	sp,	#25
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_init_sprite
	add	sp, #9
;sprites.h:174: init_sprite(meta->tile1, meta->tile1->id, meta->tile1->init_tile, meta->tile1->max_tile, meta->tile1->x, meta->tile1->y, DEFAULT_GRAVITY, DEFAULT_SCROLL_SPEED);
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
	ld	h, #0x05
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#8
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#10
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
	add	sp, #9
;sprites.h:175: init_sprite(meta->tile2, meta->tile2->id, meta->tile2->init_tile, meta->tile2->max_tile, meta->tile2->x, meta->tile2->y, DEFAULT_GRAVITY, DEFAULT_SCROLL_SPEED);
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
	ld	h, #0x05
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#8
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#10
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
	add	sp, #9
;sprites.h:176: init_sprite(meta->tile3, meta->tile3->id, meta->tile3->init_tile, meta->tile3->max_tile, meta->tile3->x, meta->tile3->y, DEFAULT_GRAVITY, DEFAULT_SCROLL_SPEED);
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
	ld	h, #0x05
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#8
	ld	h, (hl)
;	spillPairReg hl
;	spillPairReg hl
	push	hl
	inc	sp
	ldhl	sp,	#10
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
;sprites.h:178: }
	add	sp, #17
	ret
;sprites.h:184: void sprite_setup(Sprite *s, unsigned char pixels[]) {   // if sprite pixel data is used elsewhere, then use pixel_data(). If setup is only function which needs the pixel data array, pass that in directly
;	---------------------------------
; Function sprite_setup
; ---------------------------------
_sprite_setup::
	dec	sp
;sprites.h:185: set_sprite_data(0, s->max_tile, pixels);    // (initial tile, final tile, sprite char array)
	ldhl	sp,	#3
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ld	a, (de)
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;sprites.h:186: set_sprite_tile(0, s->init_tile);           // (sprite index, tile), gives sprite its id
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	de, #(_shadow_OAM + 2)
	ld	a, (hl)
	ld	(de), a
;sprites.h:187: move_sprite(0, s->x, s->y);                // (sprite index, x, y)
	ld	hl, #0x0004
	add	hl, bc
	ld	e, (hl)
	inc	bc
	inc	bc
	inc	bc
	ld	a, (bc)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;sprites.h:189: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;sprites.h:190: }
	inc	sp
	ret
;sprites.h:196: void setup_16x16_meta(MetaSprite16x16 *meta, unsigned char pixels[]) {   // if sprite pixel data is used elsewhere, then use pixel_data(). If setup is only function which needs the pixel data array, pass that in directly
;	---------------------------------
; Function setup_16x16_meta
; ---------------------------------
_setup_16x16_meta::
	add	sp, #-8
;sprites.h:199: set_sprite_data(meta->init_tile, meta->max_tile, pixels);    // (initial tile, final tile, sprite char array)
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
;sprites.h:202: set_sprite_tile(meta->tile0->id, meta->tile0->init_tile);           // (sprite index, tile), gives sprite its id
	ld	hl, #0x0006
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
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;sprites.h:203: set_sprite_tile(meta->tile1->id, meta->tile1->init_tile);           // (sprite index, tile), gives sprite its id
	ld	hl, #0x0008
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
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;sprites.h:204: set_sprite_tile(meta->tile2->id, meta->tile2->init_tile);           // (sprite index, tile), gives sprite its id
	ld	hl, #0x000a
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
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;sprites.h:205: set_sprite_tile(meta->tile3->id, meta->tile3->init_tile);           // (sprite index, tile), gives sprite its id
	ld	hl, #0x000c
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
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;sprites.h:208: move_sprite(meta->tile0->id, meta->tile0->x, meta->tile0->y);
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
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
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
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;sprites.h:209: move_sprite(meta->tile1->id, meta->tile1->x, meta->tile1->y);
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
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
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
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;sprites.h:210: move_sprite(meta->tile2->id, meta->tile2->x, meta->tile2->y);
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
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
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
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;sprites.h:211: move_sprite(meta->tile3->id, meta->tile3->x, meta->tile3->y);
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
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
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
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	a, d
	ld	(hl+), a
	ld	(hl), e
;sprites.h:213: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;sprites.h:214: }
	add	sp, #8
	ret
;sprites.h:235: void change_sprite_tile(Sprite *s) {
;	---------------------------------
; Function change_sprite_tile
; ---------------------------------
_change_sprite_tile::
	add	sp, #-4
;sprites.h:237: uint8_t current_tile = get_sprite_tile(s->id);
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
;sprites.h:238: if (current_tile < s->max_tile - 1) {
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
;sprites.h:239: set_sprite_tile(s->id, ++current_tile);
	ldhl	sp,	#1
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;sprites.h:239: set_sprite_tile(s->id, ++current_tile);
	jr	00107$
00102$:
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;sprites.h:242: set_sprite_tile(s->id, 0);
00107$:
;sprites.h:244: }
	add	sp, #4
	ret
;sprites.h:248: void animate_sprite(Sprite *s) {
;	---------------------------------
; Function animate_sprite
; ---------------------------------
_animate_sprite::
	add	sp, #-4
;sprites.h:249: for (uint8_t tile_idx = 0; tile_idx < s->max_tile; tile_idx++) {
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
;sprites.h:250: set_sprite_tile(s->id, tile_idx);
	ld	a, (bc)
	ld	e, a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
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
;sprites.h:251: delay(350);
	push	bc
	ld	de, #0x015e
	push	de
	call	_delay
	pop	hl
	pop	bc
;sprites.h:249: for (uint8_t tile_idx = 0; tile_idx < s->max_tile; tile_idx++) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00104$
00106$:
;sprites.h:253: }
	add	sp, #4
	ret
;sprites.h:257: void translate_sprite(Sprite *s) {
;	---------------------------------
; Function translate_sprite
; ---------------------------------
_translate_sprite::
;sprites.h:259: switch(joypad()) {
	call	_joypad
	ld	c, e
;sprites.h:261: scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;sprites.h:259: switch(joypad()) {
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
;sprites.h:260: case J_LEFT:
00101$:
;sprites.h:261: scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	a, (de)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
;sprites.h:262: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:263: break;
	jr	00105$
;sprites.h:264: case J_RIGHT:
00102$:
;sprites.h:265: scroll_sprite(s->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	a, (de)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
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
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
;sprites.h:266: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:267: break;
	jr	00105$
;sprites.h:268: case J_UP:
00103$:
;sprites.h:269: scroll_sprite(s->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	a, (de)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:270: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:271: break;
	jr	00105$
;sprites.h:272: case J_DOWN:
00104$:
;sprites.h:273: scroll_sprite(s->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	a, (de)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	bc, #_shadow_OAM
	add	hl, bc
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:274: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:276: }
00105$:
;sprites.h:277: cpu_wait(5000); // change to wait function
	ld	a, #0x88
	push	af
	inc	sp
	call	_cpu_wait
	inc	sp
;sprites.h:278: }
	ret
;sprites.h:282: void translate_16x16_meta(MetaSprite16x16 *meta) {
;	---------------------------------
; Function translate_16x16_meta
; ---------------------------------
_translate_16x16_meta::
	dec	sp
	dec	sp
;sprites.h:284: switch(joypad()) {
	call	_joypad
;sprites.h:286: scroll_sprite(meta->tile0->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ldhl	sp,	#4
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0006
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
;sprites.h:284: switch(joypad()) {
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
;sprites.h:285: case J_LEFT:
00101$:
;sprites.h:286: scroll_sprite(meta->tile0->id, -1 * DEFAULT_SCROLL_SPEED, 0);
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
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
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
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
;sprites.h:287: scroll_sprite(meta->tile1->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x0008
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
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
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
;sprites.h:288: scroll_sprite(meta->tile2->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000a
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
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
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
;sprites.h:289: scroll_sprite(meta->tile3->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000c
	add	hl, bc
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (bc)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
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
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	dec	(hl)
	ld	a, (hl)
;sprites.h:290: break;
	jp	00105$
;sprites.h:291: case J_RIGHT:
00102$:
;sprites.h:292: scroll_sprite(meta->tile0->id, 1 * DEFAULT_SCROLL_SPEED, 0);
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
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
;sprites.h:293: scroll_sprite(meta->tile1->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x0008
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
;sprites.h:294: scroll_sprite(meta->tile2->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000a
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
;sprites.h:295: scroll_sprite(meta->tile3->id, 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	hl, #0x000c
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	ld	(hl+), a
	inc	(hl)
	ld	a, (hl)
;sprites.h:296: break;
	jp	00105$
;sprites.h:297: case J_UP:
00103$:
;sprites.h:298: scroll_sprite(meta->tile0->id, 0, -1 * DEFAULT_SCROLL_SPEED);
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
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:299: scroll_sprite(meta->tile1->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x0008
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:300: scroll_sprite(meta->tile2->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000a
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:301: scroll_sprite(meta->tile3->id, 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000c
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	dec	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:302: break;
	jr	00105$
;sprites.h:303: case J_DOWN:
00104$:
;sprites.h:304: scroll_sprite(meta->tile0->id, 0, 1 * DEFAULT_SCROLL_SPEED);
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
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:305: scroll_sprite(meta->tile1->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x0008
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:306: scroll_sprite(meta->tile2->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000a
	add	hl, bc
	ld	a,	(hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, e
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:307: scroll_sprite(meta->tile3->id, 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	hl, #0x000c
	add	hl, bc
	ld	a, (hl+)
	ld	h, (hl)
;	spillPairReg hl
	ld	l, a
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1536: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
;c:/gbdk/include/gb/gb.h:1537: itm->y+=y, itm->x+=x;
	ld	a, (hl)
	inc	a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:309: }
00105$:
;sprites.h:310: cpu_wait(5000); // change to wait function
	ld	a, #0x88
	push	af
	inc	sp
	call	_cpu_wait
;sprites.h:311: }
	add	sp, #3
	ret
;main.c:18: void event_loop(MetaSprite16x16* meta) {
;	---------------------------------
; Function event_loop
; ---------------------------------
_event_loop::
;main.c:21: while(1) {
00102$:
;main.c:23: translate_16x16_meta(meta);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	_translate_16x16_meta
	pop	hl
;main.c:27: }
	jr	00102$
_SmileToSurprised:
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x5a	; 90	'Z'
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xc3	; 195
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x66	; 102	'f'
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x7e	; 126
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x3c	; 60
	.db #0x24	; 36
	.db #0x42	; 66	'B'
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
	.db #0x7e	; 126
	.db #0x66	; 102	'f'
	.db #0x81	; 129
	.db #0xff	; 255
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0xa5	; 165
	.db #0x7e	; 126
	.db #0x81	; 129
	.db #0x7e	; 126
	.db #0x99	; 153
	.db #0x7e	; 126
	.db #0x5a	; 90	'Z'
	.db #0x3c	; 60
	.db #0x3c	; 60
	.db #0x00	; 0
_testMeta:
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x00	; 0
	.db #0x80	; 128
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x80	; 128
	.db #0xff	; 255
	.db #0x00	; 0
	.db #0x6b	; 107	'k'
	.db #0x94	; 148
	.db #0x22	; 34
	.db #0xdd	; 221
	.db #0x99	; 153
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x80	; 128
	.db #0xe0	; 224
	.db #0x01	; 1
	.db #0x30	; 48	'0'
	.db #0xc4	; 196
	.db #0x1f	; 31
	.db #0xe0	; 224
	.db #0xa0	; 160
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x80	; 128
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x80	; 128
	.db #0x87	; 135
	.db #0x20	; 32
	.db #0x44	; 68	'D'
	.db #0x0b	; 11
	.db #0xf8	; 248
	.db #0x07	; 7
	.db #0x05	; 5
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0xff	; 255
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x80	; 128
	.db #0x80	; 128
	.db #0x22	; 34
	.db #0x01	; 1
	.db #0x08	; 8
	.db #0x24	; 36
	.db #0x80	; 128
_Tomcat_pixels:
	.db #0x01	; 1
	.db #0x00	; 0
	.db #0x03	; 3
	.db #0x01	; 1
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x03	; 3
	.db #0x05	; 5
	.db #0x06	; 6
	.db #0x0d	; 13
	.db #0x0e	; 14
	.db #0x11	; 17
	.db #0x80	; 128
	.db #0x00	; 0
	.db #0xc0	; 192
	.db #0x80	; 128
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0xc0	; 192
	.db #0xa0	; 160
	.db #0x60	; 96
	.db #0xb0	; 176
	.db #0x70	; 112	'p'
	.db #0x88	; 136
	.db #0x1e	; 30
	.db #0x23	; 35
	.db #0x3f	; 63
	.db #0x40	; 64
	.db #0x7b	; 123
	.db #0x84	; 132
	.db #0x55	; 85	'U'
	.db #0xbe	; 190
	.db #0xb5	; 181
	.db #0x6e	; 110	'n'
	.db #0x75	; 117	'u'
	.db #0xce	; 206
	.db #0x02	; 2
	.db #0x7d	; 125
	.db #0x04	; 4
	.db #0x0e	; 14
	.db #0x78	; 120	'x'
	.db #0xc4	; 196
	.db #0xfc	; 252
	.db #0x02	; 2
	.db #0xde	; 222
	.db #0x21	; 33
	.db #0xaa	; 170
	.db #0x7d	; 125
	.db #0xad	; 173
	.db #0x76	; 118	'v'
	.db #0xae	; 174
	.db #0x73	; 115	's'
	.db #0x40	; 64
	.db #0xbe	; 190
	.db #0x20	; 32
	.db #0x70	; 112	'p'
;main.c:29: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-55
;main.c:36: metaPtr = &meta;
	ldhl	sp,	#7
	ld	c, l
	ld	b, h
;main.c:41: Sprite* sub_tile0Ptr = &sub_tile0;
	ldhl	sp,	#21
	ld	e, l
	ld	d, h
	ldhl	sp,	#49
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:42: Sprite* sub_tile1Ptr = &sub_tile1;
	ldhl	sp,	#28
	ld	e, l
	ld	d, h
	ldhl	sp,	#51
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:43: Sprite* sub_tile2Ptr = &sub_tile2;
	ldhl	sp,	#35
	ld	e, l
	ld	d, h
	ldhl	sp,	#53
	ld	a, e
	ld	(hl+), a
	ld	(hl), d
;main.c:44: Sprite* sub_tile3Ptr = &sub_tile3;
	ldhl	sp,	#42
	ld	e, l
	ld	d, h
;main.c:48: init_16x16_meta(metaPtr, 0, 0, 4, 0, 50, 50, sub_tile0Ptr, sub_tile1Ptr, sub_tile2Ptr, sub_tile3Ptr);
	push	bc
	push	de
	ldhl	sp,	#57
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#57
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	ldhl	sp,	#57
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
	push	bc
	call	_init_16x16_meta
	add	sp, #16
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
	pop	bc
;main.c:53: setup_16x16_meta(metaPtr, Tomcat_pixels);
	push	bc
	ld	de, #_Tomcat_pixels
	push	de
	push	bc
	call	_setup_16x16_meta
	add	sp, #4
	call	_event_loop
	pop	hl
;main.c:55: }
	add	sp, #55
	ret
___str_0:
	.ascii "My first "
	.db 0x0a
	.ascii "GameBoy game!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
