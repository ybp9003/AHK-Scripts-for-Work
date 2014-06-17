#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Generated using SmartGUI Creator 4.0
Gui, Add, Text, x12 y40 w90 h20 , Department
Gui, Add, Edit, x112 y40 w130 h20 vDept, DEPARTMENT
Gui, Add, Text, x12 y70 w70 h20 , Requestor
Gui, Add, Edit, x112 y70 w130 h20 vRequestor, REQUESTOR
Gui, Add, Text, x12 y100 w70 h20 , Req Number
Gui, Add, Edit, x112 y100 w130 h20 vReq, N/A
Gui, Add, Text, x12 y130 w80 h20 , GL Account
Gui, Add, Edit, x112 y130 w150 h100 vGL, x.x.xxxx.xxx
Gui, Add, Text, x12 y240 w80 h20 , Work Order
Gui, Add, Edit, x112 y240 w130 h20 vWO, N/A
Gui, Add, Text, x12 y270 w80 h20 , Budget Item
Gui, Add, Edit, x112 y270 w120 h20 vBI, N/A
Gui, Add, Edit, x112 y310 w130 h20 vQN, Quote Number
Gui, Add, Edit, x112 y350 w130 h20 vON, Order Number
Gui, Add, CheckBox, x12 y380 w160 h20 vCCP, CREDIT CARD PURCHASE
Gui, Add, Button, x112 y410 w100 h30 , Submit
; Generated using SmartGUI Creator 4.0
Gui, Show, x80 y700 h448 w280, MISC PO Message
Return

ButtonSubmit:
Gui, Submit

WinActivate Messages
Send INITIATOR: %Dept%/%Requestor%`n
Send {Raw}REQ #%Req%`n ;needs to have {Raw} because of the # sign
Send {Raw}%GL%`n
Send {Raw}WORK ORDER #%WO%`n
Send {Raw}%A_YYYY% BUDGET ITEM #%BI%`n
If QN = 
	Gosub OrderNo
Send {Raw}QUOTE #%QN%`n

OrderNo:
If ON = 
	Gosub CCP
Send {Raw}ORDER #%ON%`n

CCP:
If CCP = 1
	Send PURCHASED WITH CREDIT CARD`n
Send PLUS SHIPPING/HANDLING/TAX if applicable`n
Send -------------------------------------------

GuiClose:
ExitApp

Esc::ExitApp