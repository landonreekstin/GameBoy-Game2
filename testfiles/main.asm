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
	.globl _wait
	.globl _printf
	.globl _set_sprite_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _delay
	.globl _SmileToSurprised
	.globl _sprite_constructor
	.globl _sprite_setup
	.globl _change_sprite_tile
	.globl _animate_sprite
	.globl _translate_sprite
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
;sprites.h:64: void sprite_constructor(Sprite *s, uint8_t index, uint8_t startingTile, uint8_t endTile, uint8_t xPos, uint8_t yPos, uint8_t fallSpeed, uint8_t moveSpeed) {
;	---------------------------------
; Function sprite_constructor
; ---------------------------------
_sprite_constructor::
;sprites.h:65: s-> id = index;
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	c, a
	ld	a, (hl+)
	ld	b, a
;sprites.h:66: s-> initTile = startingTile;
	ld	a, (hl+)
	ld	(bc), a
	ld	e, c
	ld	d, b
	inc	de
;sprites.h:67: s-> maxTile = endTile;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
;sprites.h:68: s-> x = xPos;
	ld	a, (hl+)
	ld	(de), a
	ld	e, c
	ld	d, b
	inc	de
	inc	de
	inc	de
	ld	a, (hl)
	ld	(de), a
;sprites.h:69: s-> y = yPos;
	ld	hl, #0x0004
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#8
	ld	a, (hl)
	ld	(de), a
;sprites.h:70: s-> gravity = fallSpeed;
	ld	hl, #0x0005
	add	hl, bc
	ld	e, l
	ld	d, h
	ldhl	sp,	#9
	ld	a, (hl)
	ld	(de), a
;sprites.h:71: s-> velocity = moveSpeed;
	ld	hl, #0x0006
	add	hl, bc
	ld	c, l
	ld	b, h
	ldhl	sp,	#10
	ld	a, (hl)
	ld	(bc), a
;sprites.h:72: } 
	ret
;sprites.h:77: void sprite_setup(Sprite *s, unsigned char pixels[]) {   // if sprite pixel data is used elsewhere, then use pixel_data(). If setup is only function which needs the pixel data array, pass that in directly
;	---------------------------------
; Function sprite_setup
; ---------------------------------
_sprite_setup::
	dec	sp
;sprites.h:78: set_sprite_data(0, s->maxTile, pixels);    // (initial tile, final tile, sprite char array)
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
;sprites.h:79: set_sprite_tile(0, s->initTile);                      // (sprite index, tile)
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
;sprites.h:80: move_sprite(0, s->x, s->y);                     // (sprite index, x, y)
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
;sprites.h:81: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
;sprites.h:82: }
	inc	sp
	ret
;sprites.h:104: void change_sprite_tile(Sprite *s) {
;	---------------------------------
; Function change_sprite_tile
; ---------------------------------
_change_sprite_tile::
	add	sp, #-4
;sprites.h:106: uint8_t currentTile = get_sprite_tile(s->id);
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
;sprites.h:107: if (currentTile < s->maxTile - 1) {
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
;sprites.h:108: set_sprite_tile(s->id, ++currentTile);
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
;sprites.h:108: set_sprite_tile(s->id, ++currentTile);
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
;sprites.h:111: set_sprite_tile(s->id, 0);
00107$:
;sprites.h:113: }
	add	sp, #4
	ret
;sprites.h:117: void animate_sprite(Sprite *s) {
;	---------------------------------
; Function animate_sprite
; ---------------------------------
_animate_sprite::
	add	sp, #-4
;sprites.h:118: for (uint8_t tileIdx = 0; tileIdx < s->maxTile; tileIdx++) {
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
;sprites.h:119: set_sprite_tile(s->id, tileIdx);
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
;sprites.h:120: delay(350);
	push	bc
	ld	de, #0x015e
	push	de
	call	_delay
	pop	hl
	pop	bc
;sprites.h:118: for (uint8_t tileIdx = 0; tileIdx < s->maxTile; tileIdx++) {
	ldhl	sp,	#3
	inc	(hl)
	jr	00104$
00106$:
;sprites.h:122: }
	add	sp, #4
	ret
;sprites.h:124: void translate_sprite(Sprite *s) {
;	---------------------------------
; Function translate_sprite
; ---------------------------------
_translate_sprite::
;sprites.h:126: switch(joypad()) {
	call	_joypad
	ld	c, e
;sprites.h:128: scroll_sprite(s->id, -1 * SPRITE_SCROLL_SPEED, 0);
	ldhl	sp,	#2
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
;sprites.h:126: switch(joypad()) {
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
;sprites.h:127: case J_LEFT:
00101$:
;sprites.h:128: scroll_sprite(s->id, -1 * SPRITE_SCROLL_SPEED, 0);
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
;sprites.h:129: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:130: break;
	jr	00105$
;sprites.h:131: case J_RIGHT:
00102$:
;sprites.h:132: scroll_sprite(s->id, 1 * SPRITE_SCROLL_SPEED, 0);
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
;sprites.h:133: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:134: break;
	jr	00105$
;sprites.h:135: case J_UP:
00103$:
;sprites.h:136: scroll_sprite(s->id, 0, -1 * SPRITE_SCROLL_SPEED);
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
;sprites.h:137: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:138: break;
	jr	00105$
;sprites.h:139: case J_DOWN:
00104$:
;sprites.h:140: scroll_sprite(s->id, 0, 1 * SPRITE_SCROLL_SPEED);
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
;sprites.h:141: change_sprite_tile(s);
	push	de
	call	_change_sprite_tile
	pop	hl
;sprites.h:143: }
00105$:
;sprites.h:144: delay(100);
	ld	de, #0x0064
	push	de
	call	_delay
	pop	hl
;sprites.h:145: }
	ret
;main.c:33: void wait(UINT8 numloops){
;	---------------------------------
; Function wait
; ---------------------------------
_wait::
;main.c:35: for(i = 0; i < numloops; i++){
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:36: wait_vbl_done();
	call	_wait_vbl_done
;main.c:35: for(i = 0; i < numloops; i++){
	inc	c
;main.c:38: }
	jr	00103$
;main.c:44: void event_loop() {
;	---------------------------------
; Function event_loop
; ---------------------------------
_event_loop::
;main.c:47: while(1) {
00102$:
;main.c:49: translate_sprite(0);
	ld	de, #0x0000
	push	de
	call	_translate_sprite
	pop	hl
;main.c:53: }
	jr	00102$
;main.c:55: void main() {
;	---------------------------------
; Function main
; ---------------------------------
_main::
	add	sp, #-7
;main.c:59: guyPtr = &guy;           // Assign pointer to object
	ldhl	sp,	#0
	ld	c, l
	ld	b, h
;main.c:61: sprite_constructor(guyPtr, 0, 0, 5, 84, 78, 0, 10);
	push	bc
	ld	a, #0x0a
	push	af
	inc	sp
	ld	hl, #0x4e
	push	hl
	ld	hl, #0x5405
	push	hl
	xor	a, a
	rrca
	push	af
	push	bc
	call	_sprite_constructor
	add	sp, #9
	ld	de, #___str_0
	push	de
	call	_printf
	pop	hl
	pop	bc
;main.c:64: sprite_setup(guyPtr, SmileToSurprised);
	ld	de, #_SmileToSurprised
	push	de
	push	bc
	call	_sprite_setup
	add	sp, #4
;main.c:65: event_loop();
	call	_event_loop
;main.c:66: }
	add	sp, #7
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
	.area _CABS (ABS)
