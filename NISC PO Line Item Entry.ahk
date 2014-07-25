#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; InputBox, desc,, Descripton
; InputBox, partnumber,, Part No.
; InputBox, vendor,, Vendor Name
; InputBox, ldesc,, Long Description
; InputBox, qty,, Quantity
; InputBox, cost,, Cost

;Gui, +AlwaysOnTop
Gui, Add, Text,, Description
Gui, Add, Text,, Part Number
Gui, Add, Text,, Vendor Name
Gui, Add, Text,, Long Description
Gui, Add, Text,, Quantity
Gui, Add, Text,, Cost
Gui, Add, Edit, ym vdesc,
Gui, Add, Edit, vpartnumber,
Gui, Add, Edit, vvendor,
Gui, Add, Edit, vldesc,
Gui, Add, Edit, vqty,
Gui, Add, Edit, vcost,
Gui, Add, Button, Default , OK
Gui, Show, x-470 y1186, Generic Line Item Entry
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
	Sleep 1000

; Send {Tab 2}
; Send x01{Enter 3}
Send !s

Gui, Show
Return

GuiClose:
ExitApp

Scrolllock::ExitApp