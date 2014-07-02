;1.00 The GUI does not work if you want to process a second report
;1.02 Added	"Gui, 1:Show" and a "Return" if MsgBox=Yes to see if that corrects the Error
;1.03 Version 1.02 is untested yet I go and add a GUI under the fuel report subroutine. Let's see if it works!

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox NOTE: BEFORE SELECTION AN OPTION!`nBe sure you have brought the note you are about to process to focus in Evernote.

Gui, Add, Text, x22 y20 w200 h20 , Select the report needed to be processed.
Gui, Add, Text, x52 y50 , Reporting Month
Gui, Add, Combobox, x160 y47 h20 vMonthTag, 01January||02February|03March|04April|05May|06June|07July|08August|09September|10October|11November|12December
Gui, Add, Button, x22 y80 w220 h20 gMVLV1 , Monthly Vehicle Log (Vehicles)
Gui, Add, Button, x22 y110 w220 h20 gMVLE1 , Monthly Vehicle Log (Equipment)
Gui, Add, Button, x22 y140 w220 h20 gETL1 , Equipment Time Logsheet
Gui, Add, Button, x22 y170 w220 h20 gVRO1 , Vehicle RO Log
Gui, Add, Button, x22 y200 w220 h20 gFUEL1 , Fuel Report
; Generated using SmartGUI Creator 4.0
Gui, Show, x75 y770 , Report Selector
Return


MVLV1:
Gui, Submit
	Document = MVLV2
	Gosub AssignProperMonthTag
MVLE1:
Gui, Submit
	Document = MVLE2
	Gosub AssignProperMonthTag
ETL1:
Gui, Submit
	Document = ETL2
	Gosub AssignProperMonthTag
VRO1:
Gui, Submit
	Document = VRO2
	Gosub AssignProperMonthTag
FUEL1:
Gui, Submit
	Document = FUEL2
	Gosub AssignProperMonthTag

AssignProperMonthTag:
If MonthTag = 01January
	{
	Date = 1/31
	Gosub %Document%
	}
If MonthTag = 02February
	{
	Date = 2/28
	Gosub %Document%
	}
If MonthTag = 03March
	{
	Date = 3/31
	Gosub %Document%
	}
If MonthTag = 04April
	{
	Date = 4/30
	Gosub %Document%
	}
If MonthTag = 05May
	{
	Date = 5/31
	Gosub %Document%
	}
If MonthTag = 06June
	{
	Date := "6/30"
	Gosub %Document%
	}
If MonthTag = 07July
	{
	Date = 7/31
	Gosub %Document%
	}
If MonthTag = 08august
	{
	Date = 8/31
	Gosub %Document%
	}
If MonthTag = 09September
	{
	Date = 9/30
	Gosub %Document%
	}
If MonthTag = 10October
	{
	Date = 10/31
	Gosub %Document%
	}
If MonthTag = 11November
	{
	Date = 11/30
	Gosub %Document%
	}
If MonthTag = 12December
	{
	Date = 12/31
	Gosub %Document%
	}

;==========================================================================================================================
MVLV2: ;this is the "Document" tag
MsgBox It went to MONTHLY VEHICLE LOG VEHICLES 2`nMonthTag equals %MonthTag%`nDate equals %DATE%
{
WinActivate AHK_class ENMainFrame
	{
	WinWaitActive AHK_class ENMainFrame
	}
Click 1100,800
Send {F2}
	Sleep 1000
Send Bill's Monthly Vehicle Log - Auto %Date%
	Sleep 250
Click 748,159
	Sleep 1500
Send %DATE%`n
	Sleep 1500
}

NumberofAttempts = 1
StartTaggingMVLV:
Send ^!t
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Assign Tags" window has failed.`n`nOpen the window manually (CTRL ALT T) then press OK.
		Else
		NumberofAttempts += 1
		Gosub StartTaggingMVLV
		}
	Else

Tags = %MonthTag%,%A_YYYY%,BillyWarren,Logsheet,Report
Loop, Parse, Tags, `,
{
Send %A_LoopField%{Space}
	Sleep 1500
}
Send {Enter}
WinWaitActive AHK_class ENMainFrame

NumberofAttempts = 1
MoveToNBMVLV:
Send !nv
WinWaitActive Move Note to Notebook,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Move Note to Notebook" window have failed.`n`nOpen the window manually (ALT N V) then press OK.
		Else
		NumberofAttempts += 1
		Gosub MoveToNBMVLV
		}
	Else

Send 11{Tab}
	Sleep 250
Send {Enter}
Gui, Show
Exit

;==========================================================================================================================
MVLE2: ;this is the "Document" tag
MsgBox It went to MONTYLY VEHICLE LOG EQUIPMENT 2`nMonthTag equals %MonthTag%`nDate equals %DATE%

WinActivate AHK_class ENMainFrame
	{
	WinWaitActive AHK_class ENMainFrame
	}
Click 1100,800
Send {F2}
	Sleep 1000
Send Bill's Monthly Vehicle Log - Equipment %Date%
	Sleep 250
Click 748,159
	Sleep 1500
Send %DATE%`n
	Sleep 1500

NumberofAttempts = 1
StartTaggingMVLE:
Send ^!t
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Assign Tags" window has failed.`n`nOpen the window manually (CTRL ALT T) then press OK.
		Else
		NumberofAttempts += 1
		Gosub StartTaggingMVLE
		}
	Else

Tags = %MonthTag%,%A_YYYY%,BillyWarren,Logsheet,Report
Loop, Parse, Tags, `,
{
Send %A_LoopField%{Space}
	Sleep 1500
}
Send {Enter}
WinWaitActive AHK_class ENMainFrame

NumberofAttempts = 1
MoveToNBMVLE:
Send !nv
WinWaitActive Move Note to Notebook,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Move Note to Notebook" window have failed.`n`nOpen the window manually (ALT N V) then press OK.
		Else
		NumberofAttempts += 1
		Gosub MoveToNBMVLE
		}
	Else

Send 11{Tab}
	Sleep 250
Send {Enter}

Gui, Show
Exit


;==========================================================================================================================
ETL2: ;this is the "Document" tag
MsgBox It went to EQUIPMENT TIME LOG 2`nMonthTag equals %MonthTag%`nDate equals %DATE%

WinActivate AHK_class ENMainFrame
	{
	WinWaitActive AHK_class ENMainFrame
	}
Click 1100,800
Send {F2}
	Sleep 1000
Send Equipment Time Log Sheet %Date%
	Sleep 250
Click 748,159
	Sleep 1500
Send %DATE%`n
	Sleep 1500
	
NumberofAttempts = 1
StartTaggingETL:
Send ^!t
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Assign Tags" window has failed.`n`nOpen the window manually (CTRL ALT T) then press OK.
		Else
		NumberofAttempts += 1
		Gosub StartTaggingETL
		}
	Else

Tags = %MonthTag%,%A_YYYY%,BillyWarren,Logsheet,Report
Loop, Parse, Tags, `,
{
Send %A_LoopField%{Space}
	Sleep 1500
}
Send {Enter}
WinWaitActive AHK_class ENMainFrame

NumberofAttempts = 1
MoveToNBETL:
Send !nv
WinWaitActive Move Note to Notebook,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Move Note to Notebook" window have failed.`n`nOpen the window manually (ALT N V) then press OK.
		Else
		NumberofAttempts += 1
		Gosub MoveToNBETL
		}
	Else

Send 11{Tab}
	Sleep 250
Send {Enter}

Gui, Show
Exit


;==========================================================================================================================
VRO2: ;this is the "Document" tag
MsgBox It went to VEHICLE RO 2`nMonthTag equals %MonthTag%`nDate equals %DATE%

WinActivate AHK_class ENMainFrame
	{
	WinWaitActive AHK_class ENMainFrame
	}
Click 1100,800
Send {F2}
	Sleep 1000
Send Billy's Requisition Order Log %Date%
	Sleep 250
Click 748,159
	Sleep 1500
Send %DATE%`n
	Sleep 1500
	
NumberofAttempts = 1
StartTaggingVRO:
Send ^!t
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Assign Tags" window has failed.`n`nOpen the window manually (CTRL ALT T) then press OK.
		Else
		NumberofAttempts += 1
		Gosub StartTaggingVRO
		}
	Else

Tags = %MonthTag%,%A_YYYY%,BillyWarren,Logsheet,Report
Loop, Parse, Tags, `,
{
Send %A_LoopField%{Space}
	Sleep 1500
}
Send {Enter}
WinWaitActive AHK_class ENMainFrame

NumberofAttempts = 1
MoveToNBVRO:
Send !nv
WinWaitActive Move Note to Notebook,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Move Note to Notebook" window have failed.`n`nOpen the window manually (ALT N V) then press OK.
		Else
		NumberofAttempts += 1
		Gosub MoveToNBVRO
		}
	Else

Send 11{Tab}
	Sleep 250
Send {Enter}

Gui, Show
Exit


;==========================================================================================================================
FUEL2: ;this is the "Document" tag
MsgBox It went to FUEL2
MsgBox MonthTag equals %MonthTag%
Gui, 2:Add, Text, x12 y10 w120 h30 , Enter the month this report corresponds with
Gui, 2:Add, Text, x12 y50 w120 h30 , Enter the year this report corresponds with
Gui, 2:Add, Edit, x142 y10 w120 h20 vMonth , %A_MMMM%
Gui, 2:Add, Edit, x142 y40 w120 h20 vYear , %A_YYYY%
Gui, 2:Add, Button, x152 y70 w90 h30 gFuelSubmitButton , Submit
; Generated using SmartGUI Creator 4.0
Gui, 2:Show, x75 y770 , Fuel Report
Return

FuelSubmitButton:
Gui, 2:Submit, Hide


WinActivate AHK_class ENMainFrame
WinWaitActive AHK_class ENMainFrame

Click 1100,800
Send {F2}
	Sleep 1000
Send Vehicle Reports - %Month% %Year%
	Sleep 250
Click 748,159
	Sleep 1500
Send %DATE%`n
	Sleep 1500
Send ^s
	Sleep 1000

NumberofAttempts = 1
StartTaggingFUEL:
Send ^!
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Assign Tags" window has failed.`n`nOpen the window manually (CTRL ALT T) then press OK.
		Else
		NumberofAttempts += 1
		Gosub StartTaggingFUEL
		}
	Else
Tags = %MonthTag%,%A_YYYY%,Fuel,VehicleReport
Loop, Parse, Tags, `,
	{
	Send %A_LoopField%{Space}
		Sleep 1500
	}
Send {Enter}
WinWaitActive AHK_class ENMainFrame

NumberofAttempts = 1
MoveToNBFUEL:
Send !nv
WinWaitActive Move Note to Notebook,,2
	If ErrorLevel
		{
		if NumberofAttempts = 4
			MsgBox, Four attempts to open the "Move Note to Notebook" window have failed.`n`nOpen the window manually (ALT N V) then press OK.
		Else
		NumberofAttempts += 1
		Gosub MoveToNBFUEL
		}
	Else

Send 11{Tab}
	Sleep 250
Send {Enter}

MsgBox, 4,,Process another report?
IfMsgBox Yes
	{
	Gui, 1:Show
	Return
	}
Gui, Show
Exit

GuiClose:
ExitApp	

Esc::ExitApp
