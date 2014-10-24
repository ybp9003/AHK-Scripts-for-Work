;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

IfExist,Generic Item Entry.ini
; IniRead, OutputVar, Filename [, Section, Key, Default]
IniRead,LastUsedGL,Generic Item Entry.ini,LastUsedGL,GL

; Generated using SmartGUI Creator 4.0
Gui, Add, Text, , Department
Gui, Add, Text, , Requestor
Gui, Add, Text, , Req Number
Gui, Add, Text, , GL Account
Gui, Add, Text, x13 y155 , Work Order
Gui, Add, Text, x13 y182 , Budget Item
Gui, Add, Text, x13 y209 , Quote Number
Gui, Add, Text, x13 y236 , Order Number
Gui, Add, Text, x13 y263 , Invoice Number
Gui, Add, CheckBox, x13 y290 vCCP, %A_Space%Credit Card
Gui, Add, Text, x13 y317 , Budget Item Year

Gui, Add, Text, , 
Gui, Add, Combobox, ym vDept, ACCT|ADMIN|BD|COE|CS|HR|IFIX||IP|OSP|OSS|PLT|PMM|SECA
Gui, Add, Combobox, vRequestor, ALAN LINK|APRIL HANSARD|BERNICE FISCHER|BETTY DRAWE|BILLY WARREN|BRIAN STEGALL||DAVID MOLDENHAUER|DELBERT WILSON|DENISE SALTER|JAMES WALLY|JEFF MARKWORDT|JIMMY DREISS|JOE HERRING|JOE KENNISON|JR ABRIGO|KAREN HOLBROOK|KERRY SUTTON|MARGIE DOMINGUEZ|MARISELA RODRIGUEZ|MARK METTING|MICHAEL FREEMAN|PATRICK TINLEY|PATTY FEAGAN|RANDY FARRELL|RANDY HALL|RANDY HENCKEL|SAMANTHA TAYLOR|SANDI KENNEDY|SHANE SCHMIDT|STEVE COPP|
Gui, Add, Edit, w200 vReq, N/A
Gui, Add, Edit, w200 h60 vGL, %LastUsedGL%
Gui, Add, Edit, w200 vWO, N/A
Gui, Add, Edit, w200 vBI, N/A
Gui, Add, Edit, w200 vQN,
Gui, Add, Edit, w200 vON,
Gui, Add, Edit, w200 vINV,
Gui, Add, Edit, w200 vCCBuyer, STEVE COPP
Gui, Add, Edit, vBIYear , %A_YYYY%
Gui, Add, Text, xm , MISC Information
Gui, Add, Edit, w200 h60 vMISCInfo ,
Gui, Add, Text, ,
Gui, Add, CheckBox, xm Checked vSHandling, Shipping/Handling/Tax if applicable
Gui, Add, Button, Default , Submit
; Generated using SmartGUI Creator 4.0
Gui, Show, x-332 y500 , PO Message
Return

ButtonSubmit:
Gui, Submit

;IniWrite, Value, Filename, Section [, Key] 
IniWrite,%GL%,Generic Item Entry.ini,LastUsedGL,GL
StringUpper, CCBuyer, CCBuyer

WinActivate Messages
WinWaitActive Messages
Send INITIATOR: %Dept%/%Requestor%`n
Send {Raw}REQ %Req%`n ;needs to have {Raw} because of the # sign
Send {Raw}%GL%`n
Send {Raw}WORK ORDER %WO%`n
Send {Raw}%BIYear% BUDGET ITEM %BI%`n
IfNotEqual,QN,
	Send {Raw}QUOTE #%QN%`n

IfNotEqual,ON,
	Send {Raw}ORDER #%ON%`n

IfEqual,CCP,1
	Send PURCHASED WITH CREDIT CARD%A_Space%[%CCBuyer%]`n

IfEqual,SHandling,1
	Send PLUS SHIPPING/HANDLING/TAX if applicable`n
Send -------------------------------------------
IfNotEqual,MISCInfo,
	Send {Raw}`n%MISCInfo%

GuiClose:
ExitApp

Scrolllock::ExitApp