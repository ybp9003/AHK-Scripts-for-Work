;version 1.01 Changed all the "SendEvent"s to "Send"s
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox, The last step of this script will now move the note to the 03.Accounting Notebook
Send ^!t
WinWait ahk_class #32770
		Sleep 250
	Send %A_YYYY%{Space}
		Sleep 1000
	Send Invoice{Space}
		Sleep 1000
	SendEvent TJMoore{Space}
		Sleep 1000
	Send RONumber{Space}{Enter}
	
WinWaitActive AHK_class ENMainFrame
	Send !nv
WinWaitActive Move Note to Notebook
	Send 03{Tab}
		Sleep 250
	Send {Enter}
ExitApp

Scrolllock::ExitApp