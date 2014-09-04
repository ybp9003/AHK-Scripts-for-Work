;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;PROCESS UNIFIRST INVOICES IN EVERNOTE
Gui, Add, Text, , Invoice #
Gui, Add, Text, , Date (MM/DD)
Gui, add, Text, , Customer #
Gui, Add, Edit, ym w130 h20 vInvNO, Invoice #
Gui, Add, Edit, w130 h20 vMoDy, Date (MM/DD)
Gui, Add, Edit, w130 h20 vCustNO, Customer #
Gui, Add, Button, w100 h30 Default gSubmit , Submit to Evernote
; Generated using SmartGUI Creator 4.0
Gui, Show, x300 y450 , Invoice data
Return

Submit:
Gui, Submit

WinActivate AHK_class ENMainFrame
	WinWaitActive AHK_class ENMainFrame
Click 686, 242
	Sleep 500
Send {Enter}
	Sleep 250
Send {Up}
	Sleep 250
Send ^+c
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

SplashTextOn, 200,50, Move To Notebook, Waiting for the "Move Note to Notebook" window to open
WinMove, Move To Notebook, , 5, 5 ;move splash window to the top left corner
WinWaitActive Move Note to Notebook
SplashTextOff
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
GuiClose:
ExitApp
Scrolllock::ExitApp