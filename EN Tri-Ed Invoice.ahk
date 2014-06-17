#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox Print make sure you have printed out the invoice before continuing
InputBox,poLastThree,, What is the last three of the PO number this invoice is for?
InputBox, date,, Enter the MM/DD of the invoice
WinActivate AHK_class ENMainFrame
	{
	WinWaitActive AHK_class ENMainFrame
	}
Send ^!t
WinWaitActive Assign Tags
	{
	Send %A_YYYY%{Space}
		Sleep 1500
	Send Invoice{Space}
		Sleep 1500
	Send tri{Space}
		Sleep 1500
	Send purchase{Space}`n
	}
WinWaitActive AHK_class ENMainFrame
	{
	MouseClick,Left,822,240 ;click on note title
	Send {F2}
	Sleep 1000
	Send %A_YYYY%%poLastThree%-Inv
	MouseClick,Left,756,157 ;click on "Created Date" field
		Sleep 500
	Send %Date%`n
		Sleep 1500
	}
Send !nv
WinWaitActive Move Note to Notebook
Send 03{tab}
	Sleep 250
Send {enter}

ExitApp

Esc::ExitApp