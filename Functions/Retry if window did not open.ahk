#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; a = name of window opening

WinWaitOpen(a)
	{
	NumberofAttempts = 1
	StartOver:
	WinWaitActive %a%,,2
		If ErrorLevel
		{
			If NumberofAttempts = 4
				MsgBox, Four attempts to open the "%a%" dialog have failed.`n`nOpen the window manually, then press OK.
		Else
			NumberofAttempts += 1
			Gosub StartOver
		}
	Else
	Return
	}
