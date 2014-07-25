#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

InputBox, Vendor, Vendor Number, Input Vendor Number,,,,,,,, 8406

WinActivate AHK_class SunAwtDialog
WinWaitActive AHK_class SunAwtDialog

Send %Vendor%{Enter}
	Sleep 500
Steps = {Tab}|{Enter}
Loop,Parse,Steps, |
	{
	Send % A_LoopField
	Sleep 100
	}
Click 632,455
ExitApp

Scrolllock::exitapp
