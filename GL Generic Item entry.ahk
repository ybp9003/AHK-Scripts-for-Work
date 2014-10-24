;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#Include E:\AHK Scripts for Work\Functions\SplashText.ahk

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2 ;matches partial window titles
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Generated using SmartGUI Creator 4.0
; Gui, Add, Text, x22 y10 w110 h30 , Enter the desired GL into the boxes below
Gui, Add, Text, , Quantity
Gui, Add, Edit, w70 h20 vqty,
Gui, Add, Text, ym , Division
Gui, Add, Text, , Department
Gui, Add, Text, , GL Account
Gui, Add, Text, , Sub Account
Gui, Add, Text, , Work Order
Gui, Add, Edit, ym w70 h20 vDivision , 0
Gui, Add, Edit, w70 h20 vDepartment, 0
Gui, Add, Edit, w70 h20 vGL, NA
Gui, Add, Edit, w70 h20 vSub,
Gui, Add, Edit, w70 h20 vWO, 
Gui, Add, Button, w60 h20 Default, Submit
Gui, +AlwaysOnTop
Gui, Show, x-438 y497 ,
Return

ButtonSubmit:
Gui, Submit
; IniWrite, Value, Filename, Section [, Key] 
IniWrite,%Division%.%Department%.%GL%.%Sub%,Generic Item Entry.Ini,LastUsedGL,GL
;=======================================================================
Clipboard =
SplashText = Copy Description,Place the cursor in the "Item Description" and press RControl
SplashTextFunc(5,5,190,100,"Copy Description",SplashText)
KeyWait,RControl, D
	SplashTextOff
	Sleep 250
Send ^a
	Sleep 250
Send ^c
ClipWait, 2
	if ErrorLevel
		{
		InputBox,desc,Copy Failed,The attempt to copy text onto the clipboard failed.`n`nEnter the description here,,,,,,,%Clipboard%
		Gosub Continue
		}
desc = %Clipboard%
Continue:
StringUpper, desc, desc
;=======================================================================
Send !u
Text =
(
%Division%.%Department%.%GL%.%Sub%
Quantity %qty%
%desc%
)
SplashTextFunc(5,5,300,100,"GL",Text)
;=======================================================================

WinWaitActive GL Accounting
	Sleep 500
WinMove, GL Accounting,, -1575, 600, 1500, 850 ;RESIZES THE GL ACCOUNTING WINDOW TO A SPECIFIC SIZE EACH TIME
;=======================================================================
MsgBox,4,Question,Enter description only?
	IfMsgBox Yes
		Gosub MESSAGEONLY
;=======================================================================
Click 46,110 ;GL DIV
	Sleep 250
Send {F5}
	Sleep 1000
IfWinExist Confirmation
	Click 296,116
WinWaitActive GL Accounting
Send %Division%
	Sleep 250
Send {Tab}
	Sleep 250
Click 208,110
	Sleep 250
Send {F5}
	Sleep 250
Send %GL%.%Sub% ;GL Number.Sub Account
	Sleep 250
Send {Tab}
	Sleep 250
Send {F5}
Click 330,113 ;GL DEPT
	Sleep 500
Send %Department% ;GL DEPTARTMENT
	Sleep 250
Send {Tab}
	Sleep 250
;=======================================================================
MESSAGEONLY:
WinActivate GL Accounting
Click,573,113,2
	Sleep 250
Send {F5}
Send {Raw}%qty%%A_Space%%desc%
	Sleep 250
Send {Tab}
;=======================================================================
IfNotEqual,WO, ;IF THE %WO% VARIABLE IS 'NOT' BLANK
	{
	WinWaitActive WO Interface
	Send %WO%
		Sleep 250
	Send %A_Tab%
		Sleep 250
	Send 3
	Send `n
	}
;=======================================================================
WinWaitClose GL Accounting
	
SplashTextOff
	Gui, Show
	Exit

ExitApp

GuiClose:
ExitApp

Scrolllock::ExitApp
