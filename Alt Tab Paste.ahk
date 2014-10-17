;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;NOTES:
;DOES NOT PRESERVE THE FORMATTING OF WHAT YOU ARE COPYING AND PASTING
;WRITES THE CLIPBOARD CONTENTS TO A FILE CALLED CLIPBOARD.INI IN THE SCRIPT DIRECTORY

;USAGE:
;PLACE THE MOUSE CURSOR IN THE FIELD THAT THE TEXT WILL BE PASTED
;PRESS #Z
;HIGHLIGHT THE TEXT YOU WISH TO COPY
;PRESS RCONTROL

IfExist,Alt Tab Paste.txt
FileDelete,Alt Tab Paste.txt

MouseGetPos,mouseX,mouseY,WindowID
ToolTip,Highlight the text`nthen press RControl
KeyWait,RControl,D
ToolTip
	Sleep 250
Clipboard =
SendEvent ^c
ClipWait, 2
CopiedText := Trim(Clipboard) ;REMOVES LEADING AND TRAILING SPACES/TABS/LINE FEEDS
FileAppend,%CopiedText%,Alt Tab Paste.txt

WinActivate AHK_id %WindowID%
	WinWaitActive AHK_id %WindowID%

Click,%mouseX%,%mouseY%

FileRead,CopiedText,Alt Tab Paste.txt
Send %CopiedText%

ExitApp
ScrollLock::ExitApp
 