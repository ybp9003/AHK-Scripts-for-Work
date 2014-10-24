;=============================================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:


;=============================================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;FileCopy %A_Desktop%\Evernote Templates\Quote Template.enex, %A_Desktop%\Quote Template.TXT

Gui, Add, Text, , Quote Number
Gui, Add, Text, , Hour Due
Gui, Add, Edit, ym vQuoteNumber ,
Gui, Add, Edit, vvarDueTime , 
Gui, Add, DateTime, vDuedate, LongDate
Gui, Add, Button, Default gSubmit , OK
Gui, Show, x200 y350 , Create a New Quote
Return

Submit:
Gui, Submit
FormatTime,varDueDate,M/d/yyyy,LongDate
varNoteTitle = MASTER QUOTE %QuoteNumber%
varDueDateTime = %varDueDate% %varDueTime%PM
;=============================================================================================================
SetTitleMatchMode 2
IfWinExist PDF-XChange Editor
	; InputBox, QuoteNumber, What is the quote number?
	WinActivate PDF-XChange Editor
		WinWaitActive PDF-XChange Editor
			Sleep 450
	SendEvent ^+s
	WinWaitActive Save File As
	Send %A_Desktop%\Quote %QuoteNumber%
	Send {Enter}
		Sleep 250
	MsgBox, 4,,Close PDF Exchange?
	IfMsgBox Yes
		WinClose PDF-XChange Editor
;=============================================================================================================
;THIS IS WHAT THE FILE CREATED ON THE DESKTOP SHOULD CONTAIN
FileAppend, 
(
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-export SYSTEM "http://xml.evernote.com/pub/evernote-export2.dtd">
<en-export export-date="20140407T183811Z" application="Evernote/Windows" version="5.x">
<note><title>%varNoteTitle%</title><content><![CDATA[<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE en-note SYSTEM "http://xml.evernote.com/pub/enml2.dtd">

<en-note style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;"><div><div style="text-align: left;"><i style="color: rgb(168, 168, 168); font-size: 11px;">Winning Bid shown here: $</i></div><hr/></div><div>Status:&nbsp;<font color="#328712">Out for Bids</font></div><div>Due by: %varDueDateTime% &nbsp;</div><div><hr/></div><div><br/></div></en-note>]]></content><created>20140407T183704Z</created><tag>Quote</tag><tag>%A_YYYY%</tag><tag>MasterQuote</tag><tag>TempShare</tag></note></en-export>
),%A_Desktop%\NewQuotes\NewQuote.enex
;=============================================================================================================
GuiClose:
ExitApp

Scrolllock::ExitApp
