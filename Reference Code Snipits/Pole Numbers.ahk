#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\

;This script created all of the item numbers for the Pole Numbers 2340PLa-z & 0-9
Begin:
If prev = 
	prev = N/A
InputBox, Digit,, What is the numeral for this Entry?`n`nPrevious entry was %prev%
prev = %Digit%
WinActivate 46575app 46575 - Hill Country Telephone ABS 
WinWaitActive 46575app 46575 - Hill Country Telephone ABS 
WinMaximize 46575app 46575 - Hill Country Telephone ABS
Click 495,90, 2
LoopThis1 = 2340PL%Digit%|{Enter}|{Tab}|POLE LETTERS ALUM, 1.5", %Digit%|{Tab}|P/N UAR15-%Digit%, PREMAX, POLE LETTERS, EMBOSSED ALUMINUM, BOX OF 100
Loop, Parse, LoopThis1, |
	{
	SendInput % A_LoopField
		Sleep 250
	}

MsgBox, 4,,Looks OK?
	IfMsgBox Yes
		{
		Send !s
		Gosub Begin
		}
		
; WinActivate 46575app 46575 - Hill Country Telephone ABS 
; Send !s
	; Sleep 500
; Click 304,150 ;Clicks "Location"
	; Sleep 500
; Click 279,532 ;Clicks "X01" box
	; Sleep 500
; LoopThis2 = {Tab}|03B02,03B03|{Tab}|{F2}|^a|100.|{Tab}|{F2}|^a|1000.|{Tab}
; Loop, Parse, LoopThis2, |
	; {
	; SendInput % A_LoopField
		; Sleep 250
	; }

; MsgBox, 4,,Continue?
	; IfMsgBox No
		; ExitApp
; WinActivate 46575app 46575 - Hill Country Telephone ABS 
; Send !s
	; Sleep 500
; Click 362,150 ;Clicks "PO Info"
	; Sleep 500

; LoopThis3 = {Tab 5}|.3518|!w|{Tab}|6411.003|{Tab}|.5|{Tab}|100.
; Loop, Parse, LoopThis3, |
	; {
	; Send % A_LoopField
		; Sleep 500
	; }
; Click 257,987 ;Clicks "Save"
; MsgBox, 4,,Repeat?
	; IfMsgBox Yes
		; {
		; Click 255,150 ;Clicks "Item"
		; Gosub Begin
		; }
ExitApp

Esc::ExitApp