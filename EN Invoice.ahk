#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text, x12 y10 , MM/DD of the invoice
Gui, Add, Text, x12 y30 , PO Number
Gui, Add, Edit, x142 y10 w100 h20 vdate , mm/dd
Gui, Add, Edit, x242 y30 w70 h20 vPOLastthree, xxx
Gui, Add, Button, x102 y70 w100 h30 Default gButtonOK , OK
Gui, Add, Edit, x242 y10 w70 h20 vInvYear , %A_YYYY%
Gui, Add, Edit, x142 y30 w100 h20 vPOYear , %A_YYYY%
; Generated using SmartGUI Creator 4.0
Gui, Show, x127 y87 , Invoice Processing
Return

ButtonOK:
Gui, Submit

; InputBox, date, Enter the MM/DD of the invoice
; InputBox, po, What is the "last three" of the PO number?
WinActivate AHK_class ENMainFrame
	WinWaitActive AHK_class ENMainFrame

Send ^!t
WinWaitActive ahk_class #32770
	Send %InvYear%{Space}
		Sleep 1000
	Send Invoice{Space}
		Sleep 1000
	Send purchaseorder{Space}

WinWaitActive AHK_class ENMainFrame

	MouseClick,Left,822,240									;click on note title
	Send {F2}
	Send ^c													;copies note title to clipboard incase you wish to restore what was originally there
	Sleep 1000
	Send %POYear%%POLastthree%-Inv
	Sleep 500
	MouseClick,Left,756,157									;click on "Created Date" field
	Sleep 1000
	Send %Date%
If InvYear != %A_YYYY%
	Send /%InvYear%
	Sleep 1000


GuiClose:
ExitApp

Scrolllock::ExitApp