#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox, 4, ,Did you print the invoice?
IfMsgBox No
	{
	MsgBox, Once you have printed the invoice, run this script again.
	ExitApp
	}
InputBox, date, Enter the MM/DD of the invoice
InputBox, po, What is the "last three" of the PO number?
WinActivate AHK_class ENMainFrame
	{
	WinWaitActive AHK_class ENMainFrame
	}
Send ^!t
WinWaitActive ahk_class #32770
	{
	Send %A_YYYY%{Space}
		Sleep 1000
	Send Invoice{Space}
		Sleep 1000
	Send Power&tel{Space}
		Sleep 1000
	Send purchase{Space}
	}
WinWaitActive AHK_class ENMainFrame
	{
	MouseClick,Left,822,240									;click on note title
	Send {F2}
	Send ^c													;copies note title to clipboard incase you with to restore what was originally there
	Sleep 1000
	Send %A_YYYY%%po%-Inv
	Sleep 500
	MouseClick,Left,756,157 ;click on "Created Date" field
	Sleep 1000
	Send %Date%
	Sleep 1000
	}
WinWaitActive AHK_class ENMainFrame
	Send !nv
WinWaitActive Move Note to Notebook
	Send 03{Tab}
		Sleep 250
	Send {Enter}
ExitApp

Esc::ExitApp