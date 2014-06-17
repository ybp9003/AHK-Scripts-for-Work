#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

InputBox, GL, Enter the GL to be used,,,,,,,,,%Clipboard%
WinActivate AHK_class SunAwtDialog
	{
	WinWaitActive ahk_class SunAwtDialog
	}
		Send 2{Tab}
		Sleep 250
		Send %GL%
		MouseClick,Left,369,110 ;clicks GL Department field
		Send 2{Tab}
		Sleep 250
		Send MATERIALS{Tab}
		Sleep 250
		Send {Enter}
ExitApp

Esc::ExitApp