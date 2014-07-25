#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\

InputBox, Name,, Enter the name here`n`nDon't worry about capitalization,,,,,,,, %Clipboard%
Clipboard = %Name%
StringUpper Clipboard, Clipboard, T

Send hctcpurchasing.e3a52cc@m.evernote.com{enter}
	Sleep 150
Send {Tab}
	Sleep 150
Send {Tab}
	Sleep 150
Send ^a
	Sleep 150
Send %Clipboard%{Space}
	Sleep 150
Send @06.Receipts {#}FleetCard {#}Fuel {#}Receipt {#}task {#}%A_MM%%A_MMMM% {#}%A_YYYY%
	Sleep 150
Send !s
	Sleep 250
IfWinExist ahk_class bosa_sdm_Mso96 ;this closes the "Spell Check" window if it pops up
	WinClose ahk_class bosa_sdm_Mso96

; WinActivate ahk_class rctrl_renwnd32 ;sends the email to the "Archive" folder in Outlook
; WinWaitActive ahk_class rctrl_renwnd32
; Send {AppsKey}
; Send m

WinActivate ahk_class rctrl_renwnd32
ExitApp

scrolllock::exitapp