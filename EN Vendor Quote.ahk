;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:
;use a gui instead of inputbox to capture the quote number and have the quote year as one of the input variable options
;=========================================================================================

#Include E:\AHK Scripts for Work\Functions\ENFunctions.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


InputBox, quote, What is the HCTC Quote number?
WinActivate AHK_class ENMainFrame
	WinWaitActive AHK_class ENMainFrame

QuoteYear = %A_YYYY%
Send ^!t
	Sleep 250
WinWaitActive Assign Tags
Send %A_YYYY%%A_Space%
	Sleep 1200
Send quote%A_Space%
	Sleep 1200

WinWaitActive AHK_class ENMainFrame
NoteTitle = %QuoteYear%x-Quote %quote%
ENNoteRetitle(NoteTitle)
ExitApp

Scrolllock::ExitApp