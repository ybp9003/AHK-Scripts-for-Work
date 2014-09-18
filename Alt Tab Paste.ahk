;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

	Sleep 500
Clipboard =
SendEvent ^c
ClipWait, 2
Clipboard := Trim(Clipboard) ;REMOVES LEADING AND TRAILING SPACES/TABS/LINE FEEDS
SendEvent !{Tab}
	Sleep 750
IfWinActive AHK_class ENMainFrame
	{
	Send ^+v
	ExitApp
	}
Send ^v
ExitApp

ScrollLock::ExitApp
 