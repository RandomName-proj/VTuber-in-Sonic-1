; ---------------------------------------------------------------------------
; Align and pad
; input: length to align to, value to use as padding (default is 0)
; ---------------------------------------------------------------------------


; ---------------------------------------------------------------------------
; Set a VRAM address via the VDP control port.
; input: 16-bit VRAM address, control port (default is ($C00004).l)
; ---------------------------------------------------------------------------

locVRAM:	macro loc,controlport
		if (narg=1)
		move.l	#($40000000+((loc&$3FFF)<<16)+((loc&$C000)>>14)),($C00004).l
		else
		move.l	#($40000000+((loc&$3FFF)<<16)+((loc&$C000)>>14)),controlport
		endc
		endm

torsoart = $7A0 ($C tiles)
headart = $7AC ($14 tiles)
hairart = $798 (8 tiles)
ringart = $6BA ($E tiles)
pointsart = $568 (9 tiles)
lamppostart = $571 ($A tiles)

ssringart = $22D ($E tiles)

SonimeSST = $FFFFF5C0
v_ssangleprev = $FFFFFFF9
FromSEGA = $FFFFF601

sonime_headtimer = 0
sonime_headx = 2
sonime_heady = 3
sonime_routine = 4
sonime_routine2 = 5
sonime_headx2 = 6
sonime_headx3 = 7
sonime_hairx = 9
sonime_heady2 = $A
sonime_heady3 = $B
sonime_hairy = $D
sonime_face = $E
sonime_faceold = $F
sonime_facetimer = $10
sonime_ear = $12
sonime_earold = $13
sonime_eartimer = $14
sonime_torsox = $16
sonime_movein = $17
sonime_waittimer = $18
sonime_waittimer2 = $19
sonime_pausetimer = $20
sonime_airtimer = $22

face_neutrall = 0
face_blink = 1
face_neutrallm = 2
face_neutralm = 3
face_neutralr = 4
face_frustrated = 5
face_surprised = 6
face_happy = 7
face_confused = 8
face_meltdown = 9
face_panic = $A
face_impatient = $B

; ===========================================================================
; ---------------------------------------------------------------------------
; Macros
; ---------------------------------------------------------------------------

	; --- Alignment ---

align		macro	Size,Value
		dcb.b	Size-(*%Size),Value
		endm

	; --- Stop Z80 ---

StopZ80		macro
		move.w	#$0100,($A11100).l			; request Z80 stop (ON)
		btst.b	#$00,($A11100).l			; has the Z80 stopped yet?
		bne.s	*-$08					; if not, branch
		endm

	; --- Start Z80 ---

StartZ80	macro
		move.w	#$0000,($A11100).l			; request Z80 stop (OFF)
		endm

ResetZ80	macro
		move.w	#$0000,($A11200).l			; request Z80 reset (ON)
		endm

NeglectZ80	macro
		move.w	#$0100,($A11200).l			; request Z80 reset (OFF)
		endm

	; --- DMA to (a6) containing C00004 ---

DMA:		macro	Size, Source, Destination
		move.l	#(((((Size/$02)<<$08)&$FF0000)+((Size/$02)&$FF))+$94009300),(a6)
		move.l	#((((((Source&$FFFFFF)/$02)<<$08)&$FF0000)+(((Source&$FFFFFF)/$02)&$FF))+$96009500),(a6)
		move.l	#(((((Source&$FFFFFF)/$02)&$7F0000)+$97000000)+((Destination>>$10)&$FFFF)),(a6)
		move.w	#((Destination&$FF7F)|$80),(a6)
		endm

	; --- Storing 68k address for Z80 as dc ---

dcz80		macro	Sample, SampleRev, SampleLoop, SampleLoopRev
		dc.b	((Sample)&$FF)
		dc.b	((((Sample)>>$08)&$7F)|$80)
		dc.b	(((Sample)&$7F8000)>>$0F)
		dc.b	(((SampleRev)-1)&$FF)
		dc.b	(((((SampleRev)-1)>>$08)&$7F)|$80)
		dc.b	((((SampleRev)-1)&$7F8000)>>$0F)
		dc.b	((SampleLoop)&$FF)
		dc.b	((((SampleLoop)>>$08)&$7F)|$80)
		dc.b	(((SampleLoop)&$7F8000)>>$0F)
		dc.b	(((SampleLoopRev)-1)&$FF)
		dc.b	(((((SampleLoopRev)-1)>>$08)&$7F)|$80)
		dc.b	((((SampleLoopRev)-1)&$7F8000)>>$0F)
		endm

	; --- End marker for PCM samples ---

EndMarker	macro
		dcb.b	Z80E_Read*(($1000+$100)/$100),$00
		endm

; ===========================================================================

PlayPCM2	macro	Sample
		move.l	a0,-(sp)
		move.l	a1,-(sp)
		lea (Sample).l,a0 ; load sample pointers
		lea ($A00C75).l,a1 ; load PCM2 pointers
		move.w #$0100,($A11100).l ; request Z80 stop (ON)
		btst.b #$00,($A11100).l ; has the Z80 stopped yet?
		bne.s *-$08 ; if not, branch
		move.b #0,($A00647).l ; set volume
		move.b (a0)+,(a1)+ ; set address of sample
		move.b (a0)+,(a1)+ ; ''
		move.b (a0)+,(a1)+ ; ''
		move.b (a0)+,(a1)+ ; set address of reverse sample
		move.b (a0)+,(a1)+ ; ''
		move.b (a0)+,(a1)+ ; ''
		move.b (a0)+,(a1)+ ; set address of loop sample
		move.b (a0)+,(a1)+ ; ''
		move.b (a0)+,(a1)+ ; ''
		move.b (a0)+,(a1)+ ; set address of loop reverse sample
		move.b (a0)+,(a1)+ ; ''
		move.b (a0)+,(a1)+ ; ''
		move.b #%11011010,($A00651).l ; set request
		move.w #$0000,($A11100).l ; request Z80 stop (OFF)
		move.l	(sp)+,a1
		move.l	(sp)+,a0
		endm

