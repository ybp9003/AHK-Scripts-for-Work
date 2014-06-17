; version 1.01 moved EscApp to the top of the script
; version 1.01 moved EscApp to the top of the script
; version 1.02 1.01 seemed to have broken the global variables CurrentYear and CurrentMonth so I have moved it back to the Bottom
; version 1.03 Experimenting with the idea of having all of the keyboard commands at the top of the script for easy reference and then using a GoSub command to actually execute the desired script. First test is the COEReq command
; version 1.04 The COEReq command worked flawlessly. I am going to begin migrating all of the script commands to the top of this script.(to make it easy to visually find them) Month and Year are now properly being entered in the Gas command again.
;version 1.05 Under ",gas" If the correct name had not been copied to the clipboard, I added an Inputbox to collect that informatoin into a variable that was then transferred to the clipboard.
;version 1.06 capturing requisition title for requisitions. Starting with COE Reqs first for testing purposes
;version 1.1 moved most commands to their individual script fills and call them based on the original keyboard command from this script

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.


;_____________________________________________________________________________________
;WINDOW TRANSPARENCY
;Hold window key and scroll mouse up or down
;Win-O to reset transparency of the active window
; changing window transparencies
#WheelUp::  ; Increments transparency up by 3.375% (with wrap-around)
    DetectHiddenWindows, on
    WinGet, curtrans, Transparent, A
    if ! curtrans
        curtrans = 255
    newtrans := curtrans + 8
    if newtrans > 0
    {
        WinSet, Transparent, %newtrans%, A
    }
    else
    {
        WinSet, Transparent, OFF, A
        WinSet, Transparent, 255, A
    }
return


#WheelDown::  ; Increments transparency down by 3.375% (with wrap-around)
    DetectHiddenWindows, on
    WinGet, curtrans, Transparent, A
    if ! curtrans
        curtrans = 255
    newtrans := curtrans - 8
    if newtrans > 0
    {
        WinSet, Transparent, %newtrans%, A
    }
    ;else
    ;{
    ;    WinSet, Transparent, 255, A
    ;    WinSet, Transparent, OFF, A
    ;}
return

#o::  ; Reset Transparency Settings
    WinSet, Transparent, 255, A
    WinSet, Transparent, OFF, A
return

#g::  ; Press Win+G to show the current settings of the window under the mouse.
    MouseGetPos,,, MouseWin
    WinGet, Transparent, Transparent, ahk_id %MouseWin%
    ToolTip Translucency:`t%Transparent%`n
	Sleep 2000
	ToolTip
return

;_____________________________________________________________________________________
^+4::
Run E:\AHK Scripts for Work\40 percent markup.ahk
Return
;_____________________________________________________________________________________
#IfWinActive Employee Self Serve - Google Chrome
:*:Time::
Run E:\AHK Scripts for Work\Chrome Timesheet Entry.ahk
Return
#IfWinActive

;_____________________________________________________________________________________
#IfWinActive ahk_class Progman
:*:,go::
Run E:\AHK Scripts for Work\NISC ABS SIS.ahk
Return
#IfWinActive

;_____________________________________________________________________________________
:*:PN::P/N{space}
:*:ofs::OUT FOR SIGNATURES
:*:pcc::PURCHASED WITH CREDIT CARD
:*:,hil::Hill Country Telephone Coop
:*:,pur::purchasing@hctc.coop
:*:,pas::Hctc.367
:*:,jh::jherring@hctc.coop
:?*:,JMARK::jmarkwordt@hctc.coop
:?*:,JWALLY::jwally@hctc.coop
:?*:,DMOLD::dmoldenhauer@hctc.coop
:?*:,hc::@hctc.coop ;the question mark makes it possible to have text directly precede the hotstring

;_____________________________________________________________________________________
#IfWinActive ahk_class XLMAIN
;when the "Vehicle Report" is open it will automatically enter the # and then close the "Find and Replace" window after doing a search
^q::
Run E:\AHK Scripts for Work\Excel Search for Vehicle Number.ahk
Return
#IfWinActive

;_____________________________________________________________________________________
#z::
Run E:\AHK Scripts for Work\Alt Tab Paste.ahk
Return

;_____________________________________________________________________________________
#IfWinActive HCTC RO Log - Google Chrome
#\::
Run E:\AHK Scripts for Work\Chrome New RO Numbers.ahk
Return
#IfWinActive

;_____________________________________________________________________________________
#IfWinActive Task Remarks
:*:*1Z::
Run E:\AHK Scripts for Work\DSL Modem.ahk
Return

#IfWinActive

;_____________________________________________________________________________________
:?*:posig:: ;Opens the "HelloSign" script
Run E:\AHK Scripts for Work\HelloSign.ahk
Return

;_____________________________________________________________________________________
^+~::
Run E:\AHK Scripts for Work\zQuickScript.ahk
Return

;_____________________________________________________________________________________
^!n::
IfWinExist ahk_class Notepad++
	WinActivate
else
	Run Notepad++.exe, E:\NotePad++ Portable
IfWinExist AutoHotKey Scripts
	Return
else
	Run E:\AHK Scripts for Work
return

;_____________________________________________________________________________________
:?*:dts:: ;auto enter Date and Time
FormatTime, CurrentDateTime,, M/d/yyyy h:mm tt  ; It will look like 6/29/2008 10:35 AM
SendInput %CurrentDateTime%
return

;_____________________________________________________________________________________
:*:,th:: ;email signature
; Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\Outlook Email Signature.ahk
Return

;_____________________________________________________________________________________
^+z:: ;copies the selected text to clipboard and does a global search in Evernote
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN F6 Search.ahk
Return

;_____________________________________________________________________________________
^u:: ; Convert text to UPPERCASE
 Clipboard = ;empties the clipboard
 Send ^c
 ClipWait, 2
 StringUpper Clipboard, Clipboard
 Send {Raw}%Clipboard%
RETURN

;_____________________________________________________________________________________
^l:: ; Convert text to lowercase
 Clipboard = ;empties the clipboard
 Send ^c
 ClipWait, 2
 StringLower Clipboard, Clipboard
 Send {Raw}%Clipboard%
RETURN

;_____________________________________________________________________________________
^+u:: ; capitalizes first letter of each word
 Clipboard = ;empties the clipboard
 Send ^c
 ClipWait, 2
 StringUpper Clipboard, Clipboard, T
 Send {Raw}%Clipboard%
RETURN

;_____________________________________________________________________________________
:*:/NewQUOTE::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN New Quote.ahk
Return

;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#IfWinActive ahk_class SunAwtDialog ;|||||||BEGIN WINDOW SENSATIVE COMMANDS "PO MESSAGE SCREEN"||||||||
;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

;_____________________________________________________________________________________
:*:init/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message Initiator.ahk
Return

;_____________________________________________________________________________________
:*:SS/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message Shane Schmidt.ahk
Return

;_____________________________________________________________________________________
:*:ifix/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message Ifix.ahk
Return

;_____________________________________________________________________________________
:*:COE/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message COE.ahk
Return

;_____________________________________________________________________________________
:*:BD/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message Kerry Sutton.ahk
Return

;_____________________________________________________________________________________
:*:OSP/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message OSP.ahk
Return

;_____________________________________________________________________________________
:*:DM/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message DM.AHK
Return

;_____________________________________________________________________________________
:*:SC/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message Steve Copp.AHK
Return

;_____________________________________________________________________________________
:*:R2/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message R2.AHK
Return

;_____________________________________________________________________________________
:*:IP/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message IP.AHK
Return

;_____________________________________________________________________________________
:*:ADMIN/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message ADMIN.AHK
Return

;_____________________________________________________________________________________
:*:ACCT/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message Accounting.AHK
Return

;_____________________________________________________________________________________
:*:SECA/::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Message SECA.AHK
Return

;======================================================================================================
#IfWinActive ;=============END WINDOW SENSATIVE COMMANDS "PO MESSAGE SCREEN"===========================
;======================================================================================================
;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#IfWinActive AHK_class ENMainFrame ;|||BEGIN WINDOW SENSATIVE COMMANDS "ENMainFrame"|||||||||||||||||||
;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||

;_____________________________________________________________________________________
:*:/tagfleet::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN Fleet Card Docs Tags.ahk
Return

;_____________________________________________________________________________________
:*:/veh::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN Billys Reports.ahk
Return

;_____________________________________________________________________________________
:*:/enPO::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN PO.ahk
Return

;_____________________________________________________________________________________
:*:/ENCredit:: ;Process Credit Card recipts with no PO in Evernote
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN Credit Card No PO.ahk
Return

;_____________________________________________________________________________________
:*:/ENqt::
;Run S:\Joe\AutoHotKey Scripts\EN Quote.ahk
Run E:\AHK Scripts for Work\EN Vendor Quote.ahk
Return

;_____________________________________________________________________________________
:*:/uni::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN Unifirst.ahk
Return

;_____________________________________________________________________________________
:*:\t:: ;AutoInsert "Tag:" into Evernote search bar
	Send tag{:}
Return

;_____________________________________________________________________________________
:*:frs2:: ;Fuel Receipt Stage 2 in Evernote
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN Gas Receipt.ahk
Return

;_____________________________________________________________________________________
:*:/TJinv::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN TJ Moore Invoice.ahk
Return

;_____________________________________________________________________________________
:*:/HCEinv::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN Hill Country Electric Invoice.ahk
Return

;_____________________________________________________________________________________
:*:/TRinv::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN Tri-Ed Invoice.ahk
Return

;_____________________________________________________________________________________
:*:/PTinv::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN PowerTel Invoice.ahk
Return

;_____________________________________________________________________________________
:*:/ENReq::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN Req.ahk
Return

;_____________________________________________________________________________________
:*:/NewITEM::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN New Item.ahk
Return

;_____________________________________________________________________________________
:*:/NewREEL::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN New Reel.ahk
Return

;======================================================================================================
#IfWinActive ;===================END WINDOW SENSATIVE COMMANDS "ENMainFrame"===========================
;======================================================================================================
;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#IfWinActive AHK_class ENMainFrame ;|||BEGIN WINDOW SENSATIVE COMMANDS "ENMainFrame"|||||||||||||||||||
;||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||||
#If WinActive("GL Accounting") OR WinActive("ahk_class SunAwtFrame") ;BEGIN WINDOW SENSATIVE COMMANDS "GL Accounting Or SunAwtFrame"

:*:/tool:: ;enters the GL 6571 in a NISC accounting screen
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\GL Tool.ahk
Return

;_____________________________________________________________________________________
:*:/off:: ;enters the GL 6572 in a NISC accounting screen
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\GL OfficeSupplies.ahk
Return

;_____________________________________________________________________________________
#!i:: ;IFIX GL Entry
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\GL IFIX Item entry.ahk
Return

;_____________________________________________________________________________________
#!G:: ;Generic GL Entry
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\GL Generic Item entry.ahk
Return

;_____________________________________________________________________________________
#!P:: ;SECA GL Entry
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\GL SECA Item entry.ahk
Return

;======================================================================================================
#IfWinActive ;====END WINDOW SENSATIVE COMMANDS "GL Accounting" "AHK_class SunAwtFrame"me"=============
;======================================================================================================

;_____________________________________________________________________________________
#ifwinactive ahk_class rctrl_renwnd32
:*:enread:: ;Send Outlook Read Receipts to Evernote
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\EN Read Receipt.ahk
Return

#IfWinActive

;_____________________________________________________________________________________
#ifwinactive ahk_class rctrl_renwnd32
:*:,gas:: ;Send gas receipt to Evernote
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\Outlook Gas Receipt.ahk
#Ifwinactive
Return

;_____________________________________________________________________________________
#IfWinActive ahk_class SunAwtDialog
:*:,ven:: ;makes the process of selecting a vendor for a quote easier
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\NISC Vendor Selection.ahk
Return
#IfWinActive

;_____________________________________________________________________________________
#IfWinActive ahk_class SunAwtFrame
:*:0g::
;Run S:\Joe\AutoHotKey Scripts\
Run E:\AHK Scripts for Work\PO Line Item Entry.ahk
Return
#IfWinActive

;_____________________________________________________________________________________
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------
;-----------------------------------------------------------------------------------
+ESC::ExitApp