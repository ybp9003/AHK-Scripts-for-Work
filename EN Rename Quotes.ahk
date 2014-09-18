;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#Include E:\AHK Scripts for Work\Functions\ENFunctions.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text, , Year
Gui, Add, Text, , Quote Number
Gui, Add, Text, , Last three of PO
Gui, Add, Text, , How many notes need`nto be renamed?
Gui, Add, Edit, ym vYear, %A_YYYY%
Gui, Add, Edit, vQuote, 
Gui, Add, Edit, vPOLast3,
Gui, Add, Edit, vNumberofLoops,
Gui, Add, Button, Default gSubmit, Ok
Gui, Show
Return

Submit:
Gui, Submit

Loop, %NumberofLoops%
	{
	TrayTip, Countdown, %NumberofLoops% to go,,1
	KeyWait, LButton, D
		Sleep 250
	WinWaitActive AHK_class ENMainFrame
	MouseGetPos, posX, posY
	NewNoteTitle = %Year%%POLast3%-Quote %Quote%
	ENNoteRetitle(NewNoteTitle)
	NumberofLoops -= 1
	MouseMove, %posX%,%posY%
	}
TrayTip, All Done, Check to make sure all notes were renamed properly,,1
	Sleep 10000
GuiClose:
ExitApp

ScrollLock::ExitApp
