;version 1.05 Added a GUI to collect the needed info. Make sure it continues to work after the first invoice is processed

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;PROCESS UNIFIRST INVOICES IN EVERNOTE

Gui, Add, Edit, x12 y10 w130 h20 vInvNO, Invoice #
Gui, Add, Edit, x12 y40 w130 h20 vMoDy, Date (MM/DD)
Gui, Add, Edit, x12 y70 w130 h20 vCustNO, Customer #
Gui, Add, Button, x22 y110 w100 h30 gSubmit , Submit to Evernote
; Generated using SmartGUI Creator 4.0
Gui, Show, x300 y450 , Invoice data
Return

Submit:
Gui, Submit

WinActivate AHK_class ENMainFrame
	{
	WinWaitActive AHK_class ENMainFrame
	}
Click 686, 242
	Sleep 500
Send {Enter}
	Sleep 250
SendEvent ^+c
	Sleep 250
Send Invoice %InvNO%
Send ^s
	Sleep 1000

AssignTags:
SendEvent ^!t
WinWaitActive, Assign Tags,, 3 ;waits 3 seconds for the widow to open.
	If ErrorLevel
		Gosub AssignTags
	Else
Tags:
Tags = %A_YYYY%|Unifirst|Invoice
Loop,Parse, Tags, `|
	{
	Send %A_LoopField%{Space}
		Sleep 1200
	}
Send {Enter}
	Sleep 500
Send ^s

WinWaitActive AHK_class ENMainFrame
	Sleep 1000
Click 714, 208 ;clicks to activate the Title field
	Sleep 1000
Send {F2 2}
	Sleep 1000
Send Unifirst Invoice %CustNO%
	Sleep 1000
Click 762, 158 ;clicks to activate the Date field
	Sleep 500
Send %MoDy%`n
Send ^s
	Sleep 1000

WinActivate AHK_class ENMainFrame
Send !n
	Sleep 350
Send v
WinWaitActive, Move Note to Notebook,, 5 ;waits 5 seconds for the widow to open.
	If ErrorLevel
		MsgBox The "Move Note To Notebook" didn't open.`nOpen it and then press OK.
Move = 03|{Tab}|!o
Loop, Parse, Move, |
	{
	Send % A_LoopField
		Sleep 100
	}

MsgBox, 4,,Process another invoice?
IfMsgBox Yes
	{
	Gui,Show
	Return
	}
ExitApp
Esc::ExitApp