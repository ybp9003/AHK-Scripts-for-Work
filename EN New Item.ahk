#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinActivate ahk_class ENMainFrame
{
	WinWaitActive ahk_class ENMainFrame
}
Run C:\Users\jherring\Desktop\Evernote Templates\NewItem -.enex
MsgBox, Select the note then press OK to begin the tagging process
	Send ^!t
{
WinWait ahk_class #32770
}
	SendEvent Item{Space}
	Sleep 1000
ExitApp

Esc::ExitApp