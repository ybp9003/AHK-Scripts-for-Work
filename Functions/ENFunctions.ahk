#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
; SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;RETITLES A NOTE IN EVERNOTE. ONLY ONE PARAMETER IS REQUIRED.====================
ENNoteRetitle(Title,KeepText = 0)
	{
	ControlGet,NoteTitleHWND,Hwnd,,ENAutoCompleteEditCtrl2,AHK_class ENMainFrame,,,
	ControlFocus,,AHK_id %NoteTitleHWND%
		Sleep 250
	Send {F2}
		Sleep 250
	If KeepText = 1 ;"EN Gas Receipt.ahk" CHANGES "KeepText" TO 1 SO THAT IT PRESERVES THE EXISTING NOTE TITLE
		{
		Send ^a
			Sleep 250
		Send ^c
			Sleep 250
		StringReplace,newClipboard,Clipboard,`#task ;IF IT DETECTS "#task" IT REMOVES IT
		SendEvent {Raw}%newClipboard%%Title%`n
		Return
		}
	Send ^a
		Sleep 250
	Send {Raw}%Title%
		Sleep 250
	Send ^s
	Return
	}

;CHANGE THE DATE THE NOTE WAS CREATED (not working!)
ENDateCreated(CreatedDate)
	{
	WinActivate AHK_class ENMainFrame
	WinWaitActive AHK_class ENMainFrame
	FormatTime, DateToday,,M/dd/yyyy
		If CreatedDate = %DateToday% ;IF TODAY'S DATE MATCHES THE DATE THE NOTE CREATED DATE VARIABLE
			{
			ToolTip,NO NEED TO CHANGE THE DATE
			Return
			}
	Click,763,158
	Send %CreatedDate%`n
	Return
	}

ENAssignTags()
	{
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
		Sleep 500
	}