#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2 ;matches partial window titles
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Generated using SmartGUI Creator 4.0
Gui, Add, Text, x22 y40 w80 h20 , Division
Gui, Add, Text, x22 y60 w80 h20 , Department
Gui, Add, Text, x22 y80 w80 h20 , GL Account
Gui, Add, Text, x22 y100 w80 h20 , Sub Account
Gui, Add, Edit, x102 y40 w70 h20 vDivision , Div
Gui, Add, Edit, x102 y60 w70 h20 vDepartment, Dept
Gui, Add, Edit, x102 y80 w70 h20 vGL, Gl
Gui, Add, Edit, x102 y100 w70 h20 vSub, Sub
Gui, Add, Button, x102 y130 w60 h20 , Submit
Gui, Show, x527 y288 h176 w206, Account Data
Gui, Add, Text, x22 y10 w110 h30 , Enter the desired GL into the boxes below

Return

ButtonSubmit:
Gui, Submit

SplashTextOn, 100, 30, GL, %Division%`.%Department%.%GL%.%Sub%`n
WinMove, GL, , 5, 5 ;move splash window to the top left corner

If GL = 2124.1
{
	InputBox, tagPrefix,, What are the first four letters of the Asset Tag?
	SplashTextOff
	SplashTextOn, 100, 30, GL, %Division%`.%Department%.%GL%.%Sub%`nTo begin GL entry, place the mouse cursor over the GL Division field and press the Right Control Key
	WinMove, GL, , 5, 5 ;move splash window to the top left corner
	Gosub AssetTagProcess
}	

Begin:
WinWaitActive GL Accounting
WinMove, GL Accounting,, -1575, 600, 1500, 850 ;RESIZES THE GL ACCOUNTING WINDOW TO A SPECIFIC SIZE EACH TIME
	Sleep 250
Click 46,110 ;GL DIV
	Sleep 250
Send %Division%
	Sleep 250
Send {Tab}
	Sleep 250
;Send {F2}
;	Sleep 250
;Send ^a
;	Sleep 250
Click 208,110
	Sleep 250
Send ^a
	Sleep 250
Send %GL%.%Sub% ;GL Number.Sub Account
	Sleep 250
Send {Tab}
	Sleep 250
Click 330,113 ;GL DEPT
	Sleep 500
; Send {F2}
Send %Department% ;GL DEPTARTMENT
	Sleep 250
Send {Tab}
	Sleep 250
Click 573,113
; Send {F2}
	Sleep 250
Send ^a
	Sleep 250
Send MATERIALS
	Sleep 250
Send {Tab}
	Sleep 400
	
Click 1365,830
WinWaitClose GL Accounting
MouseMove, posX, posY
MsgBox, 4,,Input another GL?
IfMsgBox Yes
	{
	KeyWait, LButton, D
		Sleep 250
	MouseGetPos, posX, posY
	Send !u
	Gosub Begin
	}

SplashTextOff
ExitApp


AssetTagProcess:
InputBox, tagSuffix,, What are the last four numbers of the Asset Tag?,,,,,,,,%tagSuffix%
InputBox, tagReference,, Enter any extended information for this paticular Asset Tag.,,,,,,,,%tagReference%
InputBox, QTY,, Quantity assigned to this tag:,,,,,,,,1
{
WinWaitActive GL Accounting
WinMove, GL Accounting,,0,1460,1460,1010
}
{
KeyWait, RControl, D
	{
	MouseGetPos, posX, posY
	MouseClick,Left,%PosX%,%posY%
	}
	Sleep 1000
SendEvent %Division%				;GL DIVISION
	Sleep 350
Send {Tab}
Sleep 350
MouseClick, WheelDown,,,20 ;scroll down to the bottom GL Entry (needed when entering multiple GL Lines)
	Sleep 500
MouseClick,Left,40,0,2,,,R ;moves the mouse 40 pixels to the right and double clicks
	Sleep 350
Send %GL%.%Sub%						;GL Number.Sub Account
	Sleep 250
; MouseClick,Left,330,113			;CLICK GL DEPARTMENT FIELD
Send (Tab)
	Sleep 250
SendEvent %Department%{Tab} 		;GL DEPTARTMENT
	Sleep 250
Send MATERIALS
	Sleep 250
Send {Tab}
	Sleep 250
Send {Tab}
	Sleep 250
Send ^a
SendEvent %QTY%
	Sleep 250
Send {Tab}
	Sleep 500
IfWinExist AM Interface
	{
	WinClose AM Interface
	}
	Sleep 350
Send {Space}
}
{
WinWaitActive Extended Reference
}
Send %tagPrefix%%tagSuffix% - %tagReference%
Send {Tab}{Enter}
	Sleep 500
IfWinExist AM Interface
	Gosub Interface
{
WinWaitActive GL Accounting
}
Send !n
Interface:
{
WinWaitActive AM Interface
}
{
MouseClick,Left,108,46				;Places the cursor in the Asset Tag field
Send %tagPrefix%%tagSuffix%
	Sleep 250
Send {Tab}
	Sleep 250
Send 367
	Sleep 250
Send {Tab}
	Sleep 250
Send 1
	Sleep 250
Send {Enter}
}
MsgBox, 4,,Input another tag?
IfMsgBox Yes
	{
	MsgBox, 4,, Does the GL screen need another row added first?
		If MsgBox Yes
		{
		WinActivate GL Accounting
			{
			WinWaitActive GL Accounting
			Send !w
			}
		}
	Gosub AssetTagProcess
	}
SplashTextOff
ExitApp



Scrolllock::ExitApp