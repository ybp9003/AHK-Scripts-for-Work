#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Clipboard = 
Send ^c
ClipWait, 2
If Clipboard Is Not Number
	{
	MsgBox Oh Snap!`n`nThere must have been something other than numbers you just clipped.`nApp will now Exit.
	ExitApp
	}
a := Clipboard
b = 1.4
c := (a*b)
d := Round(c, 2) ;limits the result to two decimals
MsgBox,4,, 40 percent markup is $%d%`n`nSend this as an output?`nIf, YES, your next click will send the result.
	IfMsgBox No
		ExitApp
KeyWait, LButton, D
	Sleep 250
Send % "$"d
ExitApp

Scrolllock::ExitApp