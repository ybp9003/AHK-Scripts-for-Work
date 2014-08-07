#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;Gui, +AlwaysOnTop
Gui, Add, Text,, Description
Gui, Add, Text,, Part Number
Gui, Add, Text,, Vendor Name
Gui, Add, Text,, Long Description
Gui, Add, Text,, Quantity
Gui, Add, Text,, Cost
Gui, Add, Edit, ym Limit40 vdesc,
Gui, Add, Edit, vpartnumber,
Gui, Add, Edit, vvendor,
Gui, Add, Edit, w240 h60 Limit120 vldesc,
Gui, Add, Edit, vqty,
Gui, Add, Edit, vcost,

;GL ENTRY SECTION
Gui, Add, Text, ym , Division
Gui, Add, Text, , Department
Gui, Add, Text, , GL Account
Gui, Add, Text, , Sub Account
Gui, Add, Edit, ym w30 h20 vDivision ,
Gui, Add, Edit, w30 h20 vDepartment,
Gui, Add, Edit, w70 h20 vGL,
Gui, Add, Edit, w30 h20 vSub,
Gui, Add, Button, Default , OK

Gui, Show, x-513 y494, Generic Line Item Entry
Return

ButtonOK:
Gui, Submit
StringUpper, desc, desc
StringUpper, partnumber, partnumber
StringUpper, vendor, vendor
StringUpper, ldesc, ldesc

WinActivate ahk_class SunAwtFrame
WinWaitActive ahk_class SunAwtFrame

ItemData = 0|{Tab}|%desc%|{Tab}|P/N %partnumber%,{Space}|%vendor%,{Space}|%ldesc%|{Tab}|%qty%|{Tab}|{Tab}|%cost%|{Tab}
Loop, Parse, ItemData, |
	{
	Send %A_LoopField%
		Sleep 200
	If WinExist Warning
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
; Send ^a
	Sleep 250
Send {F5}
Send MATERIALS
	Sleep 250
Send {Tab}
WinWaitClose GL Accounting

ShowGUI:
Gui, Show
Exit

GuiClose:
ExitApp

Scrolllock::ExitApp