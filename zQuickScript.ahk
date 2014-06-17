#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%

^+0::
; ControlGetFocus, OutputVar [, WinTitle, WinText, ExcludeTitle, ExcludeText]
ControlGetFocus, OutputVar, AHK_class ENMainFrame
if ErrorLevel
    MsgBox, The target window doesn't exist or none of its controls has input focus.
else
    MsgBox, Control with focus = %OutputVar%
Return

^0::
;ControlClick, Control-or-Pos, WinTitle, WinText, WhichButton, ClickCount, Options, ExcludeTitle, ExcludeText
;SendMessage, Msg [, wParam, lParam, Control, WinTitle, WinText, ExcludeTitle, ExcludeText, Timeout]Return
PostMessage, 0x0201,,,ENTagEditorCtrl2, AHK_class ENMainFrame
PostMessage, 0x0202,,,ENTagEditorCtrl2, AHK_class ENMainFrame
Return

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
; ExitApp

Esc::ExitApp
