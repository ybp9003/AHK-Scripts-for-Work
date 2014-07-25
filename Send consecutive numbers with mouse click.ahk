#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%

LineNumber = 1
SplashTextOn,200,90, Begin, Press RCONTROL to begin
WinMove, Begin, , 5, 5 ;move splash window to the top left corner
	KeyWait, RControl, D
		Sleep 250
SplashTextOff
SplashTextOn,200,90, Waiting, Click to place a numeral on the Fleet Card Statement. "ScrollLock" exits the script.
WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
Loop
	{
	KeyWait, LButton, D
		Sleep 250
	Send %LineNumber%
	LineNumber += 1
	}
SplashTextOff

; beginning:
; WinWaitActive AM Interface
; INPUT = TOOL1596|{Tab}|367|{Tab}|1|{Enter}
; Loop,Parse,INPUT, |
	; {
	; Send % A_LoopField
	; Sleep 500
	; }
; Gosub beginning
;=========================================================================================
; Loop, read, C:\Users\jherring\Desktop\CSV Export.csv
; {
    ; LineNumber = %A_Index%
    ; Loop, parse, A_LoopReadLine, CSV
    ; {
		; WinActivate AHK_class SunAwtFrame
			; {
			; WinWaitActive AHK_class SunAwtFrame
			; }
		; Clipboard = 
		; Click 514,91,2 ;double click in the Item Number field
			; Sleep 1000
		; Send %A_LoopField%`n
			; Sleep 1000
		; Click 720,517 ;click Aisle/Bin on X01
		; Send ^a
		; Send ^x
			; ClipWait, 1
		; StringUpper Clipboard, Clipboard
; If Clipboard = 
	; Clipboard = PENDING
		; Click 279,549 ;click the box for Y01
		; Click 600,550 ;click Aisle/Bin on Y01
		; Send ^v
			; Sleep 250
		; Clipboard =
;=========================================================================================
		; Click 880,517 ;click Minimum Qty on X01
		; Send ^a
		; Send ^x
			; ClipWait, 1
; If Clipboard =
	; Clipboard = 0
		; Click 880,550
		; Send ^a
		; Send ^v
			; Sleep 250
		; Clipboard = 
;=========================================================================================
; MaxQTY:
		; Click 1000,517 ;click Maximum Qty
		; Send ^a
		; Send ^x
			; ClipWait, 1
; If Clipboard =
	; Clipboard = 0
		; Click 1000,550
		; Send ^a
		; Send ^v
			; Sleep 250
		; Clipboard = 
;=========================================================================================
; MSGBX:
		; MsgBox, 4, , Line number %LineNumber%`n%A_LoopField%?`n`nEverything look ok?
        ; IfMsgBox, No
			; Return
		; Click 260,988 ;click Save
			; Sleep 2000
	; }
; }
; MsgBox Done!
ExitApp

ScrollLock::ExitApp
