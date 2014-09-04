;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Send ^!t
WinWaitActive Assign Tags
Tags = %A_YYYY%,Comdata,FleetCard,Invoice,Statement,VehicleReport
Loop, Parse, Tags, `,
{
SendEvent %A_LoopField%{Space}
	Sleep 1200
}
MsgBox, 4, Move note to 03.Accounting?
	IfMsgBox No
		ExitApp
WinActivate AHK_class ENMainFrame
WinWaitActive AHK_class ENMainFrame
Send !nv
WinWaitActive Move Note to Notebook
Send 03.accounting{Tab}
	Sleep 250
Send {Enter}
ExitApp

Scrolllock::ExitApp