﻿#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\

SetTitleMatchMode 2
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
; MouseGetPos, posX, posY
	; Sleep 1000
; WinActivate AHK_class SunAwtFrame
; WinWaitActive AHK_class SunAwtFrame
; WinMove, AHK_class SunAwtFrame,, -1677, 567, 1465, 970
	; Sleep 250
; Click, 486, 89
; Send ^a
	; Sleep 250
; Send % Clipboard
	; Sleep 350
; Send {Enter}
; WinActivate Google Chrome
; MouseMove, %posX%, %posY%
; WinActivate AHK_class ENMainFrame

ExitApp

ScrollLock::ExitApp