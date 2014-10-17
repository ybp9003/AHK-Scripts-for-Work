;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

MsgBox, 4,,Would you like to see the directions for using this script?
IfMsgBox Yes
	{
	Gosub Instructions
	}
BeginAction:
Run C:\Users\jherring\Desktop\Evernote Templates\New Reel.enex
InputBox, ItemNo, Material Item #
InputBox, MatDesc, Material Description,,,,,,,,, BFC 6x22
InputBox, ReelNo, Reel Number
InputBox, Inner, Inner Sequential
InputBox, Outer, Outer Sequential

OldNoteTitle := "Item# - MaterialType - Reel # - Evernote"
NewNoteTitle = %ItemNo% - %MatDesc% - {#}%ReelNo%
MsgBox, ,,Script will continue once the "New Reel" note has been opened up in a separate window., 5
{
WinWaitActive %OldNoteTitle%
}
WinMaximize %OldNoteTitle%
	Sleep 500
Click 50,236 ;clicks on note title
	Sleep 250
Send {F2}
SendEvent %NewNoteTitle%`n
	Sleep 750
Click 50,320 ;clicks on Column 1 Row 2
	Sleep 250
FormatTime, CurrentDateTime,, MM/d/yyyy ;It will look like 6/29/2014

LoopTags = %CurrentDateTime%,{Tab},Cycle Count,{Tab},%Inner%,{Tab},%Outer%
Loop, Parse, LoopTags, `,
	{
	Send %A_LoopField%
		Sleep 250
	}

Send ^s
	Sleep 500
Send !nv
WinWaitActive Move Note to Notebook
	Sleep 250
Send Reels
	Sleep 250
Send {Tab}
		Sleep 250
	Send `n

ExitApp

Instructions:
Instructions =
(
Step 1 - You will need the following information at the ready
	1. Item Number
	2. Description of Material (ie. BFC 6x22)
	3. Inner Sequential
	4. Reel Number
	5. Outer Sequential
	
Step 2 - Once the script has collected this information, it wait for you to go to the default Notebook in Evernote and double click the pre-formatted note. This will open it into a separate window.

Step 3 - Once the script sees this new window open, it will begin the process of entering the information you have input.
Then it will close the note and exit.`nAre you ready!
)
MsgBox, 4,,%Instructions%
IfMsgBox No
	{
	MsgBox, Ok. Exiting script.
	ExitApp
	}
Gosub BeginAction

Scrolllock::ExitApp