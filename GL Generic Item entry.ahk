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

IfExist,Generic Item Entry.txt
	FileDelete,Generic Item Entry.txt

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
FileAppend,%Division%.%Department%.%GL%.%Sub%,Generic Item Entry.txt
;=======================================================================
Clipboard =
SplashTextOn,190,100,Copy Description,Place the cursor in the "Item Description" and press RControl
	WinMove,Copy Description,,5,5
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
IfNotEqual,WO,
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

; WinActivate ahk_class SunAwtFrame
; WinWaitActive GL Accounting
	; Sleep 500
;=======================================================================
; If Division = 0
	; Gosub GLAcct
; Click,46,110,2 ;GL DIV
	; Sleep 500
; Send {Raw}%Division%
	; Sleep 250
;=======================================================================
; GLAcct:
; If GL = NA
	; Gosub GLDept
; Click 208,110
	; Sleep 250
; Send {Raw}%GL%.%Sub% ;GL Number.Sub Account
	; Sleep 250
;=======================================================================
; GLDept:
; If Division = 0
	; Gosub GLRef
; Click 330,110 ;GL DEPT
	; Sleep 500
; Send {Raw}%Department% ;GL DEPTARTMENT
	; Sleep 250
;=======================================================================
; GLRef:
; Click 573,110,2
	; Sleep 250
; Send ^a
	; Sleep 250
; Send {Raw}%qty%%A_Space%%desc%
	; Sleep 250
; Send {Tab}
; ===================================================================UNTESTED
; IfNotEqual WO,
	; {
	; MsgBox the variable WO was not blank
	; WinWaitActive WO Interface
	; Send %WO%%A_Tab%3`n
	; }
;=======================================================================
; WinWaitClose GL Accounting
	
SplashTextOff
	Gui, Show
	Exit

ExitApp

GuiClose:
ExitApp

Scrolllock::ExitApp
