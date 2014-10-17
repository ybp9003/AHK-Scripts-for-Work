;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir C:\Program Files (x86)\Evernote\Evernote\

InputBox, Name,, Enter the name here`n`nDon't worry about capitalization,,,,,,,, %Clipboard%
StringUpper Name, Name, T
IfEqual,Name,8303292132@mms.att.net
	Name = Chris Lindemann
Send hctcpurchasing.e3a52cc@m.evernote.com{enter}
	Sleep 150
Send {Tab}
	Sleep 150
Send {Tab}
	Sleep 150
Send ^a
	Sleep 150
Send %Name% @06.Receipts {#}FleetCard {#}Fuel {#}Receipt {#}Task {#}%A_MM%%A_MMMM% {#}%A_YYYY%
	Sleep 150
Send !s
	Sleep 250
IfWinExist ahk_class bosa_sdm_Mso96
	WinClose ahk_class bosa_sdm_Mso96 ;THIS CLOSES THE "SPELL CHECK" WINDOW IF IT POPS UP

ExitApp
scrolllock::exitapp
