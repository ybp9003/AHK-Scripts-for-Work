;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Beginning:
SplashTextOn,200,100,Help, Place the mouse on the cell/row that needs to be painted then press RControl`n`nPress ESC to exit.
WinMove, Help, , 10,1586 ;move splash window to the top left corner
KeyWait, RControl, D
	{
	Sleep 250
	MouseGetPos, Xpaint, Ypaint
	SplashTextOff
	}

SplashTextOn,200,90,Help, Place the mouse on the cell/row that has the desired format then press RControl again
WinMove, Help, , 10,1586 ;move splash window to the top left corner
KeyWait, RControl, D
	{
	SplashTextOff
	MouseClickDrag, L,,, 711, 0, 10, R
	}
Click 156, 179
Click %Xpaint%, %Ypaint%
Gosub Beginning

ScrollLock::ExitApp
