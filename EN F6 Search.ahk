;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
; SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\
SetWorkingDir C:\Users\jherring\AppData\Local\Apps\Evernote\Evernote\
SetTitleMatchMode 2
	Sleep 500
Clipboard = 
Send, ^c
ClipWait, 2
if ErrorLevel
	{
    MsgBox, The attempt to copy text onto the clipboard failed.`n`nScript will exit.
    ExitApp
	}

IfWinExist C:\Windows\system32\CMD.exe
	{
	WinRestore C:\Windows\system32\CMD.exe
	WinActivate C:\Windows\system32\CMD.exe
	WinWaitActive C:\Windows\system32\CMD.exe
	}
Else
	{
	Run, CMD.exe, C:\Users\jherring\AppData\Local\Apps\Evernote\Evernote\
		Sleep 250
	WinMove, C:\Windows\system32\CMD.exe, , 317, 1535
	}
Send ENScript showNotes`n
	Sleep 750
Send {Raw}`"%Clipboard%`"`n
	; Sleep 750
WinMinimize C:\Windows\system32\CMD.exe

;===============================================================================
;ENABLE THIS SECTION IF YOU WANT TO SEARCH EN AND NISC AT THE SAME TIME

; MouseGetPos, posX, posY
	; Sleep 1000
; WinActivate 46575app 46575 - Hill Country Telephone ABS 
; WinWaitActive 46575app 46575 - Hill Country Telephone ABS
; WinMove, AHK_class SunAwtFrame,, -1677, 567, 1465, 970
	; Sleep 250
; Click,486,89,2
	; Sleep 250
; Send % Clipboard
	; Sleep 350
; Send {Enter}
; WinActivate Google Chrome
; MouseMove, %posX%, %posY%
; WinActivate AHK_class ENMainFrame
;===============================================================================

ExitApp
ScrollLock::ExitApp