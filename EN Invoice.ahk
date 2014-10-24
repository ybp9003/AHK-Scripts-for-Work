;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================
#Include E:\AHK Scripts for Work\Functions\ENFunctions.ahk
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Gui, Add, Text, x12 y10 , MM/DD of the invoice
Gui, Add, Text, x12 y30 , PO/RO Number
Gui, Add, Edit, x142 y10 w100 h20 vdate , mm/dd
Gui, Add, Edit, x242 y30 w70 h20 vPOLastthree, xxx
Gui, Add, Edit, x142 y30 w100 h20 vPOYear , %A_YYYY%
Gui, Add, Edit, x242 y10 w70 h20 vInvYear , %A_YYYY%
Gui, Add, Button, x102 y70 w100 h30 Default gButtonOK , OK
; Generated using SmartGUI Creator 4.0
Gui, Show, x127 y87 , Invoice Processing
Return

ButtonOK:
Gui, Submit

POTag = PurchaseOrder
;GIVES THE VARIABLE THE YEAR IN TWO DIGITS
FormatTime, TwoDigitYear,,y
IfEqual,POYear,%TwoDigitYear%- ;IF POYear IS TWO DIGITS AND A DASH, THEN THIS IS AN INVOICE FOR AN RO NUMBER AND THE POTAG IS CHANGED FROM PURCHASEORDER TO RONUMBER
	POTag = RONumber
WinActivate AHK_class ENMainFrame
	WinWaitActive AHK_class ENMainFrame

ENAssignTags()
WinWaitActive ahk_class #32770
	Send %InvYear%%A_Space%
		Sleep 1000
	Send Invoice%A_Space%
		Sleep 1000
	Send %POTag%%A_Space%

WinWaitActive AHK_class ENMainFrame
If POYear = 
	Gosub CreatedDate
NoteTitle = %POYear%%POLastthree%-Inv
ENNoteRetitle(NoteTitle)

CreatedDate:
If InvYear != %A_YYYY% ;THIS IF STATEMENT WILL BECOME EFFECTIVE WHEN THE INVOICE YEAR DOESN'T MATCH THE CURRENT YEAR
	Date = %Date%/%InvYear%
ENDateCreated(Date)
Gui, Show
Exit

GuiClose:
ExitApp

Scrolllock::ExitApp