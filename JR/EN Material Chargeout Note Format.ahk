#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.



Gui, Add, Radio, x12 y20 w100 h30 vRadioOSP +Checked, OSP
Gui, Add, Radio, x12 y50 w100 h30 vRadioCOE, COE
Gui, Add, Radio, x12 y80 w100 h30 vRadioBIP, BIP
Gui, Add, Radio, x12 y110 w100 h30 vRadioIFIX, IFIX
Gui, Add, Radio, x12 y140 w100 h30 vRadioSECA, SECA
Gui, Add, CheckBox, x112 y20 w100 h30 vCBChargeOut, Charge Out
Gui, Add, CheckBox, x112 y50 w100 h30 vCBMaint, Maintenance
Gui, Add, CheckBox, x112 y80 w100 h30 vCBWO, Work Order
Gui, Add, CheckBox, x112 y110 w100 h30 vCBSales, Sales
Gui, Add, ComboBox, x232 y20 w230 h21 vName, Bart Tucker|Bob Harris|Bobby Stephenson|Clay Benton|Cowboy Communications|David Ochoa|Dean Oates|Dennis Meier|Dennis Tatsch|Eric Lantz|Glenn Kibbitt|Herman Leifeste|James Borjes|James Heimann|JamesWally|Jeff Markwordt|Jerry Walden|Jimmy Dreiss|Jody Thompson|John Ivy|Jordan Weikel|Jose Cervantes|Keith Thompson|Larry Pizzini|Mario Giannini|Matt Gilshenan|Michael Freeman|Michael Koenig|Michael Shults|MP Nexlevel|Newell Stewart|Norman Jackson|Patrick Tinley|Patty Feagan|Randy Henckel|Randy Root|Randy Wood|Roger Ayala|Roland Michel|Rudy Wheatfall|Shane Schmidt
Gui, Add, Edit, x232 y70 w240 h60 vComment, N/A
Gui, Add, MonthCal, x232 y140 w240 h170 vDate, 
Gui, Add, Button, x62 y210 w100 h30 gSubmitButton, Submit
; Generated using SmartGUI Creator 4.0
Gui, Show, x3037 y173 , Enter Relevant Data
Return

{
SubmitButton:
Gui, Submit

	If RadioOSP = 1
		{
		Dept = OSP
		Gosub Sheet
		}
COE:
	If RadioCOE = 1
		{
		Dept = COE
		Gosub Sheet
		}
BIP:
	If RadioBIP = 1
		{
		Dept = BIP
		Gosub Sheet
		}

IFIX:
	If RadioIFIX = 1
		{
		Dept = IFIX
		Gosub Sheet
		}

SECA:
		Dept = SECA ;no need for an "If" statement because if it was none of the others, it has to be this one.

Sheet:
	If CBChargeOut = 1
		{
		ChgOut = ChargeOut{Space}
		}
	If CBMaint = 1
		{
		Maint = Maintenance{Space}
		}
	If CBWO = 1
		{
		WkOrder = WO
		InputBox, wOrder,,Enter the Work Order Number
		wOrder = %wOrder%{Space}
		}
	If CBSales = 1
		{
		Sales = Sales{Space}
		}

{		
NameTryAgain:
SplashTextOn,200,100, Waiting, Click on the title of the note you wish to have formatted.`nWhen ready, press the Right Control button.
WinMove, Waiting, , 3109, -498 ;move splash window to the top left corner
KeyWait, RControl, D
	Sleep 250
SplashTextOff
WinWaitActive, AHK_class ENMainFrame,,2 ;will wait 2 secconds for the Evernote window to be activated
	if ErrorLevel
		{
		MsgBox,,, It doesn't appear that the Evernote window was clicked on. Click OK to try again?`nOtherwise hit ESC
			Gosub NameTryAgain
		}
}
{
Send {F2}
		Sleep 350
FormatTime, Date, %Date%, MM/d/yyyy
SendEvent %Dept% %ChgOut%%Maint%%WkOrder%%wOrder%%Sales% - %Name% - %Date%`n
}
Dept = 
ChgOut = 
Maint = 
WkOrder = 
wOrder = 
Sales = 
Name = 
Date = 
;-----------------------------------------------------------------------------------------------------------------------------------------
{
CommentTryAgain:
If Comment = N/A
	{
	Gui, Show
	Return
	}
SplashTextOn,200,200, Waiting, Click on the body of the note you wish to have your comments entered into.`nPress Enter and make sure that an Carriage Return was accepted by Evernote`nWhen ready, press the Right Control button again.
WinMove, Waiting, , 3109, -498 ;move splash window to the top left corner
KeyWait, RControl, D
	Sleep 250
SplashTextOff
WinWaitActive, AHK_class ENMainFrame,,2 ;will wait 2 secconds for the Evernote window to be activated
	if ErrorLevel
		{
		MsgBox,,, It doesn't appear that the Evernote window was clicked on. Click OK to try again?`nOtherwise hit ESC
			Gosub CommentTryAgain
		}

Send %Comment%
Comment = 

Gui, Show
Return
}

GuiClose:
ExitApp
}
Esc::ExitApp