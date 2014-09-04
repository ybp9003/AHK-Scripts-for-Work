#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Display in real time the active window's control list:
#Persistent
; SetTimer, WatchActiveWindow, 200
; return
; WatchActiveWindow:
; WinGet, ControlList, ControlList, A
; ToolTip, %ControlList%
; return


; MouseGetPos, xpos, ypos 
; Msgbox, The cursor is at X%xpos% Y%ypos%. 

; This example allows you to move the mouse around to see
; the title of the window currently under the cursor:
#Persistent
SetTimer, WatchCursor, 100
return

WatchCursor:
MouseGetPos, , , id, control
WinGetTitle, title, ahk_id %id%
WinGetClass, class, ahk_id %id%
ToolTip, ahk_id %id%`nahk_class %class%`n%title%`nControl: %control%
return

ScrollLock::ExitApp