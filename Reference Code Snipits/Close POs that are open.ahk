;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%

/*
THIS SCRIPT WILL CLOSE AN OPEN PO (OR OPEN ONE THAT IS CLOSED IF YOU'RE NOT WATCHING)
TO USE:
1.	IN THE PURCHASE ORDER SCREEN, SEARCH FOR ALL OPEN PUCHASE ORDERS (CLOSE POs THAT ARE FULLY RECEIVED CREDIT CARD PURCHASES)
2.	RUN THIS SCRIPT
3.	PLACE THE MOUSE CURSOR OVER THE PO NEEDING TO BE CLOSED
4.	PRESS RCONTROL KEY
5.	REPEAT
NOTES: THE ABS WINDOW SHOULD MATCH THIS RESOLUTION FOR THIS TO WORK (width: 1465 height: 972)
*/
Begin:
KeyWait, RControl, D
	Sleep 250
IfWinNotActive AHK_class SunAwtFrame
	{
	WinActivate
		Sleep 250
	}
MouseGetPos, xPos, yPos
Click
Click 892,481
Click 892,520
Send !s
MouseMove, %xPos%, %yPos%
Gosub Begin

ExitApp
ScrollLock::ExitApp
