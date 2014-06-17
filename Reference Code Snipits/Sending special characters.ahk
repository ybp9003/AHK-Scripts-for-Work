#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

VAR = #HELLO
Send {Raw}%VAR% ;sends exactly "#HELLO"

;another example
WO = 12#345
BI = #5.05
WinActivate Untitled - Notepad
SendInput {Raw}WORK ORDER #%WO%`n
SendInput {Raw}%A_YYYY% BUDGET ITEM #%BI%`n
