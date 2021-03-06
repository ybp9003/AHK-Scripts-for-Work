﻿;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:
;replace TrayTip lines with splash screen function
;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


Gui, +AlwaysOnTop
Gui, Add, Text,, Description
Gui, Add, Text,, Part Number
Gui, Add, Text,, Vendor Name
Gui, Add, Text,, Long Description
Gui, Add, Text, x10 y155 , Quantity
Gui, Add, Text,, Cost
Gui, Add, Edit, ym w290 Limit40 vdesc, 
Gui, Add, Edit, w200 vpartnumber,
Gui, Add, Edit, w200 vvendor,
Gui, Add, Edit, w240 h60 Limit120 vldesc,
Gui, Add, Edit, vqty,
Gui, Add, Edit, vcost,

;GL ENTRY SECTION
Gui, Add, Text, ym , Division
Gui, Add, Text, , Department
Gui, Add, Text, , GL Account
Gui, Add, Text, , Sub Account
Gui, Add, Text, , Work Order
Gui, Add, Edit, ym w30 h20 vDivision ,
Gui, Add, Edit, w30 h20 vDepartment,
Gui, Add, Edit, w70 h20 vGL,
Gui, Add, Edit, w30 h20 vSub,
Gui, Add, Edit, w70 h20 vWO,
Gui, Add, Button, Default , OK

Gui, Show, x-562 y494, Generic Line Item Entry
Return

ButtonOK:
Gui, Submit
StringUpper, desc, desc
desc := Trim(desc)
StringUpper, partnumber, partnumber
partnumber := Trim(partnumber)
StringUpper, vendor, vendor
vendor := Trim(vendor)
StringUpper, ldesc, ldesc

WinActivate 46575app 46575 - Hill Country Telephone ABS
WinWaitActive 46575app 46575 - Hill Country Telephone ABS

ItemData = 0|%A_Tab%|%desc%|%A_Tab%|P/N %partnumber%,%A_Space%|%vendor%,%A_Space%|%ldesc%|%A_Tab%|%qty%|%A_Tab%|%A_Tab%|%cost%|%A_Tab%
Loop, Parse, ItemData, |
	{
	SendRaw %A_LoopField%
		Sleep 200
	IfWinExist Warning
		Send {Enter}
	}
Send !s

WinWaitActive, GL Accounting,, 3
	if ErrorLevel
		{
		TrayTip, INFO, The GL Accounting didn't open in time - Skipping GL entry mode,, 1
		Gosub ShowGUI
		}

EnteringGL:
TrayTip, INFO, Press RControl to start entering GL data,, 1
KeyWait, RControl, D
	Sleep 350
WinActivate GL Accounting
	Sleep 500
WinMove, GL Accounting,, -1575, 600, 1500, 850 ;RESIZES THE GL ACCOUNTING WINDOW TO A SPECIFIC SIZE EACH TIME
	Sleep 500
Click 46,110 ;GL DIV
	Sleep 250
Send {F5}
	Sleep 1000
IfWinExist Confirmation
	Click 296,116
TrayTip, INFO, Waiting for GL Accounting window to activate,, 1
WinWaitActive GL Accounting
Send %Division%
	Sleep 250
Send {Tab}
	Sleep 250
Click 208,110
	Sleep 250
Send {F5}
; Send ^a
	Sleep 250
Send %GL%.%Sub% ;GL Number.Sub Account
	Sleep 250
Send {Tab}
	Sleep 250
Send {F5}
Click 330,113 ;GL DEPT
	Sleep 500
Send %Department% ;GL DEPTARTMENT
	Sleep 250
Send {Tab}
	Sleep 250
Click 573,113
	Sleep 250
Send {F5}
Send {Raw}%qty%%A_Space%%desc%
	Sleep 250
Send {Tab}
;===================================================================
IfNotEqual,WO,
	{
	WinWaitActive WO Interface
	Send %WO%
		Sleep 250
	Send %A_Tab%
		Sleep 250
	Send 3
	Send `n
	}
;===================================================================
WinWaitClose GL Accounting

ShowGUI:
LastUsedGL = %Division%.%Department%.%GL%.%Sub%
;IniWrite, Value, Filename, Section [, Key]
IniWrite,%LastUsedGL%,Generic Item Entry.Ini,LastUsedGL,GL
IniWrite,%Division%,Generic Item Entry.Ini,LastUsedGL,Div
IniWrite,%Department%,Generic Item Entry.Ini,LastUsedGL,Dept
IniWrite,%GL%,Generic Item Entry.Ini,LastUsedGL,GLAccount
IniWrite,%Sub%,Generic Item Entry.Ini,LastUsedGL,GLsub


Gui, Show
Exit

GuiClose:
ExitApp

Scrolllock::ExitApp








