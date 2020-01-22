; main code get from http://hype.retroscene.org/blog/dev/477.html

    DEVICE 	ZXSPECTRUM128

SCREEN_PTR equ #4000
SCREEN_SIZE equ 6144 ; in bytes
SCREEN_WIDTH equ 256
SCREEN_HEIGHT equ 192

ATTR_PTR equ #5800
ATTR_SIZE equ 768
ATTR_WIDTH equ 32
ATTR_HEIGHT equ 24

	ORG	#8000
START:
        LD HL, music: CALL MusicPlayer.INIT
        EI

LOOP0
        HALT
        CALL MusicPlayer.PLAY
        LD A, R
        OUT ($FE), A
		JP	LOOP0

    MODULE MusicPlayer
    include "routines/PTxPlay.a80"
    ENDMOD

music:
    incbin "music.pt3"

		SAVESNA "out/main.sna",START

