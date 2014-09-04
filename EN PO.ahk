;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, ComboBox, x22 y30 w140 h20 vDept , ACCT||ADMIN|BD|COE|BO|HR|IFIX||IP|OSP|OSS|PLT|PMM|SECA
Gui, Add, ComboBox, x22 y60 w140 vInitiator1 , ALAN LINK||APRIL HANSARD|BERNICE FISCHER|BETTY DRAWE|BILLY WARREN|BRIAN STEGALL||DAVID MOLDENHAUER|DELBERT WILSON|DENISE SALTER|JAMES WALLY|JEFF MARKWORDT|JIMMY DREISS|JOE HERRING|JOE KENNISON|JR ABRIGO|KAREN HOLBROOK|KERRY SUTTON|MARISELA RODRIGUEZ|MARK METTING|MICHAEL FREEMAN|PATRICK TINLEY|PATTY FEAGAN|RANDY FARRELL|RANDY HALL|RANDY HENCKEL|SAMANTHA TAYLOR|SANDI KENNEDY|SHANE SCHMIDT|STEVE COPP|
Gui, Add, Edit, x92 y100 w60 h20 vpoYear , %A_YYYY%
Gui, Add, Edit, x152 y100 w50 h20 vpoLastThree , 
Gui, Add, MonthCal, x22 y130 vDate , Month/Day ;Gui, Add, MonthCal, x232 y140 w240 h170 vDate, 
Gui, Add, GroupBox, x150 y310 w130 h205 , Special Tags
Gui, Add, CheckBox, x170 y330 w100 h30 vWorkOrder , Work Order
Gui, Add, CheckBox, x170 y360 w100 h30 vBudgetItem , Budget Item
Gui, Add, CheckBox, x170 y390 w100 h30 vCreditCard, Credit Card
Gui, Add, CheckBox, x170 y420 w100 h30 vOnlinePurchase, Online Purchase
Gui, Add, Checkbox, x170 y450 w100 h30 vHelloSign +Checked, HelloSign
Gui, Add, Checkbox, x170 y480 w100 h30 vReqSig , Requested Signature
Gui, Add, Radio, x22 y330 w100 h30 +Checked vPOActive, Purchase Order Notebook
Gui, Add, Radio, x22 y370 w110 h25 vWarehouse, Warehouse Tasks
Gui, Add, GroupBox, x12 y310 w120 h95 , Move Note To:
Gui, Add, Button, x12 y430 w100 h30 gSubmit, Submit
Gui, Add, Text, x22 y10 w140 h20 , Process a PO in Evernote
Gui, Add, Text, x22 y100 w70 h20 , PO Number
; Gui, Add, Text, x22 y130 w70 h20 , PO Date
; Generated using SmartGUI Creator 4.0
Gui, Show, x150 y450 , 
Return

Submit:
Gui, Submit

If poLastThree = 
	InputBox, poLastThree,, Oops! You must enter the last three numbers of the PO to proceed.
Else	
StringReplace, Initiator, Initiator1, % " ", , All ;remove spaces
FormatTime,Date,%Date%, M/d/yyyy ;changes the format of the date reported from "MonthCal" variable from 20080608 to 6/8/2008

WinActivate AHK_class ENMainFrame
WinWaitActive AHK_class ENMainFrame
	Sleep 250
Click 1100,900 ;without this click the script sometimes renames the Notebook instead of the Note
	Sleep 1000
Send {F2 2}
	Sleep 1000
Send %poYear%%poLastThree%-PO
	Sleep 250
Click 753,158 ;clicks on the "Created Date" field
	Sleep 250
Send %Date%`n
	Sleep 1500
;===========================================================================================================
If WorkOrder = 0
	{
	WorkOrder = skip
	Gosub BudgetItem
	}
WorkOrder = WorkOrder

BudgetItem:
If BudgetItem = 0
	{
	BudgetItem = skip
	Gosub CreditCard
	}
BudgetItem = BudgetItem

CreditCard:
If CreditCard = 0
	{
	CreditCard = skip
	Gosub OnlinePurchase
	}
CreditCard = CreditCard

OnlinePurchase:
If OnlinePurchase = 0
	{
	OnlinePurchase = skip
	Gosub HelloSign
	}
OnlinePurchase = OnlinePurchase

HelloSign:
If HelloSign = 0
	{
	HelloSign = skip
	Gosub RequestedSignature
	}
HelloSign = HelloSign

RequestedSignature:
If ReqSig = 0
	{
	ReqSig = skip
	Gosub TagExceptions
	}
ReqSig = Requested
;===========================================================================================================
TagExceptions:
If Initiator = RANDYHALL
	Initiator = R2

If Dept = BO
	Dept = CustomerService
	
If Dept = ACCT
	Dept = Accounting

If Dept  = BD
	Dept = BusinessDevelopment

If Dept  = HR
	Dept = HumanResources

If Dept = PLT
	Dept = PlantServices

If Dept = SECA
	Dept = Security&Alarm
	
Dept = %Dept%Dept
;===========================================================================================================
OpenTaggingWindow:
WinActivate AHK_class ENMainFrame
Send ^!t ;begin tagging the note
WinWaitActive Assign Tags,,2
	If ErrorLevel
		Gosub OpenTaggingWindow
	Else
		Sleep 500
Tags = %poYear%{Space}|PurchaseOrder{Space}|%Dept%{Space}|%Initiator%{Space}|%HelloSign%{Space}|%WorkOrder%{Space}|%BudgetItem%{Space}|%CreditCard%{Space}|%OnlinePurchase%{Space}|%ReqSig%{Space}|AutoHotKey
Loop,Parse,Tags, |
	{
	If A_LoopField = skip{Space}
		Continue
	SendEvent %A_LoopField%
	Sleep 1200
	}
WinWaitActive AHK_class ENMainFrame
; If POActive = 1
	; Notebook = 04.POs
	; Gosub MoveNotebook
; If Warehouse = 1
	; Notebook := ".WarehouseTasks"
;===========================================================================================================
IfWinExist C:\Windows\system32\CMD.exe
	WinRestore C:\Windows\system32\CMD.exe
Else
	{
	Run, CMD.exe, C:\Program Files (x86)\Evernote\Evernote\
		Sleep 250
	WinMove, C:\Windows\system32\CMD.exe, , 317, 1535
	}
Send ENScript showNotes`n
	Sleep 750
Send %poYear%%poLastThree%`n
WinMinimize C:\Windows\system32\CMD.exe
;===========================================================================================================

Gui, Show
Exit

GuiClose:
ExitApp

Scrolllock::ExitApp