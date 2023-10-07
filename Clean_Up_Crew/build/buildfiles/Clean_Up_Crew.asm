;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.6 #12539 (MINGW32)
;--------------------------------------------------------
	.module Clean_Up_Crew
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _render
	.globl _init_game
	.globl _game_loop
	.globl _update
	.globl _input
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
	G$main$0$0	= .
	.globl	G$main$0$0
	C$Clean_Up_Crew.c$62$0_0$121	= .
	.globl	C$Clean_Up_Crew.c$62$0_0$121
;src/Clean_Up_Crew.c:62: int main(int argc, char *argv[]) 
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$Clean_Up_Crew.c$65$1_0$121	= .
	.globl	C$Clean_Up_Crew.c$65$1_0$121
;src/Clean_Up_Crew.c:65: init_game();
	call	_init_game
	C$Clean_Up_Crew.c$68$1_0$121	= .
	.globl	C$Clean_Up_Crew.c$68$1_0$121
;src/Clean_Up_Crew.c:68: game_loop();
	call	_game_loop
	C$Clean_Up_Crew.c$70$1_0$121	= .
	.globl	C$Clean_Up_Crew.c$70$1_0$121
;src/Clean_Up_Crew.c:70: return 0;
	ld	de, #0x0000
	C$Clean_Up_Crew.c$71$1_0$121	= .
	.globl	C$Clean_Up_Crew.c$71$1_0$121
;src/Clean_Up_Crew.c:71: }
	C$Clean_Up_Crew.c$71$1_0$121	= .
	.globl	C$Clean_Up_Crew.c$71$1_0$121
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
	G$init_game$0$0	= .
	.globl	G$init_game$0$0
	C$Clean_Up_Crew.c$79$1_0$123	= .
	.globl	C$Clean_Up_Crew.c$79$1_0$123
;src/Clean_Up_Crew.c:79: void init_game()
;	---------------------------------
; Function init_game
; ---------------------------------
_init_game::
	C$Clean_Up_Crew.c$84$1_0$123	= .
	.globl	C$Clean_Up_Crew.c$84$1_0$123
;src/Clean_Up_Crew.c:84: }
	C$Clean_Up_Crew.c$84$1_0$123	= .
	.globl	C$Clean_Up_Crew.c$84$1_0$123
	XG$init_game$0$0	= .
	.globl	XG$init_game$0$0
	ret
	G$game_loop$0$0	= .
	.globl	G$game_loop$0$0
	C$Clean_Up_Crew.c$92$1_0$124	= .
	.globl	C$Clean_Up_Crew.c$92$1_0$124
;src/Clean_Up_Crew.c:92: void game_loop()
;	---------------------------------
; Function game_loop
; ---------------------------------
_game_loop::
	C$Clean_Up_Crew.c$94$1_0$124	= .
	.globl	C$Clean_Up_Crew.c$94$1_0$124
;src/Clean_Up_Crew.c:94: while(1)
00102$:
	C$Clean_Up_Crew.c$100$2_0$125	= .
	.globl	C$Clean_Up_Crew.c$100$2_0$125
;src/Clean_Up_Crew.c:100: render();
	call	_render
	C$Clean_Up_Crew.c$102$1_0$124	= .
	.globl	C$Clean_Up_Crew.c$102$1_0$124
;src/Clean_Up_Crew.c:102: }
	C$Clean_Up_Crew.c$102$1_0$124	= .
	.globl	C$Clean_Up_Crew.c$102$1_0$124
	XG$game_loop$0$0	= .
	.globl	XG$game_loop$0$0
	jr	00102$
	G$update$0$0	= .
	.globl	G$update$0$0
	C$Clean_Up_Crew.c$110$1_0$127	= .
	.globl	C$Clean_Up_Crew.c$110$1_0$127
;src/Clean_Up_Crew.c:110: void update()
;	---------------------------------
; Function update
; ---------------------------------
_update::
	C$Clean_Up_Crew.c$113$1_0$127	= .
	.globl	C$Clean_Up_Crew.c$113$1_0$127
;src/Clean_Up_Crew.c:113: }
	C$Clean_Up_Crew.c$113$1_0$127	= .
	.globl	C$Clean_Up_Crew.c$113$1_0$127
	XG$update$0$0	= .
	.globl	XG$update$0$0
	ret
	G$input$0$0	= .
	.globl	G$input$0$0
	C$Clean_Up_Crew.c$121$1_0$129	= .
	.globl	C$Clean_Up_Crew.c$121$1_0$129
;src/Clean_Up_Crew.c:121: void input()
;	---------------------------------
; Function input
; ---------------------------------
_input::
	C$Clean_Up_Crew.c$124$1_0$129	= .
	.globl	C$Clean_Up_Crew.c$124$1_0$129
;src/Clean_Up_Crew.c:124: }
	C$Clean_Up_Crew.c$124$1_0$129	= .
	.globl	C$Clean_Up_Crew.c$124$1_0$129
	XG$input$0$0	= .
	.globl	XG$input$0$0
	ret
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
