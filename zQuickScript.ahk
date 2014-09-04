;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%
#SingleInstance

If UMDelay = 750
SetFormat, float, 0.0
SetBatchLines, 10ms 
SetTitleMatchMode, 2

KeyWait, LButton, U
ToolTip, Locked
KeyWait, LButton, D
Return

ScrollLock::ExitApp
