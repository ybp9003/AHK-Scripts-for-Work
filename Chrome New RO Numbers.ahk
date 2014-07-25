#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

SetTitleMatchMode 2
StringRight, A_YY, A_YYYY, 2	; get the 2 digit year
InputBox, loopnumber,Number of Loops, How many entries do you need?
InputBox, var1,Where to begin, What is the last three digits of the largest RO number listed?`n`nxx-"xxx"

WinActivate HCTC RO Log
WinWaitActive HCTC RO Log
Loop %loopnumber%
{
var1 := var1 + 1
	If var1 > 99
		{
		Send %a_yy%-%var1%
		Send {Up}
		Sleep 1000
		Continue
		}
Send %a_yy%-0%var1%
Send {Up}
sleep 1000
}
ExitApp

ScrollLock::ExitApp