#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, ComboBox, x22 y30 w140 h20 vDept , ACCT|ADMIN|BD|COE|CS|HR|IFIX||IP|OSP|OSS|PLT|PMM|SECA
Gui, Add, ComboBox, x22 y60 w140 vInitiator1 , ALAN LINK|APRIL HANSARD|BERNICE FISCHER|BETTY DRAWE|BILLY WARREN|BRIAN STEGALL||DAVID MOLDENHAUER|DELBERT WILSON|DENISE SALTER|JAMES WALLY|JEFF MARKWORDT|JIMMY DREISS|JOE HERRING|JOE KENNISON|JR ABRIGO|KAREN HOLBROOK|KERRY SUTTON|MARISELA RODRIGUEZ|MARK METTING|MICHAEL FREEMAN|PATRICK TINLEY|PATTY FEAGAN|RANDY FARRELL|RANDY HALL|RANDY HENCKEL|SAMANTHA TAYLOR|SANDI KENNEDY|SHANE SCHMIDT|STEVE COPP|
Gui, Add, Edit, x68 y95 w60 h20 vReqYear , %A_YYYY%x
Gui, Add, Edit, x128 y95 w50 h20 vReqNumber vReqNumber , Req #
Gui, Add, Edit, x22 y125 w180 h50 vReqDescription, Leaving blank will cause the script to not retitle the note
Gui, Add, MonthCal, x22 y190 vDate ,
Gui, Add, GroupBox, x212 y10 w130 h150 , Special Tags
Gui, Add, CheckBox, x232 y30 w100 h30 vWorkOrder , Work Order
Gui, Add, CheckBox, x232 y60 w100 h30 vBudgetItem , Budget Item
Gui, Add, CheckBox, x232 y90 w100 h30 vCreditCard, Credit Card
Gui, Add, CheckBox, x232 y120 w100 h30 vOnlinePurchase, Online Purchase
Gui, Add, Button, x260 y270 w100 h30 gSubmit, Submit
Gui, Add, Text, x22 y10 w160 h20 , Process a Requisition in Evernote
Gui, Add, Text, x22 y100 , Number?

; Generated using SmartGUI Creator 4.0
Gui, Show, x150 y450 , 
Return

Submit:
Gui, Submit, NoHide
;===========================================================================================================
StringReplace, Initiator, Initiator1, % " ", , All ;remove spaces
FormatTime,Date,%Date%, M/d/yyyy ;changes the format of the date reported from "MonthCal" variable from 20080608 to 6/8/2008
;===========================================================================================================

WinActivate AHK_class ENMainFrame
	WinWaitActive AHK_class ENMainFrame
	Sleep 250
Click 712,238 ;without this click the script sometimes renames the Notebook instead of the Note
	Sleep 500
Send {F2 2}
	Sleep 1000
If ReqDescription = ;IF THIS VARIABLE IS BLANK, IT WILL NOT RETITLE THE NOTE
	Gosub NoteCreationDate
Send {Raw}%ReqYear%-Req %ReqNumber% [%ReqDescription%]
	Sleep 250

NoteCreationDate:
Click 758,156 ;clicks on the "Created Date" field
	Sleep 250
Send %Date%`n
	Sleep 1500
;===========================================================================================================
If WorkOrder = 0
	{
	WorkOrder = null
	Gosub BudgetItem
	}
WorkOrder = WorkOrder

BudgetItem:
If BudgetItem = 0
	{
	BudgetItem = null
	Gosub CreditCard
	}
BudgetItem = BudgetItem

CreditCard:
If CreditCard = 0
	{
	CreditCard = null
	Gosub OnlinePurchase
	}
CreditCard = CreditCard

OnlinePurchase:
If OnlinePurchase = 0
	{
	OnlinePurchase = null
	Gosub Dept
	}
OnlinePurchase = OnlinePurchase

Dept:
If Dept = ACCT
	Dept = Accounting

If Initiator = RandyHall
	Initiator = R2
	
If Dept = BD
	Dept = BusinessDevelopment

If Dept = CS
	Dept = CustomerService

If Dept = HR
	Dept = HumanResources
	
Dept = %Dept%Dept

;===========================================================================================================
OpenTaggingWindow:
Send ^!t ;begin tagging the note
WinWaitActive Assign Tags,,2
	If ErrorLevel
		{
		Gosub OpenTaggingWindow
		}
	Else
		Sleep 500
Tags = %ReqYear%{Space}|Requisition{Space}|%Dept%{Space}|%Initiator%{Space}|%WorkOrder%{Space}|%BudgetItem%{Space}|%CreditCard%{Space}|%OnlinePurchase%{Space}|AutoHotKey
Loop,Parse,Tags, |
	{
	If A_LoopField = null{Space}
		Continue
	Send %A_LoopField%
	Sleep 1200
	}
;===========================================================================================================

GuiClose:
ExitApp

Esc::ExitApp