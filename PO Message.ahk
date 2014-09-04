;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Generated using SmartGUI Creator 4.0
Gui, Add, Text, , Department
Gui, Add, Text, , Requestor
Gui, Add, Text, , Req Number
Gui, Add, Text, , GL Account
Gui, Add, Text, x13 y153 , Work Order
Gui, Add, Text, x13 y180 , Budget Item
Gui, Add, Text, x13 y207 , Quote Number
Gui, Add, Text, x13 y234 , Order Number
Gui, Add, Text, , 
Gui, Add, Combobox, ym vDept, ACCT|ADMIN|BD|COE|CS|HR|IFIX||IP|OSP|OSS|PLT|PMM|SECA
Gui, Add, Combobox, vRequestor, ALAN LINK|APRIL HANSARD|BERNICE FISCHER|BETTY DRAWE|BILLY WARREN|BRIAN STEGALL||DAVID MOLDENHAUER|DELBERT WILSON|DENISE SALTER|JAMES WALLY|JEFF MARKWORDT|JIMMY DREISS|JOE HERRING|JOE KENNISON|JR ABRIGO|KAREN HOLBROOK|KERRY SUTTON|MARISELA RODRIGUEZ|MARK METTING|MICHAEL FREEMAN|PATRICK TINLEY|PATTY FEAGAN|RANDY FARRELL|RANDY HALL|RANDY HENCKEL|SAMANTHA TAYLOR|SANDI KENNEDY|SHANE SCHMIDT|STEVE COPP|
Gui, Add, Edit, w200 vReq, N/A
Gui, Add, Edit, w200 h60 vGL, 
Gui, Add, Edit, w200 vWO, N/A
Gui, Add, Edit, w200 vBI, N/A
Gui, Add, Edit, w200 vQN,
Gui, Add, Edit, w200 vON,
Gui, Add, Text, xm , MISC Information
Gui, Add, Edit, w200 h60 vMISCInfo ,
Gui, Add, Text, ,
Gui, Add, CheckBox, xm vCCP, CREDIT CARD PURCHASE
Gui, Add, Edit, x171 y382 w140 vCCBuyer, STEVE COPP
Gui, Add, CheckBox, xm Checked vSHandling, Shipping/Handling/Tax if applicable
Gui, Add, Button, Default , Submit
; Generated using SmartGUI Creator 4.0
Gui, Show, x-332 y500 , IP PO Message
Return

ButtonSubmit:
Gui, Submit

StringUpper, CCBuyer, CCBuyer

WinActivate Messages
WinWaitActive Messages
Send INITIATOR: %Dept%/%Requestor%`n
Send {Raw}REQ %Req%`n ;needs to have {Raw} because of the # sign
Send %GL%`n
Send {Raw}WORK ORDER %WO%`n
Send {Raw}%A_YYYY% BUDGET ITEM %BI%`n
If QN = 
	Gosub OrderNo
Send {Raw}QUOTE #%QN%`n

OrderNo:
If ON = 
	Gosub CCP
Send {Raw}ORDER #%ON%`n

CCP:
If CCP = 1
	{
	Send PURCHASED WITH CREDIT CARD%A_Space%
	Send [%CCBuyer%]`n
	}

If SHandling = 1
	{
Send PLUS SHIPPING/HANDLING/TAX if applicable`n
	}
Send -------------------------------------------
If MISCInfo = 
	ExitApp
Send {Raw}`n%MISCInfo%

GuiClose:
ExitApp

Scrolllock::ExitApp