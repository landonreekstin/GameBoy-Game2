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
	.globl _move_player
	.globl _create_player_old
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
	C$Clean_Up_Crew.c$63$0_0$129	= .
	.globl	C$Clean_Up_Crew.c$63$0_0$129
;src/Clean_Up_Crew.c:63: int main(int argc, char *argv[]) 
;	---------------------------------
; Function main
; ---------------------------------
_main::
	C$Clean_Up_Crew.c$66$1_0$129	= .
	.globl	C$Clean_Up_Crew.c$66$1_0$129
;src/Clean_Up_Crew.c:66: init_game();
	call	_init_game
	C$Clean_Up_Crew.c$69$1_0$129	= .
	.globl	C$Clean_Up_Crew.c$69$1_0$129
;src/Clean_Up_Crew.c:69: game_loop();
	call	_game_loop
	C$Clean_Up_Crew.c$71$1_0$129	= .
	.globl	C$Clean_Up_Crew.c$71$1_0$129
;src/Clean_Up_Crew.c:71: return 0;
	ld	de, #0x0000
	C$Clean_Up_Crew.c$72$1_0$129	= .
	.globl	C$Clean_Up_Crew.c$72$1_0$129
;src/Clean_Up_Crew.c:72: }
	C$Clean_Up_Crew.c$72$1_0$129	= .
	.globl	C$Clean_Up_Crew.c$72$1_0$129
	XG$main$0$0	= .
	.globl	XG$main$0$0
	ret
	G$init_game$0$0	= .
	.globl	G$init_game$0$0
	C$Clean_Up_Crew.c$80$1_0$130	= .
	.globl	C$Clean_Up_Crew.c$80$1_0$130
;src/Clean_Up_Crew.c:80: void init_game()
;	---------------------------------
; Function init_game
; ---------------------------------
_init_game::
	C$Clean_Up_Crew.c$89$1_0$130	= .
	.globl	C$Clean_Up_Crew.c$89$1_0$130
;src/Clean_Up_Crew.c:89: create_player_old();
	C$Clean_Up_Crew.c$92$1_0$130	= .
	.globl	C$Clean_Up_Crew.c$92$1_0$130
;src/Clean_Up_Crew.c:92: }
	C$Clean_Up_Crew.c$92$1_0$130	= .
	.globl	C$Clean_Up_Crew.c$92$1_0$130
	XG$init_game$0$0	= .
	.globl	XG$init_game$0$0
	jp	_create_player_old
	G$game_loop$0$0	= .
	.globl	G$game_loop$0$0
	C$Clean_Up_Crew.c$100$1_0$131	= .
	.globl	C$Clean_Up_Crew.c$100$1_0$131
;src/Clean_Up_Crew.c:100: void game_loop()
;	---------------------------------
; Function game_loop
; ---------------------------------
_game_loop::
	C$Clean_Up_Crew.c$102$1_0$131	= .
	.globl	C$Clean_Up_Crew.c$102$1_0$131
;src/Clean_Up_Crew.c:102: while(1)
00102$:
	C$Clean_Up_Crew.c$109$2_0$132	= .
	.globl	C$Clean_Up_Crew.c$109$2_0$132
;src/Clean_Up_Crew.c:109: input();
	call	_input
	C$Clean_Up_Crew.c$111$1_0$131	= .
	.globl	C$Clean_Up_Crew.c$111$1_0$131
;src/Clean_Up_Crew.c:111: }
	C$Clean_Up_Crew.c$111$1_0$131	= .
	.globl	C$Clean_Up_Crew.c$111$1_0$131
	XG$game_loop$0$0	= .
	.globl	XG$game_loop$0$0
	jr	00102$
	G$update$0$0	= .
	.globl	G$update$0$0
	C$Clean_Up_Crew.c$119$1_0$134	= .
	.globl	C$Clean_Up_Crew.c$119$1_0$134
;src/Clean_Up_Crew.c:119: void update()
;	---------------------------------
; Function update
; ---------------------------------
_update::
	C$Clean_Up_Crew.c$122$1_0$134	= .
	.globl	C$Clean_Up_Crew.c$122$1_0$134
;src/Clean_Up_Crew.c:122: }
	C$Clean_Up_Crew.c$122$1_0$134	= .
	.globl	C$Clean_Up_Crew.c$122$1_0$134
	XG$update$0$0	= .
	.globl	XG$update$0$0
	ret
	G$input$0$0	= .
	.globl	G$input$0$0
	C$Clean_Up_Crew.c$130$1_0$135	= .
	.globl	C$Clean_Up_Crew.c$130$1_0$135
;src/Clean_Up_Crew.c:130: void input()
;	---------------------------------
; Function input
; ---------------------------------
_input::
	C$Clean_Up_Crew.c$133$1_0$135	= .
	.globl	C$Clean_Up_Crew.c$133$1_0$135
;src/Clean_Up_Crew.c:133: move_player();
	C$Clean_Up_Crew.c$134$1_0$135	= .
	.globl	C$Clean_Up_Crew.c$134$1_0$135
;src/Clean_Up_Crew.c:134: }
	C$Clean_Up_Crew.c$134$1_0$135	= .
	.globl	C$Clean_Up_Crew.c$134$1_0$135
	XG$input$0$0	= .
	.globl	XG$input$0$0
	jp	_move_player
	.area _CODE
	.area _INITIALIZER
	.area _CABS (ABS)
