;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:
;ControlFocus and ControlClick are not working on the Note Title
;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Edit, w200 h19 vCst Left, Cost
Gui, Add, Edit, w200 h19 vDt Left, Purchase Date
Gui, Add, Edit, w200 h19 vHr Left, Hour Purchased
Gui, Add, Edit, w200 h19 vMn Left, Minute Purchased
Gui, Add, Button, w150 h20 gSubmit ,Submit to Evernote
Gui, Show , x180 y750, Collection Purchase Info
Return

Submit:

Gui, Submit

;add purchase information to the note
WinActivate AHK_class ENMainFrame
WinWaitActive AHK_class ENMainFrame
TrayTip,Progress Update,Evernote is active
ControlFocus, WebViewHost1,AHK_class ENMainFrame
ControlGetFocus,ENWebEdit,AHK_class ENMainFrame
	TrayTip,Progress Update,%ENWebEdit% has Focus
	Sleep 5000
SendEvent {CtrlDown}{ShiftDown}c{CtrlUp}{shiftup}
	Sleep 1000
Send Line%A_Space%
	Sleep 250

;Update the note title and change note "created date" to match purchase date on the receipt
ControlClick,x745 y241,ahk_class ENMainFrame
ControlGetFocus,ENNoteTitle,AHK_class ENMainFrame
	TrayTip,Progress Update,%ENNoteTitle% has Focus
		Sleep 5000
SendEvent {End 2}
	Sleep 250
SetKeyDelay,15
SendEvent %A_Space%$%Cst%%A_Space%%Dt%/%A_YYYY%%A_Space%%Hr%:%Mn%
	Sleep 250
ControlClick, X648 Y158, AHK_class ENMainFrame
	TrayTip,Progress Update,Sending a ControlClick to the Date field
		Sleep 1000
ControlGetFocus, ENDateField, AHK_class ENMainFrame
	TrayTip,Progress Update,%ENDateField% has Focus
Send %Dt%`n
	Sleep 1500

;remove the tag "Task"
	TrayTip,Progress Update,Opening the Assign Tags Window
Send ^!t ;begin tagging the note
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		WinActivate ENMainFrame
		Send ^!t
		}
	Sleep 250
Send task%A_Space%
	Sleep 250
TrayTip,Progress Update,Sending a ControlClick to the "HIDE UNASSIGNED TAGS" box
ControlClick, Button3, Assign Tags ;CLICKS THE "HIDE UNASSIGNED TAGS" BOX
TrayTip,Progress Update,The "Hide Unassigened Tags" box should be unchecked in five Seconds
	Sleep 5000
ControlClick, Button3, Assign Tags ;CLICKS THE "HIDE UNASSIGNED TAGS" BOX
TrayTip,Progress Update,The "HIDE UNASSIGNED TAGS" box should have been unchecked.
WinWaitClose Assign Tags
Gui, Show
Exit

GuiClose: 
ExitApp

Scrolllock::ExitApp