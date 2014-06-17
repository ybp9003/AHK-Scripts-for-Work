#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinActivate AHK_class Progman
	Sleep 1000
Run C:\Windows\SysWOW64\javaws.exe http://46575app/apps/46575/lau/lau.jnlp
ExitApp