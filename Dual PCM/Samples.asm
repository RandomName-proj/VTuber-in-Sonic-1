; ===========================================================================
; ---------------------------------------------------------------------------
; Sample 68k PCM list
; ---------------------------------------------------------------------------

SampleList:

	; --- Sonic 1 Samples ---

		dc.l	Sonic1Kick			; 00
		dc.l	Sonic1Snare			; 01
		dc.l	Sonic1Timpani		; 02
		dc.l	SonimeDies			; 03
		dc.l	SonimeFrustrated	; 04
		dc.l	SonimeHappy			; 05
		dc.l	SonimeHappy2		; 06
		dc.l	SonimeHurt			; 07
		dc.l	SonimeImpatient		; 08
		dc.l	SonimeInvincibility	; 09
		dc.l	SonimeSpikey	; 0A
		dc.l	SonimeSpeed	; 0B
		dc.l	SonimeBossDefeated	; 0C
		dc.l	SonimeGameOver	; 0D
		dc.l	SonimeSurprised	; 0E	
		dc.l	SonimeBigRing	; 0F		
		dc.l	SonimeBoing	; 10	
		dc.l	SonimeNoConfidence ; 11
		dc.l	SonimeActClear ; 12		
; ---------------------------------------------------------------------------
; Sample z80 pointers
; ---------------------------------------------------------------------------
Sec	=	14000	; Hz per second
Mil	=	1000	; centi-seconds per second

	; --- Stop Sample (used by note 80) ---

StopSample:				dcz80	SWF_StopSample,		SWF_StopSample_Rev,		SWF_StopSample,		SWF_StopSample_Rev

	; --- Sonic 1 Samples ---

Sonic1Kick:				dcz80	SWF_S1_Kick,		SWF_S1_Kick_Rev,		SWF_StopSample,		SWF_StopSample_Rev
Sonic1Snare:			dcz80	SWF_S1_Snare,		SWF_S1_Snare_Rev,		SWF_StopSample,		SWF_StopSample_Rev
Sonic1Timpani:			dcz80	SWF_S1_Timpani,		SWF_S1_Timpani,			SWF_StopSample,		SWF_StopSample_Rev
SonimeDies:				dcz80	SWF_Dies,			SWF_Dies_Rev,			SWF_StopSample,		SWF_StopSample_Rev
SonimeFrustrated:		dcz80	SWF_Frustrated,		SWF_Frustrated_Rev,		SWF_StopSample,		SWF_StopSample_Rev
SonimeHappy:			dcz80	SWF_Happy,			SWF_Happy_Rev,			SWF_StopSample,		SWF_StopSample_Rev
SonimeHappy2:			dcz80	SWF_Happy2,			SWF_Happy2_Rev,			SWF_StopSample,		SWF_StopSample_Rev
SonimeHurt:				dcz80	SWF_Hurt,			SWF_Hurt_Rev,			SWF_StopSample,		SWF_StopSample_Rev
SonimeImpatient:		dcz80	SWF_Impatient,		SWF_Impatient_Rev,		SWF_StopSample,		SWF_StopSample_Rev
SonimeInvincibility:	dcz80	SWF_Invincibility,	SWF_Invincibility_Rev,	SWF_StopSample,		SWF_StopSample_Rev
SonimeSpikey:	dcz80	SWF_Spikey,	SWF_Spikey_Rev,	SWF_StopSample,		SWF_StopSample_Rev
SonimeSpeed:		dcz80	SWF_Speed,		SWF_Speed_Rev,		SWF_StopSample,		SWF_StopSample_Rev
SonimeBossDefeated:		dcz80	SWF_BossDefeated,		SWF_BossDefeated_Rev,		SWF_StopSample,		SWF_StopSample_Rev
SonimeGameOver:		dcz80	SWF_GameOver,		SWF_GameOver_Rev,		SWF_StopSample,		SWF_StopSample_Rev
SonimeSurprised:		dcz80	SWF_Surprised,		SWF_Surprised_Rev,		SWF_StopSample,		SWF_StopSample_Rev
SonimeBigRing:		dcz80	SWF_BigRing,		SWF_BigRing_Rev,		SWF_StopSample,		SWF_StopSample_Rev
SonimeBoing:		dcz80	SWF_Boing,		SWF_Boing_Rev,		SWF_StopSample,		SWF_StopSample_Rev
SonimeNoConfidence:		dcz80	SWF_NoConfidence,		SWF_NoConfidence_Rev,		SWF_StopSample,		SWF_StopSample_Rev
SonimeActClear:		dcz80	SWF_ActClear,		SWF_ActClear_Rev,		SWF_StopSample,		SWF_StopSample_Rev
; ---------------------------------------------------------------------------
; Sample file includes
; ---------------------------------------------------------------------------
			align	$8000,$FF
; ---------------------------------------------------------------------------

	; --- Volume tables ---

PCM_Volumes:		incbin	"Dual PCM\Volume Maker\Volumes.bin"

	; --- Stop Sample (used by note 80) ---

			EndMarker
SWF_StopSample:		dcb.b	$8000-((Z80E_Read*(($1000+$100)/$100))*2),$80
SWF_StopSample_Rev:	EndMarker

	; --- Sonic 1 Samples ---

SWF_S1_Kick:		incbin	"Dual PCM\Samples\incswf\Sonic 1 Kick.swf"
SWF_S1_Kick_Rev:	EndMarker
SWF_S1_Snare:		incbin	"Dual PCM\Samples\incswf\Sonic 1 Snare.swf"
SWF_S1_Snare_Rev:	EndMarker
SWF_S1_Timpani:		incbin	"Dual PCM\Samples\incswf\Sonic 1 Timpani.swf"
SWF_S1_Timpani_Rev:	EndMarker
SWF_Dies:			incbin	"Dual PCM\Samples\incswf\dies.swf"
SWF_Dies_Rev:		EndMarker
SWF_Frustrated:		incbin	"Dual PCM\Samples\incswf\frustrated.swf"
SWF_Frustrated_Rev:	EndMarker
SWF_Happy:			incbin	"Dual PCM\Samples\incswf\happy.swf"
SWF_Happy_Rev:		EndMarker
SWF_Happy2:			incbin	"Dual PCM\Samples\incswf\happy 2.swf"
SWF_Happy2_Rev:		EndMarker
SWF_Hurt:			incbin	"Dual PCM\Samples\incswf\hurt.swf"
SWF_Hurt_Rev:		EndMarker
SWF_Impatient:		incbin	"Dual PCM\Samples\incswf\impatient.swf"
SWF_Impatient_Rev:	EndMarker
SWF_Invincibility:	incbin	"Dual PCM\Samples\incswf\invincibility.swf"
SWF_Invincibility_Rev:	EndMarker
SWF_Spikey:	incbin	"Dual PCM\Samples\incswf\spikey.swf"
SWF_Spikey_Rev:	EndMarker
SWF_Speed:	incbin	"Dual PCM\Samples\incswf\goingatsupersonicspeed.swf"
SWF_Speed_Rev:	EndMarker
SWF_BossDefeated:	incbin	"Dual PCM\Samples\incswf\bossdefeated.swf"
SWF_BossDefeated_Rev:	EndMarker
SWF_gameover:	incbin	"Dual PCM\Samples\incswf\gameover.swf"
SWF_gameover_Rev:	EndMarker
SWF_Surprised:	incbin	"Dual PCM\Samples\incswf\surprised.swf"
SWF_Surprised_Rev:	EndMarker
SWF_BigRing:	incbin	"Dual PCM\Samples\incswf\bigring.swf"
SWF_BigRing_Rev:	EndMarker
SWF_Boing:	incbin	"Dual PCM\Samples\incswf\Boing.swf"
SWF_Boing_Rev:	EndMarker
SWF_NoConfidence:	incbin	"Dual PCM\Samples\incswf\noconfidence.swf"
SWF_NoConfidence_Rev:	EndMarker
SWF_ActClear:	incbin	"Dual PCM\Samples\incswf\actclear.swf"
SWF_ActClear_Rev:	EndMarker
; ===========================================================================