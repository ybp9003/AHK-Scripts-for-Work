#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\

;NEED TO REPLACE INPUTBOXES WTHT A Gui
InputBox, RONumber,, RO Number being processed:
InputBox, Approver,, Approver's name:
InputBox, Dept,, Approver's department:

; MsgBox, ACTIVATING OUTLOOK
NumberofAttempts = 1
ActivateOutlook1:
WinActivate ahk_class rctrl_renwnd32
	WinWaitActive ahk_class rctrl_renwnd32,,2
If ErrorLevel
	{
	If NumberofAttempts = 4
		MsgBox, Four attempts to activate "Inbox - Microsoft Outlook" have failed.`n`nThe script will now exit.
	Else
		NumberofAttempts += 1
		Gosub ActivateOutlook1
	}
Else
NumberofAttempts = 1
PrintDialog:
; MsgBox, PRESSING CTRL P
Send ^p
WinWaitActive Print,,2
If ErrorLevel
	{
	If NumberofAttempts = 4
		MsgBox, Four attempts to activate "Print Dialog" have failed.`n`nThe script will now exit.
	Else
		NumberofAttempts += 1
		WinActivate Print
		Gosub PrintDialog
	}
Else
	SplashTextOn,200,90, Waiting, Select the proper printer.`nPress the RControl key to continue.
	WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
	KeyWait, RControl, D
		Sleep 250
	SplashTextOff
	Send {Enter}

; MsgBox, SAVE AS DIALOG SHOULD NOW APPEAR, SHOULD SAVE EMAIL AS PDF TO DESKTOP
NumberofAttempts = 1
SaveAsDialog:
WinWaitActive Save As,,2
If ErrorLevel
	{
	If NumberofAttempts = 4
		MsgBox, Four attempts to activate "Save As Dialog" have failed.`n`nThe script will now exit.
	Else
		NumberofAttempts += 1
		WinActivate Save As
		Gosub SaveAsDialog
	}
Else
	Send %A_Desktop%\%RONumber%{Enter}


; NumberofAttempts = 1
; ActivateEN:
; WinActivate AHK_class ENMainFrame
; WinWaitActive AHK_class ENMainFrame,,2
; If ErrorLevel
	; {
	; If NumberofAttempts = 4
		; MsgBox, Four attempts to activate "Evernote" have failed.`n`nThe script will now exit.
	; Else
		; NumberofAttempts += 1
		; Gosub ActivateEN
	; }
; Else
; MsgBox, CREATING A NEW RONUMBER NOTE IN "JOE"
Run %A_Desktop%\Evernote Templates\RO Number Approved.enex
SplashTextOn,400,90, Waiting, New note created in Joe called "RO Number Approved".`nSelect it, then press the RControl key to continue.
WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
KeyWait, RControl, D
	Sleep 250
SplashTextOff

; MsgBox, RENAMING NOTE
Click, 750,350
Send {F2 2}
	Sleep 500
Send %RONumber%`n
	Sleep 1000

; MsgBox, TAGGING THE NOTE
NumberofAttempts = 1
StartTagging:
Send ^!t
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		If NumberofAttempts = 4
			MsgBox, Four attempts to open the "Assign Tags" window have failed.`n`nOpen the window manually (CTRL ALT T) then press OK.
		Else
		NumberofAttempts += 1
		Gosub StartTagging
		}
	Else
		Sleep 250

; MsgBox, TAGS SHOULD BE:`n%A_YYYY%, %Approver%, %Dept%
NoteTags = %A_YYYY%|%Approver%|%Dept%
Loop, Parse, NoteTags, |
	{
	Send %A_LoopField%{Space}
		Sleep 1200
	}
Send {Enter}
	Sleep 1000

; MsgBox, ATTACHING PDF TO NOTE (ALT+F F)
NumberofAttempts = 1
AttachFiletoNote:
	Send !f
		Sleep 250
	Send f
WinWaitActive Open,,2
If ErrorLevel
	{
	If NumberofAttempts = 4
		MsgBox, Four attempts to activate "Save As Dialog" have failed.`n`nThe script will now exit.
	Else
		NumberofAttempts += 1
		WinActivate AHK_class ENMainFrame
		Gosub AttachFiletoNote
	}
Else
Send %A_Desktop%\%RONumber%.pdf{Enter}
	Sleep 1000

; MsgBox, F6 SEARCH FOR %RONumber%
NumberofAttempts = 1
DosWindow:
Run CMD.exe
WinWaitActive ahk_class ConsoleWindowClass,,2
If ErrorLevel
	{
	If NumberofAttempts = 4
		{
		MsgBox, Four attempts to open the "DOS Window" has failed. Press OK to exit app.
		ExitApp
		}
	NumberofAttempts += 1
	Gosub DosWindow
	}
Else
	NumberofAttempts += 1
	Send ENScript.exe showNotes`n
		Sleep 250
	Send  `"%RONumber%`"`n
		Sleep 500
WinClose AHK_class ConsoleWindowClass

MsgBox, 4,,Is there a duplicate RO note that needs to be removed?
	IfMsgBox No
		Gosub MoveNotetoAccounting
SplashTextOn,200,90, Waiting, Click on the note that needs to be removed.
WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
KeyWait, LButton, D
	Sleep 500
SplashTextOff
Send {Delete}
	Sleep 1000

MoveNotetoAccounting:
SplashTextOn,200,90, Waiting, Click on the note that needs to be moved to 03.Accounting.
WinMove, Waiting, , 5, 5 ;move splash window to the top left corner
KeyWait, LButton, D
	Sleep 500
SplashTextOff

Click, 673,121 ;opens the notebook change field
	Sleep 250
Send 03
	Sleep 250
Send {Enter}
	Sleep 500
FileRecycle %A_Desktop%\%RONumber%.pdf

NumberofAttempts = 1
ActivateOutlook2:
WinActivate ahk_class rctrl_renwnd32
	WinWaitActive ahk_class rctrl_renwnd32,,2
If ErrorLevel
	{
	If NumberofAttempts = 4
		MsgBox, Four attempts to activate "Inbox - Microsoft Outlook" have failed.`n`nThe script will now exit.
	Else
		NumberofAttempts += 1
		Gosub ActivateOutlook2
	}
Else
Send AppsKey
Send m

ExitApp

Esc::ExitApp