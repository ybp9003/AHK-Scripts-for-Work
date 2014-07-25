#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Display in real time the active window's control list:
#Persistent
SetTimer, WatchActiveWindow, 200
return
WatchActiveWindow:
WinGet, ControlList, ControlList, A
ToolTip, %ControlList%
return

ScrollLock::ExitApp