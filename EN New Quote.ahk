#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2
IfWinExist PDF-XChange Editor
	{
	InputBox, QuoteNumber, What is the quote number?
	WinActivate PDF-XChange Editor
		{
		WinWaitActive PDF-XChange Editor
		}
		Sleep 450
	SendEvent ^+s
	WinWaitActive Save File As
	Send %A_Desktop%\Quote %QuoteNumber%
	Send {Enter}
		Sleep 250
	MsgBox, 4,,Close PDF Exchange?
	IfMsgBox Yes
		WinClose PDF-XChange Editor
	}

Run C:\Users\jherring\Desktop\Evernote Templates\Quote Template.enex
Run C:\Users\jherring\Desktop\Evernote Templates\Quote Template.oft
ExitApp

Esc::ExitApp