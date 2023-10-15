;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module System
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _wait_vbl_done
	.globl _cpu_wait
	.globl _render
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
	G$cpu_wait$0$0	= .
	.globl	G$cpu_wait$0$0
	C$System.c$16$0_0$102	= .
	.globl	C$System.c$16$0_0$102
;src/engine/System.c:16: void cpu_wait(UINT16 ms)
;	---------------------------------
; Function cpu_wait
; ---------------------------------
_cpu_wait::
	add	sp, #-8
	C$System.c$18$2_0$102	= .
	.globl	C$System.c$18$2_0$102
;src/engine/System.c:18: UINT32 numloops = (ms / 1000) * 60;
	ld	de, #0x03e8
	push	de
	ldhl	sp,	#12
	ld	a, (hl+)
	ld	e, a
	ld	d, (hl)
	push	de
	call	__divuint
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
	inc	sp
	inc	sp
	push	bc
	xor	a, a
	ldhl	sp,	#2
	ld	(hl+), a
	ld	(hl), a
	C$System.c$20$2_0$102	= .
	.globl	C$System.c$20$2_0$102
;src/engine/System.c:20: for(i = 0; i < numloops; i++){
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
	C$System.c$21$3_0$103	= .
	.globl	C$System.c$21$3_0$103
;src/engine/System.c:21: wait_vbl_done();
	call	_wait_vbl_done
	C$System.c$20$2_0$102	= .
	.globl	C$System.c$20$2_0$102
;src/engine/System.c:20: for(i = 0; i < numloops; i++){
	inc	b
	jr	00103$
00105$:
	C$System.c$23$2_0$102	= .
	.globl	C$System.c$23$2_0$102
;src/engine/System.c:23: }
	add	sp, #8
	C$System.c$23$2_0$102	= .
	.globl	C$System.c$23$2_0$102
	XG$cpu_wait$0$0	= .
	.globl	XG$cpu_wait$0$0
	ret
	G$render$0$0	= .
	.globl	G$render$0$0
	C$System.c$25$2_0$105	= .
	.globl	C$System.c$25$2_0$105
;src/engine/System.c:25: void render(void)
;	---------------------------------
; Function render
; ---------------------------------
_render::
	C$System.c$28$1_0$105	= .
	.globl	C$System.c$28$1_0$105
;src/engine/System.c:28: SHOW_SPRITES;
	ldh	a, (_LCDC_REG + 0)
	or	a, #0x02
	ldh	(_LCDC_REG + 0), a
	C$System.c$29$1_0$105	= .
	.globl	C$System.c$29$1_0$105
;src/engine/System.c:29: }
	C$System.c$29$1_0$105	= .
	.globl	C$System.c$29$1_0$105
	XG$render$0$0	= .
	.globl	XG$render$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
