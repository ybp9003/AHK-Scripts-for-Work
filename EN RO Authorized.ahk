;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#Include E:\AHK Scripts for Work\Functions\ENFunctions.ahk
#Include E:\AHK Scripts for Work\Functions\Retry if window did not open.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
; SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\



;NEED TO REPLACE INPUTBOXES WTHT A Gui
Gui, Add, Text, cBlue , RO Number
Gui, Add, Text, cBlue , Approvers Department
Gui, Add, Text, cBlue , Approvers Name
Gui, Add, Edit, Number ym vROYear , 14
Gui, Add, Edit, Number ym vROLastThree , xxx
Gui, Add, ComboBox, vDept , ACCT|ADMIN|BD|COE|CS|HR|IFIX|IP|OSP|OSS|PLT|PMM|SECA
Gui, Add, ComboBox, vApprover , ALAN LINK|APRIL HANSARD|BERNICE FISCHER|BETTY DRAWE|BILLY WARREN|BRIAN STEGALL|DAVID MOLDENHAUER|DELBERT WILSON|DENISE SALTER|JAMES WALLY|JEFF MARKWORDT|JIMMY DREISS|JOE HERRING|JOE KENNISON|JR ABRIGO|KAREN HOLBROOK|KERRY SUTTON|MARISELA RODRIGUEZ|MARK METTING|MICHAEL FREEMAN|PATRICK TINLEY|PATTY FEAGAN|RANDY FARRELL|RANDY HALL|RANDY HENCKEL|SAMANTHA TAYLOR|SANDI KENNEDY|SHANE SCHMIDT|STEVE COPP|
Gui, Add, Button, Default gActivate , Ok
Gui, Show
Return

Activate:
Gui, Submit
;=======================================================================================================
StringReplace, Approver, Approver, % " ", , All ;remove spaces
ROFileName = %ROYear%-%ROLastThree% APPROVED
;=======================================================================================================
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
;=======================================================================================================
; MsgBox, ACTIVATING OUTLOOK
WinActivate ahk_class rctrl_renwnd32
WinWaitOpen("ahk_class rctrl_renwnd32")
;=======================================================================================================
;PRESSING CTRL P
Send ^p
WinWaitOpen("Print")
TrayTip, Script TIP, Select the proper printer then press the RCONTROL key to continue, 30, 1
KeyWait, RControl, D
		Sleep 250
TrayTip
SetControlDelay -1
ControlClick, Button15, Print ;EXPERIMENTAL
;=======================================================================================================
;SAVE AS DIALOG SHOULD NOW APPEAR, SHOULD SAVE EMAIL AS PDF TO DESKTOP
WinWaitOpen("Save As")
Send %ROFileName%`n
IfWinExist C:\Windows\system32\CMD.exe
	{
	WinRestore C:\Windows\system32\CMD.exe
	WinActivate C:\Windows\system32\CMD.exe
	WinWaitActive C:\Windows\system32\CMD.exe
	}
Else
	{
	Run, CMD.exe, C:\Users\jherring\AppData\Local\Apps\Evernote\Evernote\
		Sleep 250
	WinMove, C:\Windows\system32\CMD.exe, , 317, 1535
	}
Send ENScript showNotes`n
	Sleep 750
Send "%ROYear%-%ROLastThree%"`n
	Sleep 750
WinMinimize,C:\Windows\system32\CMD.exe
;=======================================================================================================
TrayTip, Script TIP, New note created in Joe's Busienss Notebook`nSelect it`nthen press the RCONTROL key to continue, 30, 1
;=======================================================================================================
WinActivate AHK_class ENMainFrame
KeyWait, RControl, D
	Sleep 250
TrayTip
;=======================================================================================================
;RENAMING NOTE
ENNoteRetitle(ROFileName)
;=======================================================================================================
;TAGGING THE NOTE
ENAssignTags()
NoteTags = %A_YYYY%|%Approver%|%Dept%|RONumber
Loop, Parse, NoteTags, |
	{
	Send %A_LoopField%{Space}
		Sleep 1200
	}
Send {Enter}
	Sleep 1000
;=======================================================================================================
WinClose AHK_class ConsoleWindowClass
;=======================================================================================================
FileRecycle,%A_Desktop%\%ROFileName%.pdf
Gui, Show
Exit
;=======================================================================================================
GuiClose:
ExitApp
ScrollLock::ExitApp