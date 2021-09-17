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

; ===========================================================================