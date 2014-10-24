;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:
;
;=========================================================================================
#Include E:\AHK Scripts for Work\Functions\ENFunctions.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Generated using SmartGUI Creator 4.0
;Gui, Add, Text, w200 h40 , When submitted`, this script will apply the information entered into the current active note in the Evernote Main Window
Gui, Add, Text, , RO Number
Gui, Add, Text, , Amount Spent
Gui, Add, Text, , Company Name
Gui, Add, Text, , Purchase Date
Gui, Add, Edit, w50 ym vRONumber , None
Gui, Add, Edit, h20 vspent,
Gui, Add, Edit, w160 h20 vCpny,
Gui, Add, Edit, h20 vDate,
Gui, Add, Button, w70 h20 Default gSubmit , Submit
Gui, Show, , New GUI Window
Return

Submit:
Gui, Submit
;==========================================================================================================

	StringReplace, tagCpny, Cpny, % " ", , All ;remove spaces
	StringMid, tagCpny, tagCpny, 10, 50, L ;remove all but the first ten characters (don't know what will happen if the string goes over 50 characters)
	StringUpper Cpny, Cpny, T ;changes the Cpny variable to Title Case
;==========================================================================================================
	
WinActivate ahk_class ENMainFrame
WinWaitActive ahk_class ENMainFrame

NoteTitle = %Cpny% receipt $%spent%
ENNoteRetitle(NoteTitle)

ENDateCreated(Date)

WinActivate AHK_class ENMainFrame
;==========================================================================================================
ENAssignTags()
Tags = %A_YYYY%{Space}|%A_MM%%A_MMMM%{Space}|Receipt{Space}|CreditCardnoPO{Space}|%tagCpny%{Space}
Loop, Parse, Tags, |
	{
			Send %A_LoopField%
		Sleep 1200
	}
IfNotEqual,RONumber,None
	{
		Send %RONumber%%A_Space%
			Sleep 1200
	}
	
WinWaitActive AHK_class ENMainFrame

ENMoveToNotebook(03)

Gui, Show
Return

GuiClose:
ExitApp

Scrolllock::ExitApp