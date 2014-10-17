;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:
;
;=========================================================================================
#SingleInstance
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%

;=========================================================================================
;THIS SCRIPT WILL PARSE A TWO COLUMN CSV FILE. (ITEM#,DESCRIPTION)
;FIRST IT WILL DO A SEARCH FOR THE ITEM NUMBER AND CHANGE THE DESCRIPTION ON THE "ITEM" TAB.
;SECOND UNDER THE "PO INFO" TAB, IT WILL CHECK TO SEE IF THERE IS A GL LINE PRESENT. IF NOT IT WILL ADD ONE AND INPUT THE GL CODE CURRENTLY LISTED ON LINE 49. IT WILL ALSO PUT THE ITEM DESCRIPTION INTO THE REFERENCE FIELD (CURRENTLY DOESN'T SUPPORT ANYTHING EXCEPT "0.0.")
;IF THE GL LINE IS PRESENT, IT WILL CHANGE THE REFERENCE FIELD TO MATCH THE ITEM DESCRIPTION
;=========================================================================================

Loop, read, %A_Desktop%\PRINTER CARTRIDGES.csv
{
	Loop, parse, A_LoopReadLine, CSV
	{
	Clipboard = 
	IfEqual,A_Index,1 ; 1 = THE ITEM NUMBER, 2 = ITEM DESCRIPTION
		{
		; MsgBox %A_LoopField%
		WinActivate ahk_class SunAwtFrame
			WinWaitActive ahk_class SunAwtFrame
		Click,256,149 ;CLICKS THE "ITEM" TAB
			Sleep 250
		Click,509,90,2 ;DOUBLE CLICKS THE "ITEM NUMBER" FIELD
			Sleep 250
		Send %A_LoopField%
			Sleep 250
		Click,1295,93 ;CLICKS "SEARCH"
		Continue
		}
	Else
		StringUpper,DESCRIPTION,A_LoopField
		Clipboard = %DESCRIPTION%
		ClipWait,2
		; MsgBox %DESCRIPTION%
		Click,576,207,2 ;DOUBLE CLICKS THE DESCRIPTION FIELD
		Send %DESCRIPTION%
			Sleep 250
		Send %A_Tab%
			Sleep 250
		Click,259,937 ;CLICKS SAVE
			Sleep 750
		Click,353,150 ;CLICKS ON THE "PO INFO" TAB
			Sleep 250
		ToolTip,press RControl to continue
				KeyWait, RControl, D
				ToolTip
			Sleep 250
		Click,1298,95 ;CLICKS THE SEARCH BUTTON
			Sleep 500
	PixelGetColor,GLLinePresent,663,369,Alt
		IfEqual,GLLinePresent,0xFFFFFF ;IF THERE IS A WHITE PIXEL AT THE ABOVE COORDINATES
				{
				MsgBox No GL Line detected
				Send !w
					Sleep 250
				Click,403,368,2 ;CLICKS ON THE GL FIELD
					Sleep 250
				Send 6123.003
					Sleep 250
				Click,823,368,2 ;DOUBLE CLICKS THE REFERENCE FIELD
					Sleep 250
				Send %DESCRIPTION%%A_Tab%
					Sleep 250
				Click,963,368,2 ;CLICKS ON THE PERCENTAGE FIELD
				Send 100.
					Sleep 250
				Click,259,937 ;CLICKS SAVE
				ToolTip,press RControl to continue
					KeyWait, RControl, D
				ToolTip
					Sleep 250
				Continue
				}
		Else
				Click,823,368,2 ;DOUBLE CLICKS THE REFERENCE FIELD
					Sleep 250
				Send %DESCRIPTION%%A_Tab%
				Click,259,937 ;CLICKS SAVE
				ToolTip,press RControl to continue
					KeyWait, RControl, D
				ToolTip
					Sleep 250
	}
}
ExitApp
ScrollLock::ExitApp
