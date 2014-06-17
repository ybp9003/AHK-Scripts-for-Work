#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;InputBox, desc, EMBOSSED ALUMINUM LETTERS & NUMBERS, 1.5
;InputBox, ldesc, PREMAX, POLE NUMBERS, ALUMINUM
InputBox, symb, Symbol
;InputBox, qty, Quantity
;InputBox, cost, Cost
WinActivate ahk_class SunAwtFrame
	{
	WinWaitActive ahk_class SunAwtFrame
	}
ItemData = 2340PL|{Tab}|{Tab}|P/N UAR15-%symb%, PREMAX, POLE NUMBERS, ALUMINUM|{Tab}|200|{Tab 2}|.3425|{Tab}
Loop, Parse, ItemData, |
	{
	Send %A_LoopField%
	Sleep 250	
	}
Send {Tab 2}
Send x01{Enter 3}

ExitApp

Esc::ExitApp