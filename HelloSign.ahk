;version 1.01 The ^s after adding the terms and conditions page was crashing PDF Viewer so I changed it to ALT+F then S to save it through the file menu. Sleeps (150) were added in between the key commands
;version 1.02 Added the Yes/No box asking if the PO box is over $5000
;version 1.03 Multipage PO not Gosub removePOfromDesktop: before exiting
;version 1.04 commented out the hotkey that starts this script. I want to see if it will automatically run from the "posig" command in the master script. [and it does work]
;version 1.05 Under TermsCond1: I changed the sleeps to WinWaitActive to see if the script can be sped up without sacrificing accuracy
;version 1.06 Changed the script at removePOfromdesktop: to use FileRecycle instead of the longer 'human' process
;version 1.10 Changed the way the window is resized. May need to remap the mouse clicks to adjust for any issues caused.
;version 1.11 Changed the final mouse movement from a click to a move. Now it places the mouse over the Request Signature button and stops. BUG:Window is not being resized to the original width. Added a sleep after the MouseClick on the signature placement page to see if that corrects the problem.
;version 1.12 The window is now not being enlarged like before so the clicks are missing their target. Added a Sleep 500 before the browser is enlarged.
;version 1.13 EXPIRIMENTAL: signature placement now relies on user clicking the initial position to place the signature box. Once that is done, it should automatically resize the box and continue. If this works I will reproduce this for the initial box also. This will also eliminate the need to exit the script when there is a multi-page PO
;version 1.13.01 it didn't work so I added extra curly brackets around that part of the script to see what happens

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode 2

Gui, Add, Edit, x22 y20 w130 h20 vLast3 , PO Last three ###'s
Gui, Add, CheckBox, x22 y50 w130 h30 vTerms , Terms and Conditions
Gui, Add, CheckBox, x22 y90 w130 h20 v5k , PO over $5`,000
Gui, Add, Button, x32 y120 w70 h30 gOKButton , OK
; Generated using SmartGUI Creator 4.0
Gui, Show, x436 y635 , New GUI Window
Return

OKButton:
Gui, Submit

;STEP 1 saves the PO to the desktop with the PO number as the file name
Begin:
WinActivate XChange Editor
	{
	WinWaitActive XChange Editor
	}
	Send ^+s
		WinWaitActive Save File As,,2
			If ErrorLevel
				{
				Gosub Begin
				}
			Else
	Send C:\Users\jherring\Desktop\%A_YYYY%%Last3%`n
WinWaitActive XChange Editor

If Terms = 1
	{
	Gosub, TermsCond1
	}
	Sleep 500
WinClose XChange Editor
Gosub, HelloSign1

TermsCond1:
{
WinActivate PDF-XChange Editor
	Send +^i ;Opens the "Add Page" dialog
	WinWaitActive Insert Pages,,2
		If ErrorLevel
			{
			Gosub TermsCond1
			}
		Else
	Send {Tab 2}{Enter}
		{
		WinWaitActive Open Files
		}
	Send C:\Users\jherring\Documents\TERMS AND CONDITIONS.pdf`n
		{
		WinWaitActive Insert Pages
		Send !o
		}
WinWaitActive PDF-XChange Editor
	Send !f
	Send s ;save the document
		Sleep 1000
WinClose PDF-XChange Editor
}
HelloSign1:
IfWinExist Request signature
	{
	WinActivate Request signature
	}
Else
	Run https://www.hellosign.com/home/request

WinWaitActive Open
	Send %A_YYYY%%Last3%`n
MsgBox 1. Upload your document`n2. Move the browser webpage to the main screen and make sure it's MAXIMIZED`n3. Place the cursor in the "Signer's Name" box`n4. Once the HelloSign has finished converting the document, Click OK
{
WinActivate, Google Chrome
		Sleep 500
	Send ^a
		Sleep 150
	Send Steve Copp
		Sleep 150
	Send {tab}
		Sleep 150
	Send scopp@hctc.coop
	Send {tab 3}
		Sleep 250
	Send %A_YYYY%%Last3%-PO
		Sleep 250
	MouseClick, left,372,675 ;click "Where do they need to sign?"
}
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
		; {
		; MouseGetPos, posX, posY
		; SplashTextOff
		; MouseClick,Left,%posX%,%posY%
		; }
	Gosub finish
	}
WinActivate Google Chrome
	Sleep 250
{
SplashTextOn,200,120, Waiting, Click to add the Signature box to continue.
WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
KeyWait, LButton, D
	Sleep 250
	; {
	; MouseGetPos, posX, posY
	; }
SplashTextOff
; MouseClick,Left,%posX%,%posY%
}
finish:
{
MouseClick, Left,1360,144 ;click "Continue"
MouseMove 380,1000 ;moves mouse to the "Request Signature" button

}

FileRecycle, %A_Desktop%\%A_YYYY%%Last3%.pdf ;sends the PO to the recycle bin
GuiClose:
ExitApp

Esc::ExitApp


