﻿;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

NumberofAttempts = 1
StartTagging:
Send ^!t
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		If NumberofAttempts = 4
			MsgBox, Four attempts to open the "Assign Tags" window have failed.`n`nOpen the window manually (CTRL ALT T) then press OK.
		Else
			NumberofAttempts += 1
			Gosub StartTagging
		}
Else
	Sleep 250
Send %A_YYYY%{Space}
	Sleep 1000
Send Invoice{Space}
	Sleep 1000
SendEvent HillCountryElectric{Space}
	Sleep 1000
Send RONumber{Space}{Enter}
WinActivate AHK_class ENMainFrame
	{
	WinWaitActive AHK_class ENMainFrame
	Send !nv
		Sleep 250
	Send 03{Tab}
	}

ExitApp

Scrolllock::ExitApp