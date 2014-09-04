;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;NOTE: Each month you will have to change the movement of Mileage and Inspection in order to keep everything flowing properly
;CURRENT SCRIPT WILL ADD THE HOURS, QUARTS OF OIL AND MILES AT LAST OILCHANGE

MsgBox THE CHROME WINDOW SHOULD BE ON THE LANDSCAPE, (LEFT MOST) MONITOR AND MAXIMIZED

Gui, Add, Text, x12 y20 w100 h30 , Vehicle Number
Gui, Add, Text, x12 y60 w100 h30 , Odometer
Gui, Add, Text, x12 y100 w100 h30 , Fuel
Gui, Add, Text, x12 y140 w100 h30 , Hours
Gui, Add, Text, x12 y180 w100 h30 , Oil
Gui, Add, Text, x12 y220 w100 h30 , Odometer at last oil change
Gui, Add, Text, x12 y260 w100 h30 , Inspection $$$
Gui, Add, Edit, x122 y20 w100 h30 vVehNum ,
Gui, Add, Combobox, x250 y20 vMonth, JANUARY|FEBRUARY|MARCH|APRIL|MAY|JUNE|JULY||AUGUST|SEPTEMBER|OCTOBER|NOVEMBER|DECEMBER
Gui, Add, Edit, x122 y60 w100 h30 vOdometer , {Del}
Gui, Add, Edit, x122 y100 w570 h30 vFuel , =
Gui, Add, Edit, x122 y140 w100 h30 vHours , =
Gui, Add, Edit, x122 y180 w100 h30 vOil , 
Gui, Add, Edit, x122 y220 w100 h30 vOilChangeMiles , 
Gui, Add, Checkbox, x122 y260 vInspection , Inspection
Gui, Add, Button, x120 y290 w100 h30 gReadySetGo , Run it!
; Generated using SmartGUI Creator 4.0
Gui, Show, x38 y800 , Gathering Data
Return


ReadySetGo:
Gui, Submit

If (VehNum = "")
	{
	MsgBox, ERROR!`nA vehicle number must be entered!
	Gui, Show
	Exit
	}
WinActivate HCTC Vehicle Report - Google Sheets - Google Chrome
Send ^f
Send {Raw}#%vehNum%
SplashTextOn,200,90, Waiting, Press RCONTROL once Google has located the correct vehicle
	WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
		Sleep 1500
	Click, 1619,214
	KeyWait, RControl, D
		Sleep 250
	SplashTextOff
	Sleep 1000
MsgBox Heading to %Month%
Gosub %Month%

;===========================================================================================================================
APRIL:
MsgBox April?
Steps = {Right}|{Right}|{Right}|{Down}|{Down}|{Down}|%Odometer%|{Right}|{Right}|{Right}|{Raw}%Fuel%|{Right}|{Raw}%Hours%|{Left}|{Left}|%Oil%|{Left}|{Left}|{Left}|{Down}|{Down}|{Down}|%OilChangeMiles%|{Up}|{Up}|{Up}|{Up}|{Up}|{Up}|{Left}
Loop, Parse, Steps, |
	{
	Send % A_LoopField
	If A_LoopField = 
		Continue
	 If A_LoopField := "="
		Continue
	Sleep 500
	}
Gui, Show
Exit

;===========================================================================================================================
MAY:
MsgBox May?
Steps = {Right 3}|{Down 4}|%Odometer%`n|{Up}|{Right}|%Oil%`n|{Up}|{Right}|{Raw}%Fuel%`n|{Up}|{Right}|{Raw}%Hours%`n|{Left 5}|{Down 1}|%OilChangeMiles%`n|{Up 6}|{Left}

Loop, Parse, Steps, |
	{
	Send % A_LoopField
	If A_LoopField In {=}
		Send {Enter}
	Sleep 10
	}
If Inspection = 1
	Gosub UpdateInspection
Gui, Show
Exit

;===========================================================================================================================
JUNE:
; MsgBox June?
Steps = {Right 3}|{Down 5}|%Odometer%`n|{Up}|{Right}|%Oil%`n|{Up}|{Right}|{Raw}%Fuel%`n|{Up}|{Right}|{Raw}%Hours%`n|{Left 5}|%OilChangeMiles%`n|{Up 6}|{Left}

Loop, Parse, Steps, |
	{
	Send % A_LoopField
	Sleep 10
	}
If Inspection = 1
	{
	Gosub UpdateInspection
	MsgBox Inspection equaled 1
	}
Gui, Show
Exit

;===========================================================================================================================
JULY:
MsgBox July?
	IfMsgBox No
	ExitApp

Steps = {Right 3}|{Down 6}|%Odometer%|{Right}|%Oil%|{Right}|{Raw}%Fuel%|{Right}|{Raw}%Hours%|{Left 4}|{Down}|{Left}|%OilChangeMiles%|{Up 6}|{Left}

Loop, Parse, Steps, |
	{
	Send % A_LoopField
	Sleep 10
	}
If Inspection = 1
	{
	Gosub UpdateInspection
	MsgBox Inspection equaled 1
	}
Gui, Show
Exit

;===========================================================================================================================
;===========================================================================================================================

UpdateInspection:
Inspection := A_YYYY + 1
InspectionSteps = {Down 2}|{F2}|{End}|{BackSpace 2}|%Inspection%`n
Loop, Parse, InspectionSteps, |
	{
	Send % A_LoopField
		Sleep 10
	}
ExitApp

GuiClose:
ExitApp

ScrollLock::ExitApp
