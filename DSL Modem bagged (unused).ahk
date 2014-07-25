#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox, New GUI interface. Watch it closely!

Gui, Add, Combobox, x12 y30 vTakenBy, CAROLYN PEEK|CRYSTAL FRANCO|LISA OTTMERS|MARIA TISDALE|ROSE PETMECKY
Gui, Add, Radio, x12 y100 w100 h20 +Checked vM505N, Wireless (M505N)
Gui, Add, Radio, x12 y130 w100 h20 vM405, Single Port (M405)
; Gui, Add, CheckBox, x12 y160 w110 h20 +Checked vUPS, Shipped via UPS
Gui, Add, Text, x12 y10 w190 h20 +Center, Select from list or enter name:
Gui, Add, Button, x102 y200 w80 h30 gOKButton, OK
; Generated using SmartGUI Creator 4.0
; Gui, Add, Edit, x12 y70 w190 h20 , %Clipboard%
Gui, Show, x343 y203 h253 w220, New GUI Window
Return

OKButton:
Gui, Submit

WinWaitActive Task Remarks
{
	Send ***JHERRING-->%TakenBy%{Space}
	FormatTime, CurrentDateTime,, MM/d/yyyy ;It will look like 6/29/2008 10:35 AM
	SendInput %CurrentDateTime%{Space}***
}
{
	Send +{Home}
		Sleep 500
	Send ^c
	Send {Tab}
		Sleep 150
	Send {Tab}
		Sleep 150
	Send {Enter}
}
WinActivate AHK_class SunAwtFrame
	{
	WinWaitActive AHK_class SunAwtFrame
	}
WinMaximize ahk_class SunAwtFrame
		Sleep 1500
	Send !s
		Sleep 500
	MouseClick, Left, 1533, 988 ;clicks the print button

StringReplace, tagTakenBy, TakenBy, % " ", , All ;remove spaces from the variable

{
WinWaitActive Report Edit Job
	MouseClick, Left, 437, 93 ;clicks the "Email" box
WinWaitActive E-Mail Report
	Send {Space} ;puts a tick in the "Attach" box
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
	Send DSL Modem @09.DSLs {#}%a_yyyy% {#}DSLModem {#}ServiceOrder {#}task {#}%tagTakenBy%
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
	^v
	Sleep 250
	Send {Tab}
	Sleep 150
	Send {Enter}
}
{
WinWaitActive Report Edit Job ;Report Edit Job window
	MouseClick, Left, 390, 182 ;clicks the Template Code dropdown List
	Sleep 250
	MouseClick, Left, 324, 276 ;clicks the "OSPFA - Outside Plant Fictitious Address "option
	Sleep 150
	Send {Enter}
}
WinRestore ahk_class SunAwtFrame

GuiClose:
ExitApp

Scrolllock::ExitApp