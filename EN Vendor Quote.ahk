#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


InputBox, quote, What is the HCTC Quote number?
WinActivate AHK_class ENMainFrame
	{
	WinWaitActive AHK_class ENMainFrame
	}
Send ^!t
	Sleep 250
WinWaitActive ahk_class #32770
	{
	Send %A_YYYY%{Space}
		Sleep 1200
	Send quote{Space}
		Sleep 1200
	}
WinWaitActive AHK_class ENMainFrame
	{
	MouseClick,Left,822,240 ;click on note title
	Send {F2}
	Sleep 1000
	Send %A_YYYY%x-Quote %quote%`n
	Sleep 1000
	}
ExitApp

Esc::ExitApp