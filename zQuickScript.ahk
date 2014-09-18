;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%
#SingleInstance

Clipboard := "       2 DOOR  CONTROLLER  "
Clipboard := Trim(Clipboard)
ExitApp
ScrollLock::ExitApp
