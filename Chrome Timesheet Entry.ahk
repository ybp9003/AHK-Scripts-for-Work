#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Edit, x122 y100 w100 h30 vhoursworked , 8
Gui, Add, Edit, x122 y130 w100 h30 vprovisioning , 0
Gui, Add, Edit, x122 y160 w100 h30 vdsl , 0
Gui, Add, Edit, x122 y190 w100 h30 vaccounting , 0
Gui, Add, Button, x122 y230 w100 h30 gButton , Submit
Gui, Add, Text, x22 y100 w100 h30 , Hours worked today
Gui, Add, Text, x22 y130 w100 h30 , Provisioning
Gui, Add, Text, x22 y160 w100 h30 , DSL
Gui, Add, Text, x22 y190 w100 h30 , Accounting
Gui, Add, Text, x77 y10 w120 h20 , TimeSheet data auto fill
Gui, Add, Text, x12 y30 w240 h40 , NOTE: Place the cursor where you want the script to start entering data into the timesheet
; Generated using SmartGUI Creator 4.0
Gui, Show, x1317 y4 h289 w260, New GUI Window
Return

Button:
Gui, Submit

SetTitleMatchMode 2
hours := hoursworked - provisioning - dsl - accounting ;calculate remaining hours to hit the hoursworked target

;rounds the result to two decimals
; Round(provisioning, 2)
; Round(dsl, 2)
; Round(accounting, 2)
; Round(hours, 2) 

WinActivate Employee Self Serve - Google Chrome
tags = %provisioning%|%dsl%|%accounting%|%hours%

Loop,Parse,tags,`|
	{
	Send %A_LoopField%
	Send {Tab 14}
	}

GuiClose:
ExitApp


Esc::ExitApp
