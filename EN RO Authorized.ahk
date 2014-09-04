;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\



;NEED TO REPLACE INPUTBOXES WTHT A Gui
Gui, Add, Text, cBlue , RO Number
Gui, Add, Text, cBlue , Approvers Department
Gui, Add, Text, cBlue , Approvers Name
Gui, Add, Edit, Number ym vYear , 14
Gui, Add, Edit, Number ym vROLastThree , xxx
Gui, Add, ComboBox, vDept , ACCT|ADMIN|BD|COE|CS|HR|IFIX|IP|OSP|OSS|PLT|PMM|SECA
Gui, Add, ComboBox, vApprover , ALAN LINK|APRIL HANSARD|BERNICE FISCHER|BETTY DRAWE|BILLY WARREN|BRIAN STEGALL|DAVID MOLDENHAUER|DELBERT WILSON|DENISE SALTER|JAMES WALLY|JEFF MARKWORDT|JIMMY DREISS|JOE HERRING|JOE KENNISON|JR ABRIGO|KAREN HOLBROOK|KERRY SUTTON|MARISELA RODRIGUEZ|MARK METTING|MICHAEL FREEMAN|PATRICK TINLEY|PATTY FEAGAN|RANDY FARRELL|RANDY HALL|RANDY HENCKEL|SAMANTHA TAYLOR|SANDI KENNEDY|SHANE SCHMIDT|STEVE COPP|
Gui, Add, Button, Default gActivate , Ok
Gui, Show
Return

Activate:
Gui, Submit

StringReplace, Approver, Approver, % " ", , All ;remove spaces

If Dept = ACCT
	Dept = Accounting

If Approver = RandyHall
	Approver = R2
	
If Dept = BD
	Dept = BusinessDevelopment

If Dept = CS
	Dept = CustomerService

If Dept = HR
	Dept = HumanResources
	
If Dept = BO
	Dept = BusinessOffice

	Dept = %Dept%Dept


; MsgBox, ACTIVATING OUTLOOK
NumberofAttempts = 1
ActivateOutlook1:
WinActivate ahk_class rctrl_renwnd32
	WinWaitActive ahk_class rctrl_renwnd32,,2
If ErrorLevel
	{
	If NumberofAttempts = 4
		{
		MsgBox, Four attempts to activate "Inbox - Microsoft Outlook" have failed.`n`nThe script will now exit.
		ExitApp
		}
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
		{
		MsgBox, Four attempts to activate "Print dialog" have failed.`n`nThe script will now exit.
		ExitApp
		}
	Else
		NumberofAttempts += 1
		WinActivate Print
		Gosub PrintDialog
	}
Else
TrayTip, Script TIP, Select the proper printer then press the RCONTROL key to continue, 30, 1
KeyWait, RControl, D
		Sleep 250
TrayTip
SetControlDelay -1
ControlClick, Button15, Print ;EXPERIMENTAL
; Send {Enter}

; MsgBox, SAVE AS DIALOG SHOULD NOW APPEAR, SHOULD SAVE EMAIL AS PDF TO DESKTOP
NumberofAttempts = 1
SaveAsDialog:
WinWaitActive Save As,,2
If ErrorLevel
	{
	If NumberofAttempts = 4
		{
		MsgBox, Four attempts to activate "Save As dialog" have failed.`n`nThe script will now exit.
		ExitApp
		}
	Else
		NumberofAttempts += 1
		WinActivate Save PDF File As
		Gosub SaveAsDialog
	}
Else
	Send %A_Desktop%\EN Joe\%Year%-%ROLastThree% Aproved{Enter}

TrayTip, Script TIP, New note created in Joe's Busienss Notebook`nSelect it`nthen press the RCONTROL key to continue, 30, 1
WinActivate AHK_class ENMainFrame
KeyWait, RControl, D
	Sleep 250
TrayTip

; MsgBox, RENAMING NOTE
Click, 750,350
Send {F2 2}
	Sleep 500
Send %Year%-%ROLastThree% Approved`n
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
NoteTags = %A_YYYY%|%Approver%|%Dept%|RONumber
Loop, Parse, NoteTags, |
	{
	Send %A_LoopField%{Space}
		Sleep 1200
	}
Send {Enter}
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
	Send  {Raw}"%Year%-%ROLastThree%"`n
		Sleep 500
WinClose AHK_class ConsoleWindowClass

MsgBox, 4,,Is there a duplicate RO note that needs to be removed?
	IfMsgBox No
		Gosub MoveNotetoAccounting

TrayTip, Help, Click on the note that needs to be removed, 30, 1
KeyWait, LButton, D
	Sleep 500
Send {Delete}
	Sleep 1000
TrayTip

MoveNotetoAccounting:
TrayTip, Help, Click on the note that needs to be moved to 03.Accounting, 30, 1
KeyWait, LButton, D
	Sleep 500
TrayTip

Click, 673,121 ;opens the notebook change field
	Sleep 250
Send 03
	Sleep 250
Send {Enter}
Gui, Show
Exit


GuiClose:
ExitApp
ScrollLock::ExitApp