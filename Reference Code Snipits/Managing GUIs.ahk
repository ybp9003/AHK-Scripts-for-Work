#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

#SingleInstance Force

Gui, Add, Text, x10 y10 w150 h20, Gui 1
Gui, Add, Button, x10 y30 w150 h20 gGui2, Show #2

Gui, 2:Add, Text, x10 y10 w150 h20, Gui 2
Gui, 2:Add, Button, x10 y30 w150 h20 gGui3, Show #3 Only

Gui, 3:Add, Text, x10 y10 w150 h20, Gui 3
Gui, 3:Add, Button, x10 y30 w150 h20 gDone, Show GUI 1

Gui, Show, x100 y100, Gui 1
Return

Gui2:
	Gui, 2:Show, x200 y200, Gui 2
	Return
	
Gui3:
	Gui, 1:Hide
	Gui, 2:Hide
	Gui, 3:Show, xCenter yCenter, Gui3
	Return
	
Done:
	Gui, 3:Hide
	Gui, 1:Show
	Return

GuiClose:
ExitApp	
	
Esc::ExitApp