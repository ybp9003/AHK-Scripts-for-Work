;Version 1.10 Having trouble at the end when it asks me if I have another receipt to enter. The GUI appears, then disappears without a trace. (Possible fix) Added curlies for the final message box since there is now more than one command to execute before going back to the beginning

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


; Generated using SmartGUI Creator 4.0
Gui, Add, Edit, x12 y60 w100 h20 vspent, $$Spent
Gui, Add, Edit, x12 y90 w160 h20 vCpny, Company Name
Gui, Add, Edit, x12 y120 w100 h20 vDate, Purchase Day (##)
;Gui, Add, Checkbox, 
Gui, Add, Button, x12 y150 w70 h20 gSubmit , Submit
Gui, Add, Text, x12 y10 w200 h40 , When submitted`, this script will apply the information entered into the current active note in the Evernote Main Window
Gui, Show, x127 y87 h195 w235, New GUI Window
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
MouseClick, Left, 757, 155 ;click on date field
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
Send %tagCpny% ;doesn't hit enter here just in case there is another tag to enter or create
WinWaitActive AHK_class ENMainFrame
	Send !nv
WinWaitActive Move Note to Notebook
	Send 03{Tab}
		Sleep 250
	Send {Enter}

Gui, Show
Return

GuiClose:
ExitApp

Esc::ExitApp