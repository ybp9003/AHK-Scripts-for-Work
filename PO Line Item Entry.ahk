#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


InputBox, desc,, Descripton
InputBox, partnumber,, Part No.
InputBox, vendor,, Vendor Name
InputBox, ldesc,, Long Description
InputBox, qty,, Quantity
InputBox, cost,, Cost
WinActivate ahk_class SunAwtFrame
	WinWaitActive ahk_class SunAwtFrame

StringUpper, desc, desc
StringUpper, partnumber, partnumber
StringUpper, vendor, vendor
StringUpper, ldesc, ldesc

ItemData = 0|{Tab}|%desc%|{Tab}|P/N %partnumber%,{Space}|%vendor%,{Space}|%ldesc%|{Tab}|%qty%|{Tab 2}|%cost%|{Tab}
Loop, Parse, ItemData, |
	{
	Send %A_LoopField%
		Sleep 100
	If WinExist Warning
		Send {Enter}
	}
; Send {Tab 2}
; Send x01{Enter 3}
Send {Enter}
ExitApp

Esc::ExitApp