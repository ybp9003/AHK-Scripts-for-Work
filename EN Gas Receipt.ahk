;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:
;ControlFocus and ControlClick are not working on the Note Title
;Setup a control that will uncheck the Task tag and not check it if is already unchecked
;=========================================================================================
#Include E:\AHK Scripts for Work\Functions\ENFunctions.ahk
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
	Sleep 500
SendEvent {CtrlDown}{ShiftDown}c{CtrlUp}{shiftup}
	Sleep 500
Send % "Line "
	Sleep 250

; SendEvent %A_Space%$%Cst%%A_Space%%Dt%/%A_YYYY%%A_Space%%Hr%:%Mn%
AppendText = 1
NoteTitle = $%Cst%%A_Space%%Dt%/%A_YYYY%%A_Space%%Hr%:%Mn%
ENNoteRetitle(NoteTitle,AppendText)
	Sleep 1500

;UPDATE THE NOTE TITLE AND CHANGE NOTE "CREATED DATE" TO MATCH PURCHASE DATE ON THE RECEIPT
ENDateCreated(Dt)
; ControlGetFocus, ENDateField, AHK_class ENMainFrame
; Send %Dt%`n
	; Sleep 1500

;REMOVE THE TAG "TASK"
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
WinWaitClose Assign Tags
Gui, Show
Exit

GuiClose: 
ExitApp

Scrolllock::ExitApp