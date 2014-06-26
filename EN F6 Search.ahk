#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\

; SetTitleMatchMode 2
Clipboard = 
Send, ^c
ClipWait, 2
if ErrorLevel
	{
    MsgBox, The attempt to copy text onto the clipboard failed.`n`nScript will exit.
    ExitApp
	}

NumberofAttempts = 1
; Repeat:
IfWinExist C:\Windows\system32\CMD.exe
	WinActivate C:\Windows\system32\CMD.exe
Else
	Run, CMD.exe, , Min
WinWaitActive C:\Windows\system32\CMD.exe ;,,2
; If ErrorLevel
	; {
	; If NumberofAttempts = 4
		; {
		; MsgBox, Four attempts to open the "DOS Window" has failed. Press OK to exit app.
		; ExitApp
		; }
	; NumberofAttempts += 1
	; Gosub Repeat
	; }
; Else
	Send ENScript showNotes`n
		Sleep 750
	Send {Raw}`"%Clipboard%`"`n
		; Sleep 750
	; WinClose AHK_class ConsoleWindowClass
	WinMinimize C:\Windows\system32\CMD.exe
	

;===============================================================================
;ENABLE THIS SECTION IF YOU WANT TO SEARCH EN AND NISC AT THE SAME TIME
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