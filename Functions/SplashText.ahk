#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;posX & posY DETERMINE WHERE THE WINDOW WILL APPEAR ON THE SCREEN
;sizeX & sizeY DETERMINE HOW BIG THE WINDOW WILL BE
;Title WILL BE THE "TITLE" OF THE WINDOW
;Text WILL BE THE INFORMATION THAT IS DISPLAYED IN THE WINDOW

SplashTextFunc(posX,posY,sizeX,sizeY,Title,Text)
	{
	SplashTextOn,%sizeX%,%sizeY%,%Title%,%Text%
	WinMove,%Title%,,%posX%,%posY%
	Return
	}