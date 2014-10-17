;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

ActivateTaskRemarks()
	{
	WinActivate Task Remarks
	WinWaitActive Task Remarks
	Return
	}
ActivateSunAwtFrame()
	{
	WinActivate AHK_class SunAwtFrame
	WinWaitActive AHK_class SunAwtFrame
	Return
	}

Gui, Add, Combobox, x12 y30 vTakenBy, Carolyn Peek||Crystal Franco|Lisa Ottmers|Maria Tisdale|Rose Petmecky|Ginny Garrison
Gui, Add, Radio, x12 y120 w100 h20 +Checked vM505N, Wireless
Gui, Add, Radio, x12 y150 vM405, Single Port
Gui, Add, CheckBox, x12 y180 +Checked vUPS, Shipped via UPS
Gui, Add, Button, x102 y200 w80 h30 Default +Center gOKButton, OK
Gui, Add, Edit, x12 y70 w190 h20 vTracking , %Clipboard%
Gui, Add, Text, x5 y10 w210 h20 +Center, Select from list or enter name: (no spaces)
; Generated using SmartGUI Creator 4.0
Gui, Show, x343 y203 , New GUI Window
Return

OKButton:
Gui, Submit, NoHide
;==========================================================================================================================
StringReplace, tagTakenBy, TakenBy, % " ", , All ;remove spaces (TakenBy is replaced with tagTakenBy)
FormatTime, CurrentDateTime,, MM/d/yyyy ;It will look like 6/29/2008
;==========================================================================================================================
ActivateTaskRemarks()

If UPS = 0
	Send ***JHERRING-->%tagTakenBy%{Space}%CurrentDateTime%***
If UPS = 1
	Send ***JHERRING{Space}%Tracking%{Space}%CurrentDateTime%***

Send +{Home}
	Sleep 500
Send ^c
Send {Tab}
	Sleep 150
Send {Tab}
	Sleep 150
Send {Enter}
	Sleep 500

ActivateSunAwtFrame()

WinMaximize ahk_class SunAwtFrame
		Sleep 1500
	Send !s
		Sleep 1000
Click 1533, 1029 ;clicks the print button
{
WinWaitActive Report Edit Job
	Click 437, 93 ;clicks the "Email" box
WinWaitActive E-Mail Report
	Send {Space} ;clicks the "Attach" box
		Sleep 500
	Send {Tab}
		Sleep 150
	Send {Tab}
		Sleep 150
	Send {Tab}
		Sleep 150
	Send hctcpurchasing.e3a52cc@m.evernote.com
	Send {Tab}
		Sleep 150
	Send {Tab}
		Sleep 150
	Send {Tab}
		Sleep 150
	Send DSL Modem @09.DSLs {#}%a_yyyy% {#}DSLModem {#}ServiceOrder {#}Task {#}%tagTakenBy%
If M505N = 1
	Send {Space}{#}m505n
If M405 = 1
	Send {Space}{#}m405
If UPS = 1
	Send {Space}{#}UPS-	
		Sleep 150
	Send {Tab}
		Sleep 150
	Send Imported from NISC -{Space}

If UPS = 0
	Send {Raw}***JHERRING-->%tagTakenBy% %CurrentDateTime%***
If UPS = 1
	Send ***JHERRING{Space}%Tracking%{Space}%CurrentDateTime%***

		Sleep 250
	Send {Tab}
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

GuiClose:
ExitApp

Scrolllock::ExitApp