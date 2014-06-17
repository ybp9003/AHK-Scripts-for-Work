#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Edit, w200 h19 vCst Left, Cost
Gui, Add, Edit, w200 h19 vDt Left, Purchase Date
Gui, Add, Edit, w200 h19 vHr Left, Hour Purchased
Gui, Add, Edit, w200 h19 vMn Left, Minute Purchased
Gui, Add, Button, w150 h20 gSubmit ,Submit to Evernote
Gui, Show , x180 y750, Collection Purchase Info
Return

Submit:
{
Gui, Submit

;add purchase information to the note
	{
	WinActivate AHK_class ENMainFrame
		{
		WinWaitActive AHK_class ENMainFrame
		}
	}
	{
	SendEvent Line{Space}`n
	Send ^+c
	Sleep 1000
	SendEvent Recd
	}
;Update the note title and change note "created date" to match purchase date on the receipt
	{
	MouseClick,Left,850,238
	Sleep 250
	Send {F2}
	Sleep 750
	Send {End}
	Sleep 150
	Send {Space}$%Cst% %Dt%/%A_YYYY% %Hr%:%Mn%
	MouseClick, Left, 774, 159
	Sleep 1000
	Send %Dt%`n
	Sleep 1500
	}

;remove the tag "Task"
Send ^!t ;begin tagging the note
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		WinActivate ENMainFrame
		Send ^!t
		}
Send task{Space}

}
MsgBox, 4,, Process another receipt?
IfMsgBox Yes
	{
	Gui, Show
	WinActivate Assign Tags
	Return
	}

GuiClose: 
ExitApp

Esc::ExitApp