#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FormatTime,Date,%Date%, M/d/yyyy ;changes the format of the date reported from Gui, MonthCal, vDate from 20080608 to 6/8/2008

FormatTime, CurrentDateTime,, M/d/yyyy h:mm tt  ; Outputs the current date time seconds. It will look like 6/29/2008 10:35 AM
