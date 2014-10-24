#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

FileSelectFile, SelectedFile, 3, E:\AHK Scripts for Work\Manual Execute, AutoHotKey Scripts (*.ahk)
if SelectedFile =
	ExitApp
else
    Run %SelectedFile%
ExitApp