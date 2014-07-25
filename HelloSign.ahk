#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2

Gui, Add, Edit, w130 h20 vLast3 , PO Last three ###'s
Gui, Add, CheckBox, vTerms , Terms and Conditions
Gui, Add, CheckBox, v5k , PO over $5`,000
Gui, Add, Text, ,
Gui, Add, Text, ,Send Document to:
Gui, Add, Radio, +Checked vSteveCopp, Steve Copp
Gui, Add, Radio, vAlanLink, Alan Link
Gui, Add, Button,w70 h30 Default gOKButton , OK
; Generated using SmartGUI Creator 4.0
Gui, Show, x436 y635 , New GUI Window
Return

OKButton:
Gui, Submit

If Terms = 1
	{
	NumberofAttempts = 1
	TermsCond:
	WinActivate PDF-XChange Editor
		Sleep 50
	SendEvent ^+i ;Opens the "Add Page" dialog
		Sleep 50
	WinWaitActive Insert Pages,,2
		If ErrorLevel
		{
			If NumberofAttempts = 4
				MsgBox, Four attempts to open the "Insert Pages" dialog have failed.`n`nOpen the window manually (CTRL SHIFT I) then press OK.
		Else
			NumberofAttempts += 1
			Gosub TermsCond
		}
Else
	Send {Tab 2}{Enter}
		Sleep 50
	WinWaitActive Open Files
	Send C:\Users\jherring\Documents\TERMS AND CONDITIONS.pdf`n
		Sleep 50
	WinWaitActive Insert Pages
	Send !o
	}

WinActivate PDF-XChange Editor
WinWaitActive PDF-XChange Editor,,2
NumberofAttempts = 1
SaveAs:
Send !f
	Sleep 50
Send a
	Sleep 50
WinWaitActive Save File As,,2
	If ErrorLevel
		{
		If NumberofAttempts = 4
			{
			MsgBox, Four attempts to open the "Save As" dialog have failed.`n`nOpen the window manually (CTRL SHIFT S) then press OK.
			WinActivate Save File As
			}
		Else
		NumberofAttempts += 1
		Gosub SaveAs
		}
	Else
Send %A_Desktop%\%A_YYYY%%Last3%`n

WinWaitActive PDF-XChange Editor
Send ^s ;save the document
	Sleep 1500
WinClose PDF-XChange Editor

HelloSign1:
Run https://www.hellosign.com/home/request
WinWaitActive Open
	Sleep 50
Send %A_Desktop%\%A_YYYY%%Last3%`n
MsgBox 1. Upload your document`n2. Move the browser webpage to the main screen and make sure it's MAXIMIZED`n3. Place the cursor in the "Signer's Name" box`n4. Once the HelloSign has finished converting the document, Click OK
WinActivate, Google Chrome
	Sleep 500
Send ^a
	Sleep 150
If SteveCopp = 1
	{
	Send Steve Copp
	EmailAddress := "scopp@hctc.coop"
	}
If AlanLink = 1
	{
	Send Alan Link
	EmailAddress := "alink@hctc.coop"
	}
	Sleep 150
Send {tab}
	Sleep 150
Send % EmailAddress
Send {tab 3}
	Sleep 250
Send %A_YYYY%%Last3%-PO
	Sleep 250
Click,372,675 ;click "Where do they need to sign?"

If 5k = 1
	{
	SplashTextOn,200,90, Waiting, Once the signature page is finished loading, press the RControl key to continue.
	WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
	KeyWait, RControl, D
		Sleep 250
	SplashTextOff
	MouseClick, Left,526,140 ;clicks on "Initials"
	SplashTextOn,200,90, Waiting, Click to add the Initial box to continue.
	WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
	MouseMove 1428,923 ;moves mouse to the down to "about" where the initial box should go
	KeyWait, LButton, D
		Sleep 250
	Gosub finish
	}
WinActivate Google Chrome
	Sleep 250

SplashTextOn,200,120, Waiting, Click to add the Signature box to continue.
WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
KeyWait, LButton, D
	Sleep 250
SplashTextOff

finish:
Click,1360,144 ;click "Continue"
MouseMove 380,1000 ;moves mouse to the "Request Signature" button

FileRecycle, %A_Desktop%\%A_YYYY%%Last3%.pdf ;sends the PO to the recycle bin

MsgBoxTest:
MsgBox The hot key worked!

GuiClose:
ExitApp

ScrollLock::ExitApp














