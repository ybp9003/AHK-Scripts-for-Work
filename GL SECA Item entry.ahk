#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2 ;matches partial window titles
GL = 6311.723
MsgBox, There have been some problems using this script.`nMake sure the GL is entered correctly.
{
WinWaitActive GL Accounting
}
		SendEvent 2{Tab}
		Sleep 250
		Send %GL%{Tab}
		Sleep 250
		MouseClick,Left,334,112
		SendEvent 1{Tab}
		Sleep 250
		Send .5{Tab}
		Sleep 250
		Send {Tab}
		Sleep 250
		MouseClick,Left,793,410

ExitApp

Scrolllock::ExitApp