#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\

; SetTitleMatchMode 2
Clipboard = 
Send, ^c
ClipWait, 2
if ErrorLevel
{
    MsgBox, The attempt to copy text onto the clipboard failed.
    return
}
Run CMD.exe
	{
	WinWaitActive ahk_class ConsoleWindowClass
	}
SendRaw ENScript showNotes`n
	Sleep 750
Send {Raw}`"%Clipboard%"`n
	Sleep 500
WinClose AHK_class ConsoleWindowClass

;===============================================================================
;enable this section if you want to search EN and NISC at the same time
	; Sleep 1000
; WinActivate AHK_class SunAwtFrame
; WinWaitActive AHK_class SunAwtFrame
; Send {F11}
	; Sleep 250
; Send {Tab}
	; Sleep 250
; Send ^v
	; Sleep 250
; Send {Enter}


ExitApp

Esc::ExitApp