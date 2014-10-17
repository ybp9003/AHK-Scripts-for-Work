;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#Include E:\AHK Scripts for Work\Functions\SplashText.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%

LineNumber = 1
SplashTextOn,200,40, Begin, Press RCONTROL to begin
WinMove, Begin, , 5, 5 ;move splash window to the top left corner
	KeyWait, RControl, D
		Sleep 250

SplashTextFunc(5,5,200,90,"Waiting","Click to place a numeral on the Fleet Card Statement. 'ScrollLock' exits the script.")
Loop
	{
	KeyWait, LButton, D
		Sleep 250
	Send %LineNumber%
	LineNumber += 1
	}
SplashTextOff

ExitApp

ScrollLock::ExitApp
