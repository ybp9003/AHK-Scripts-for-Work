;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

WinActivate ahk_class ENMainFrame
{
	WinWaitActive ahk_class ENMainFrame
}
FileCopy %A_Desktop%\Evernote Templates\NewItem -.enex, %A_Desktop%\
ExitApp

ScrollLock::ExitApp