;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:
;
;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Generated using SmartGUI Creator 4.0
;Gui, Add, Text, w200 h40 , When submitted`, this script will apply the information entered into the current active note in the Evernote Main Window
Gui, Add, Text, , RO Number
Gui, Add, Text, , Amount Spent
Gui, Add, Text, , Company Name
Gui, Add, Text, , Purchase Date
Gui, Add, Edit, w50 ym vRONumber , N/A
Gui, Add, Edit, h20 vspent,
Gui, Add, Edit, w160 h20 vCpny,
Gui, Add, Edit, h20 vDate,
Gui, Add, Button, w70 h20 Default gSubmit , Submit
Gui, Show, , New GUI Window
Return

Submit:
Gui, Submit

	StringReplace, tagCpny, Cpny, % " ", , All ;remove spaces
	StringMid, tagCpny, tagCpny, 10, 50, L ;remove all but the first ten characters (don't know what will happen if the string goes over 50 characters)
	StringUpper Cpny, Cpny, T ;changes the Cpny variable to Title Case
	
WinActivate ahk_class ENMainFrame
WinWaitActive ahk_class ENMainFrame

MouseClick,Left,710,240 ;click on note title
Send {F2}
	Sleep 1000
Send %Cpny%{Space}receipt{Space}$%spent%
	Sleep 1000
Click,700,155 ;click on date field
	Sleep 1500
Send %Date%`n
	Sleep 1700

WinActivate AHK_class ENMainFrame
NumberofAttempts = 1
StartTagging:
Send ^!t
WinWaitActive Assign Tags,,2
If ErrorLevel
	{
	If NumberofAttempts = 4
		MsgBox, Four attempts to open the "Assign Tags" window have failed.`n`nOpen the window manually (CTRL ALT T) then press OK.
	Else
		NumberofAttempts += 1
		Gosub StartTagging
	}
Else
	Sleep 350
Tags = %A_YYYY%{Space}|%A_MM%%A_MMMM%{Space}|Receipt{Space}|CreditCardnoPO{Space}
Loop, Parse, Tags, |
	{
	Send %A_LoopField%
		Sleep 1200
	}
If Not RONumber = N/A
	{
	Send %RONumer%%A_Space%
	Sleep 1200
	}
Send %tagCpny% ;doesn't hit enter here just in case there is another tag to enter or create
WinWaitActive AHK_class ENMainFrame
Click,673,126
Send 03

Gui, Show
Return

GuiClose:
ExitApp

Scrolllock::ExitApp