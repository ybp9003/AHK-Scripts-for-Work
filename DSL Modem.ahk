;WRITTEN FOR AUTOHOTKEY BY JOE HERRING JOE.FISHERMAN@GMAIL.COM
;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#Include E:\AHK Scripts for Work\Functions\SplashText.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;==========================================================================================================================
MsgBox ALERT!`n`nNEW PROCESS TO CHARGE OUT THE MODEM HAS BEEN CODED`nBUT IS UNTESTED!`n`nWATCH IT CLOSELY!`n`nTHE BAGGED DSL PROCESS IS BROKEN. IT SENDS THE CLIPBOARD TO THE CHARGEOUT SCREEN INSTEAD OF THE PERSON THE MODEM WENT TO.
;==========================================================================================================================
ActivateTaskRemarks()
	{
		WinActivate Task Remarks
		WinWaitActive Task Remarks
		Return
	}
ActivateSISWindow()
	{
		WinActivate 46575app 46575 - Hill Country Telephone SIS Customer Care 
		WinWaitActive 46575app 46575 - Hill Country Telephone SIS Customer Care 
		Return
	}

ActivateABSWindow()
	{
		WinActivate 46575app 46575 - Hill Country Telephone ABS 
		WinWaitActive 46575app 46575 - Hill Country Telephone ABS 
		Return
	}
;==========================================================================================================================
Gui, Add, Text, , Select from list or enter name: (no spaces)
Gui, Add, Combobox, vTakenBy, Carolyn Peek||Crystal Franco|Lisa Ottmers|Maria Tisdale|Rose Petmecky|Ginny Garrison
Gui, Add, Text, ,Tracking Number
Gui, Add, Edit, w190 h20 vTracking , %Clipboard%
Gui, Add, Text, , Service Order #
Gui, Add, Edit, vSONumber, 
Gui, Add, Radio, w100 h20 +Checked vM505N, Wireless
Gui, Add, Radio, vM405, Single Port
Gui, Add, CheckBox, +Checked vUPS, Shipped via UPS
Gui, Add, Button, w80 h30 Default gOKButton, OK
Gui, Show, x343 y203 , New GUI Window
Return

OKButton:
Gui, Submit, NoHide
;==========================================================================================================================
StringReplace, tagTakenBy, TakenBy, % " ", , All ;remove spaces (TakenBy is replaced with tagTakenBy)
FormatTime, CurrentDate,, MM/d/yyyy ;It will look like 6/29/2008
;==========================================================================================================================
ActivateTaskRemarks()

If UPS = 0
	Send ***JHERRING-->%tagTakenBy%%A_Space%%CurrentDate%***
If UPS = 1
	Send ***JHERRING%A_Space%%Tracking%%A_Space%%CurrentDate%***

Send +{Home}
	Sleep 500
Send ^c
Send %A_Tab%
	Sleep 150
Send %A_Tab%
	Sleep 150
Send {Enter}
	Sleep 500

ActivateSISWindow()

WinMaximize ahk_class SunAwtFrame
		Sleep 1500
	Send !s
		Sleep 1000
Click 1533, 1029 ;clicks the print button
{
WinWaitActive Report Edit Job
	Click 437, 93 ;clicks the "Email" box
WinWaitActive E-Mail Report
	Send %A_Space% ;clicks the "Attach" box
		Sleep 500
	Send %A_Tab%
		Sleep 150
	Send %A_Tab%
		Sleep 150
	Send %A_Tab%
		Sleep 150
	Send hctcpurchasing.e3a52cc@m.evernote.com
	Send %A_Tab%
		Sleep 150
	Send %A_Tab%
		Sleep 150
	Send %A_Tab%
		Sleep 150
	Send DSL Modem @09.DSLs {#}%a_yyyy% {#}DSLModem {#}ServiceOrder {#}Task {#}%tagTakenBy%
If M505N = 1
	Send %A_Space%{#}m505n
If M405 = 1
	Send %A_Space%{#}m405
If UPS = 1
	Send %A_Space%{#}UPS-	
		Sleep 150
	Send %A_Tab%
		Sleep 150
	Send Imported from NISC -%A_Space%

If UPS = 0
	Send {Raw}***JHERRING-->%tagTakenBy% %CurrentDate%***
If UPS = 1
	Send ***JHERRING%A_Space%%Tracking%%A_Space%%CurrentDate%***

		Sleep 250
	Send %A_Tab%
		Sleep 150
	Send {Enter}
}
{
WinWaitActive Report Edit Job ;Report Edit Job window
	Click 390, 182 ;clicks the Template Code dropdown List
		Sleep 250
	Click 324, 276 ;clicks the "OSPFA - Outside Plant Fictitious Address" option
		Sleep 150
	Send {Enter}
}
WinWaitActive Complete Service Order Print Report
WinClose Complete Service Order Print Report
WinRestore ahk_class SunAwtFrame
;===========================================================================================================
SplashTextFunc(5,5,200,100,"Charge Out Modem","Open the ""Charge"" module in ABS`nthen press RControl")
KeyWait,RControl,D
	Sleep 250
ActivateABSWindow()
WinMove,46575app 46575 - Hill Country Telephone ABS,,,,1465,974 ;KEEPS THE WINDOW AT THE SAME SIZE SO THE BUTTENS ARE IN THE SAME PLACE
;===========================================================================================================
IfEqual,M505N,1
	DSLModem = DSL7530
IfEqual,M405,1
	DSLModem = DSL7490
Click,363,934 ;CLICKS THE "ADD" BUTTON
	Sleep 250
;===========================================================================================================
Steps = %DSLModem%|%A_Tab%|1.|%A_Tab%|x02|%A_Tab%|%A_Tab%|6512.003|%A_Tab%|SO#%SONumber%|%A_Space%|%Tracking%|%A_Tab%|%CurrentDate%|Click 390, 182
Loop, Parse, Steps, |
	{
		Send {Raw}%A_LoopField%
			Sleep 250
	}
;===========================================================================================================
GuiClose:
ExitApp

Scrolllock::ExitApp