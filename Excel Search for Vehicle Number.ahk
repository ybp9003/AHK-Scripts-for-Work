#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;NOTE: Each month you will have to change the movement of Mileage and Inspection in order to keep everything flowing properly
;CURRENT SCRIPT WILL ADD THE HOURS, QUARTS OF OIL AND MILES AT LAST OILCHANGE


Gui, Add, Text, x12 y20 w100 h30 , Vehicle Number
Gui, Add, Text, x12 y60 w100 h30 , Odometer
Gui, Add, Text, x12 y100 w100 h30 , Fuel
Gui, Add, Text, x12 y140 w100 h30 , Hours
Gui, Add, Text, x12 y180 w100 h30 , Oil
Gui, Add, Text, x12 y220 w100 h30 , Odometer at last oil change
Gui, Add, Text, x12 y260 w100 h30 , Inspection $$$
Gui, Add, Edit, x122 y20 w100 h30 vVehNum ,
Gui, Add, Combobox, x250 y20 vMonth, JANUARY|FEBRUARY|MARCH|APRIL|MAY||JUNE|JULY|AUGUST|SEPTEMBER|OCTOBER|NOVEMBER|DECEMBER
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
	ExitApp
	}
WinActivate ahk_class XLMAIN
Send ^f
	{
	WinWaitActive Find and Replace
	Send {Raw}#%vehNum%`n
	Sleep 300
	}
WinClose Find and Replace
Gosub % Month

;===========================================================================================================================
APRIL:
Steps = {Right 3}|{Down 3}|%Odometer%`n|{Up}|{Right 3}|{Raw}%Fuel%`n|{Right}|{Up}|{Raw}%Hours%`n|{Left 2}|{Up}|%Oil%`n|{Left 4}|{Down 2}|%OilChangeMiles%`n|{Up}|
Loop, Parse, Steps, |
	{
	Send % A_LoopField
	Sleep 1000
	}
Gosub GuiClose

;===========================================================================================================================
MAY:
Steps = {Right 3}|{Down 4}|%Odometer%`n|{Up}|{Right}|%Oil%`n|{Up}|{Right}|{Raw}%Fuel%`n|{Up}|{Right}|{Raw}%Hours%`n|{Left 5}|{Down 1}|%OilChangeMiles%`n
{
Loop, Parse, Steps, |
	{
	Send % A_LoopField
	Sleep 10
	}
If Inspection = 1
	Gosub UpdateInspection
Gosub GuiClose
}

;===========================================================================================================================
;===========================================================================================================================
GuiClose:
ExitApp

UpdateInspection:
Inspection := A_YYYY + 1
InspectionSteps = {Up 4}|{Left}|{F2}|{End}|{BackSpace 2}|%Inspection%`n
Loop, Parse, InspectionSteps, |
	{
	Send % A_LoopField
		Sleep 10
	}
Gosub GuiClose




Esc::ExitApp
