#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\

SetTitleMatchMode 2 ;matches partial window titles
;search Evernote for the current entries for this PO
InputBox, PO, Enter the PO Number this email refers to,,,,,,,,,%A_YYYY%
{
Run CMD.exe
	{
	WinWaitActive ahk_class ConsoleWindowClass
	}
SendRaw ENScript showNotes`n
	Sleep 1000
Send `"%PO%`n ;"
	Sleep 500
WinClose AHK_class ConsoleWindowClass
}
;sends the read recept to Evernote
InputBox, POIncrement, Enter the incremental number for this PO history
if ErrorLevel
{
	MsgBox,,, Cancel was pressed, 3
	Return
}
WinActivate ahk_class rctrl_renwnd32 ;bring the Outlook to Focus
{
	WinWaitActive ahk_class rctrl_renwnd32
}
	{
	Send hctcpurchasing.e3a52cc@m.evernote.com{enter}
	Sleep 150
	Send {Tab}
	Sleep 150
	Send {Tab}
	Sleep 150
	Send ^a
	Send %PO%-%POIncrement%{Space}
	Sleep 150
	Send @05.POArchive {#}ReadReceipt {#}%A_YYYY%`n
	Sleep 150
	Send !s
	}
WinActivate Microsoft Outlook
	{
	WinWaitActive Microsoft Outlook
	}
	{
	Send {AppsKey}
	Send m
	}
MsgBox, ,,In 5 secconds this script will resynce Evernote, 5
{
Run C:\Program Files (x86)\Evernote\Evernote\ENScript.exe syncDatabase
}
ExitApp

Scrolllock::ExitApp