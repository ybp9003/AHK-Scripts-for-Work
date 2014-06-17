#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Send {tab}
Sleep 150
Send 6571.
IfWinActive GL Accounting
	{
	MouseClick,Left,537,111
	}
IfWinActive ahk_class SunAwtFrame
	{
	MouseClick,Left,758,368
	}
Sleep 250
Send MATERIALS
Sleep 150
Send {Tab}
Sleep 250
Send 100.
Sleep 250
Send {tab}
Sleep 250
IfWinActive GL Accounting
	{
	ExitApp
	}
IfWinActive ahk_class SunAwtFrame
	{
	Send !s
	ExitApp
	}

Esc::ExitApp