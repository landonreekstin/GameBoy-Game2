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
	.globl _testMeta
	.globl _SmileToSurprised
	.globl _cpu_wait
	.globl _initSprite
	.globl _sprite_setup
	.globl _change_sprite_tile
	.globl _animate_sprite
	.globl _translate_sprite
	.globl _translate_meta_sprite
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
_SmileToSurprised::
	.ds 96
_testMeta::
	.ds 80
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
;sprites.h:84: void initSprite(Sprite* sprite, uint8_t id, uint8_t* metaStartTilePtr, uint8_t metaNoTiles, uint8_t initTile, uint8_t maxTile, uint8_t x, uint8_t y, 
;	---------------------------------
; Function initSprite
; ---------------------------------
_initSprite::
;sprites.h:86: sprite->id = id;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
	ld	a, (hl)
	ld	(bc), a
;sprites.h:87: sprite->metaStartTilePtr = metaStartTilePtr;
	ld	hl, #0x0006
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#5
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;sprites.h:88: sprite->metaNoTiles = metaNoTiles;
	ld	hl, #0x0008
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#7
	ld	a, (hl)
	ld	(de), a
;sprites.h:89: sprite->initTile = initTile;
	ld	hl, #0x0009
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
;sprites.h:90: sprite->maxTile = maxTile;
	ld	hl, #0x000a
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;sprites.h:91: sprite->x = x;
	ld	hl, #0x000b
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#10
	ld	a, (hl)
	ld	(de), a
;sprites.h:92: sprite->y = y;
	ld	hl, #0x000c
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#11
	ld	a, (hl)
	ld	(de), a
;sprites.h:93: sprite->metaWidth = metaWidth;
	ld	hl, #0x000d
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#12
	ld	a, (hl)
	ld	(de), a
;sprites.h:94: sprite->metaHeight = metaHeight;
	ld	hl, #0x000e
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#13
	ld	a, (hl)
	ld	(de), a
;sprites.h:95: sprite->gravity = gravity;
	ld	hl, #0x000f
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#14
	ld	a, (hl)
	ld	(de), a
;sprites.h:96: sprite->velocity = velocity;
	ld	hl, #0x0010
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#15
	ld	a, (hl)
	ld	(bc), a
;sprites.h:97: } 
	ret
;sprites.h:102: void sprite_setup(Sprite *s, unsigned char pixels[]) {   // if sprite pixel data is used elsewhere, then use pixel_data(). If setup is only function which needs the pixel data array, pass that in directly
;	---------------------------------
; Function sprite_setup
; ---------------------------------
_sprite_setup::
	add	sp, #-14
;sprites.h:103: set_sprite_data(0, s->maxTile, pixels);    // (initial tile, final tile, sprite char array)
	ldhl	sp,	#16
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000a
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#18
	ld	e, (hl)
	inc	hl
	ld	d, (hl)
	push	de
	ld	h, a
	ld	l, #0x00
	push	hl
	call	_set_sprite_data
	add	sp, #4
;sprites.h:104: set_sprite_tile(0, s->initTile);                      // (sprite index, tile)
	ld	hl, #0x0009
	add	hl, bc
	inc	sp
	inc	sp
	ld	e, l
	ld	d, h
	push	de
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	de, #(_shadow_OAM + 2)
	ld	a, (hl)
	ld	(de), a
;sprites.h:105: move_sprite(0, s->x, s->y);                     // (sprite index, x, y)
	ld	hl, #0x000c
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
	ldhl	sp,	#12
	ld	(hl), a
	ld	hl, #0x000b
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
	ldhl	sp,	#13
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ld	(hl-), a
	ld	de, #_shadow_OAM+0
	ld	a, (hl+)
	ld	(de), a
	inc	de
	ld	a, (hl)
	ld	(de), a
;sprites.h:108: if (s->isMetaSprite) {
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	ld	a, (hl)
	or	a, a
	jp	Z, 00103$
;sprites.h:110: for (i = 0; i < s->metaNoTiles; i++) {
	ld	hl, #0x0002
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#8
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#7
	ld	(hl), a
	ld	hl, #0x0008
	add	hl, bc
	push	hl
	ld	a, l
	ldhl	sp,	#10
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#9
	ld	(hl), a
	ldhl	sp,	#13
	ld	(hl), #0x00
00109$:
	ldhl	sp,#8
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (de)
	ld	(hl), a
;sprites.h:111: s->metaIDs[i] = s->initTile + i;
	ldhl	sp,#6
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ldhl	sp,	#13
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	push	hl
	ld	a, l
	ldhl	sp,	#13
	ld	(hl), a
	pop	hl
	ld	a, h
	ldhl	sp,	#12
;sprites.h:110: for (i = 0; i < s->metaNoTiles; i++) {
	ld	(hl+), a
	ld	a, (hl)
	ldhl	sp,	#10
	sub	a, (hl)
	jr	NC, 00101$
;sprites.h:111: s->metaIDs[i] = s->initTile + i;
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#13
	add	a, (hl)
	dec	hl
	dec	hl
	push	af
	ld	a,	(hl+)
	ld	h, (hl)
	ld	l, a
	pop	af
	ld	(hl), a
;sprites.h:110: for (i = 0; i < s->metaNoTiles; i++) {
	ldhl	sp,	#13
	inc	(hl)
	jr	00109$
00101$:
;sprites.h:113: s->metaIDs[i] = s->id + i;
	ld	a, (bc)
	ldhl	sp,	#13
	add	a, (hl)
	ld	(hl-), a
	dec	hl
	ld	a, (hl+)
	ld	e, a
	ld	a, (hl+)
	ld	d, a
	ld	a, (hl)
	ld	(de), a
;sprites.h:114: set_sprite_tile(s->metaIDs[i], s->metaIDs[i]);
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	l, (hl)
	ld	d, #0x00
	ld	h, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;sprites.h:115: move_sprite(s->id, s->x, s->y);
	ldhl	sp,#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#13
	ld	(hl), a
	ldhl	sp,#4
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	a, (de)
	ldhl	sp,	#12
	ld	(hl), a
	ld	a, (bc)
	ld	c, a
;c:/gbdk/include/gb/gb.h:1520: OAM_item_t * itm = &shadow_OAM[nb];
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, c
	add	hl, hl
	add	hl, hl
	ld	de, #_shadow_OAM
	add	hl, de
	ld	c, l
	ld	b, h
;c:/gbdk/include/gb/gb.h:1521: itm->y=y, itm->x=x;
	ldhl	sp,	#13
	ld	a, (hl-)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;sprites.h:115: move_sprite(s->id, s->x, s->y);
00103$:
;sprites.h:117: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;sprites.h:118: }
	add	sp, #14
	ret
;sprites.h:140: void change_sprite_tile(Sprite *s) {
;	---------------------------------
; Function change_sprite_tile
; ---------------------------------
_change_sprite_tile::
	add	sp, #-6
;sprites.h:142: uint8_t currentTile = get_sprite_tile(s->id);
	ldhl	sp,	#8
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
;sprites.h:143: if (currentTile < s->maxTile - 1) {
	ld	hl, #0x000a
	add	hl, bc
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	xor	a, a
	ld	(hl-), a
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	ld	hl, #0x0001
	ld	a, e
	sub	a, l
	ld	e, a
	ld	a, d
	sbc	a, h
	ldhl	sp,	#3
	ld	(hl-), a
	ld	a, e
	ld	(hl-), a
	ld	a, (hl)
	ldhl	sp,	#4
	ld	(hl+), a
	ld	(hl), #0x00
	ldhl	sp,	#4
	ld	e, l
	ld	d, h
	ldhl	sp,	#2
	ld	a, (de)
	inc	de
	sub	a, (hl)
	inc	hl
	ld	a, (de)
	sbc	a, (hl)
	ld	a, (de)
	ld	d, a
	bit	7, (hl)
	jr	Z, 00132$
	bit	7, d
	jr	NZ, 00133$
	cp	a, a
	jr	00133$
00132$:
	bit	7, d
	jr	Z, 00133$
	scf
00133$:
	jr	NC, 00102$
;sprites.h:144: set_sprite_tile(s->id, ++currentTile);
	ldhl	sp,	#1
;c:/gbdk/include/gb/gb.h:1447: shadow_OAM[nb].tile=tile;
	ld	a, (hl-)
	ld	e, a
	inc	e
	ld	l, (hl)
	ld	d, #0x00
	ld	h, d
	add	hl, hl
	add	hl, hl
	push	de
	ld	de, #_shadow_OAM
	add	hl, de
	inc	hl
	inc	hl
	pop	de
	ld	(hl), e
;sprites.h:144: set_sprite_tile(s->id, ++currentTile);
	jr	00103$
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
;sprites.h:147: set_sprite_tile(s->id, 0);
00103$:
;sprites.h:151: if (s->isMetaSprite) {
	ld	e, c
	ld	d, b
	inc	de
	ld	a, (de)
	or	a, a
	jr	Z, 00115$
;sprites.h:152: uint8_t currentTile = get_sprite_tile(s->id);
	ld	a, (bc)
	ld	e, a
	ld	d, e
	ld	h, #0x00
;	spillPairReg hl
;	spillPairReg hl
	ld	l, d
	add	hl, hl
	add	hl, hl
	ld	a, #<(_shadow_OAM)
	add	a, l
	ld	l, a
;	spillPairReg hl
;	spillPairReg hl
	ld	a, #>(_shadow_OAM)
	adc	a, h
	ld	h, a
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	d, (hl)
;sprites.h:153: if (currentTile < s->metaIDs[s->metaNoTiles - 1]) {
	ld	l, c
;	spillPairReg hl
;	spillPairReg hl
	ld	h, b
;	spillPairReg hl
;	spillPairReg hl
	inc	hl
	inc	hl
	ld	a, c
	add	a, #0x08
	ld	c, a
	jr	NC, 00134$
	inc	b
00134$:
	ld	a, (bc)
	dec	a
	add	a, l
	ld	c, a
	ld	a, #0x00
	adc	a, h
	ld	b, a
	ld	a, (bc)
	ld	c, a
	ld	a, d
	sub	a, c
	jr	NC, 00105$
;sprites.h:154: set_sprite_tile(s->id, ++currentTile);
	ld	c, d
	inc	c
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
	ld	(hl), c
;sprites.h:154: set_sprite_tile(s->id, ++currentTile);
	jr	00115$
00105$:
;sprites.h:157: set_sprite_tile(s->id, s->metaIDs[0]);
	ld	c, (hl)
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
	ld	(hl), c
;sprites.h:157: set_sprite_tile(s->id, s->metaIDs[0]);
00115$:
;sprites.h:160: }
	add	sp, #6
	ret
;sprites.h:164: void animate_sprite(Sprite *s) {
;	---------------------------------
; Function animate_sprite
; ---------------------------------
_animate_sprite::
	add	sp, #-4
;sprites.h:165: for (uint8_t tileIdx = 0; tileIdx < s->maxTile; tileIdx++) {
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x000a
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
;sprites.h:166: set_sprite_tile(s->id, tileIdx);
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
;sprites.h:167: delay(350);
	push	bc
	ld	de, #0x015e
	push	de
	call	_delay
	pop	hl
	pop	bc
;sprites.h:165: for (uint8_t tileIdx = 0; tileIdx < s->maxTile; tileIdx++) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00104$
00106$:
;sprites.h:169: }
	add	sp, #4
	ret
;sprites.h:173: void translate_sprite(Sprite *s) {
;	---------------------------------
; Function translate_sprite
; ---------------------------------
_translate_sprite::
;sprites.h:175: switch(joypad()) {
	call	_joypad
	ld	c, e
;sprites.h:177: scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;sprites.h:175: switch(joypad()) {
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
;sprites.h:176: case J_LEFT:
00101$:
;sprites.h:177: scroll_sprite(s->id, -1 * DEFAULT_SCROLL_SPEED, 0);
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
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl), a
;sprites.h:178: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:179: break;
	jr	00105$
;sprites.h:180: case J_RIGHT:
00102$:
;sprites.h:181: scroll_sprite(s->id, 1 * DEFAULT_SCROLL_SPEED, 0);
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
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl), a
;sprites.h:182: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:183: break;
	jr	00105$
;sprites.h:184: case J_UP:
00103$:
;sprites.h:185: scroll_sprite(s->id, 0, -1 * DEFAULT_SCROLL_SPEED);
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
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:186: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:187: break;
	jr	00105$
;sprites.h:188: case J_DOWN:
00104$:
;sprites.h:189: scroll_sprite(s->id, 0, 1 * DEFAULT_SCROLL_SPEED);
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
	add	a, #0x0a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:190: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:192: }
00105$:
;sprites.h:193: cpu_wait(1000); // change to wait function
	ld	a, #0xe8
	push	af
	inc	sp
	call	_cpu_wait
	inc	sp
;sprites.h:194: }
	ret
;sprites.h:198: void translate_meta_sprite(Sprite *s) {
;	---------------------------------
; Function translate_meta_sprite
; ---------------------------------
_translate_meta_sprite::
	add	sp, #-4
;sprites.h:200: for (i; i < s-> metaNoTiles; i++) {
	ldhl	sp,	#6
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #0x0008
	add	hl, bc
	inc	sp
	inc	sp
	push	hl
	ldhl	sp,	#3
	ld	(hl), #0x00
00112$:
	pop	de
	push	de
	ld	a, (de)
	ldhl	sp,	#2
	ld	(hl+), a
	ld	a, (hl-)
	sub	a, (hl)
	jp	NC, 00114$
;sprites.h:201: switch(joypad()) {
	call	_joypad
	ldhl	sp,	#2
	ld	(hl), e
;sprites.h:204: scroll_sprite(s->metaIDs[i], -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	ldhl	sp,	#3
	ld	l, (hl)
	ld	h, #0x00
	add	hl, de
	ld	e, l
	ld	d, h
;sprites.h:201: switch(joypad()) {
	ldhl	sp,	#2
	ld	a, (hl)
	dec	a
	jr	Z, 00102$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x02
	jr	Z, 00101$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x04
	jr	Z, 00103$
	ldhl	sp,	#2
	ld	a, (hl)
	sub	a, #0x08
	jr	Z, 00104$
	jr	00105$
;sprites.h:203: case J_LEFT:
00101$:
;sprites.h:204: scroll_sprite(s->metaIDs[i], -1 * DEFAULT_SCROLL_SPEED, 0);
	ld	a, (de)
	ld	e, a
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
	ld	a, (hl)
	add	a, #0xf6
	ld	(hl), a
;sprites.h:205: break;
	jr	00105$
;sprites.h:206: case J_RIGHT:
00102$:
;sprites.h:207: scroll_sprite(s->metaIDs[i], 1 * DEFAULT_SCROLL_SPEED, 0);
	ld	a, (de)
	ld	e, a
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
	ld	a, (hl)
	add	a, #0x0a
	ld	(hl), a
;sprites.h:208: break;
	jr	00105$
;sprites.h:209: case J_UP:
00103$:
;sprites.h:210: scroll_sprite(s->metaIDs[i], 0, -1 * DEFAULT_SCROLL_SPEED);
	ld	a, (de)
	ld	e, a
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
	add	a, #0xf6
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:211: break;
	jr	00105$
;sprites.h:212: case J_DOWN:
00104$:
;sprites.h:213: scroll_sprite(s->metaIDs[i], 0, 1 * DEFAULT_SCROLL_SPEED);
	ld	a, (de)
	ld	e, a
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
	add	a, #0x0a
	ld	(hl+), a
	ld	a, (hl)
	ld	(hl), a
;sprites.h:215: }
00105$:
;sprites.h:216: cpu_wait(1000); // change to wait function
	push	bc
	ld	a, #0xe8
	push	af
	inc	sp
	call	_cpu_wait
	inc	sp
	pop	bc
;sprites.h:200: for (i; i < s-> metaNoTiles; i++) {
	ldhl	sp,	#3
	inc	(hl)
	jp	00112$
00114$:
;sprites.h:218: }
	add	sp, #4
	ret
;main.c:18: void event_loop() {
;	---------------------------------
; Function event_loop
; ---------------------------------
_event_loop::
;main.c:21: while(1) {
00102$:
;main.c:23: translate_sprite(0);
	ld	de, #0x0000
	push	de
	call	_translate_sprite
	pop	hl
;main.c:27: }
	jr	00102$
;main.c:29: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-34
;main.c:37: metaPtr = &meta;
	ldhl	sp,	#17
	ld	c, l
	ld	b, h
;main.c:39: initSprite(metaPtr, 0, testMeta, 4, 0, 5, 84, 78, 16, 16, 0, 10);
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #0x10
	push	hl
	ld	hl, #0x104e
	push	hl
	ld	hl, #0x5405
	push	hl
	ld	hl, #0x04
	push	hl
	ld	de, #_testMeta
	push	de
	xor	a, a
	push	af
	inc	sp
	push	bc
	call	_initSprite
	add	sp, #14
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
	pop	bc
;main.c:43: sprite_setup(metaPtr, testMeta);
	ld	de, #_testMeta
	push	de
	push	bc
	call	_sprite_setup
	add	sp, #4
;main.c:44: event_loop();
	call	_event_loop
;main.c:45: }
	add	sp, #34
	ret
___str_0:
	.ascii "My first "
	.db 0x0a
	.ascii "GameBoy game!"
	.db 0x00
	.area _CODE
	.area _INITIALIZER
__xinit__SmileToSurprised:
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
__xinit__testMeta:
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
	.area _CABS (ABS)
