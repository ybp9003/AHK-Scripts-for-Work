Gui, Add, Text, x5 cRed , Window Transparency
Gui, Add, Text, ym, #Wheelup or Wheeldown
Gui, Add, Text, , #o Resets Transparency
Gui, Add, Text, , #g Current Transparency setting of window under mouse
Gui, Add, Text, , 
Gui, Add, Text, x5 Section cRed , Global Shortcuts
Gui, Add, Text, ys , ofs	OUT FOR SIGNATURES
Gui, Add, Text, , ofq	OUT FOR QUOTES
Gui, Add, Text, , PN	P/N 
Gui, Add, Text, , pcc	PURCHASED WITH CREDIT CARD
Gui, Add, Text, , ,hil	Hill Country Telephone Coop
Gui, Add, Text, , @jh	jherring@hctc.coop
Gui, Add, Text, , @sc	scopp@hctc.coop
Gui, Add, Text, , @jmark	jmarkwordt@hctc.coop
Gui, Add, Text, , @jwally	jwally@hctc.coop
Gui, Add, Text, , @dm	dmoldenhauer@hctc.coop
Gui, Add, Text, , @hc	@hctc.coop
Gui, Add, Text, , #z	COPY, ALT+TAB, PASTE
Gui, Add, Text, , posig	Process a PO and submit it via HelloSign.com
Gui, Add, Text, , ^!n	Opens Notepadd++ and the folder containing all the referenced scripts
Gui, Add, Text, , dts	Adds a DATE/TIME stamp
Gui, Add, Text, , ,th	Email Signature
Gui, Add, Text, , ^+z	Copies selected text and does a Global Search in Evernote
Gui, Add, Text, , ^u	Converts selected text to UPPERCASE
Gui, Add, Text, , ^l	Converts selected text to lowercase
Gui, Add, Text, , ^+u	Converts selected text to Title Case
Gui, Show

Return


; ,`n
; ,`n`
; ,`n
; ,`n
; ,`n
; ,`n
; ,`n/NewQT{Tab}Starts the process to submit an HCTC RFQ to vendors
; ,`n
; ,`nIf the PO Message screen is open
; ,`n/init{Tab}Generic PO message GUI
; ,`n
; ,`nIf MSExcel is the active window
; ,`n^q{Tab}Opens a GUI used to enter vehicle data into the Vehicle spreadsheet
; ,`n{Tab}{Tab}{Tab}{Tab}{Tab}---------
; ,`nIf Google Chrome is the active window
; ,`n#\{Tab}Loop to add new RO Numbers into the RO Log
; ,`n{Tab}{Tab}{Tab}{Tab}{Tab}---------
; ,`nIf the NISC "Task Remarks" window is active
; ,`n*1z{Tab}Process to document DSL Modems sent to customers
; ,`n{Tab}{Tab}{Tab}{Tab}{Tab}---------
; ,`nIf Evernote MainFrame is active
; ,`n/tagfleet{Tab}Tag Fleet Card statement and invoice
; ,`n/veh{Tab}Process the various vehicle reports
; ,`n/enCC{Tab}Process credit card receipts when no PO will be created
; ,`n/enQT{Tab}Process quotes from vendors
; ,`n/uni{Tab}Process Unifirst invoices
; ,`n/frs2{Tab}Process fleet card receipts
; ,`n/invTJ{Tab}Tag/Move TJ Moore invoices
; ,`n/invHCE{Tab}Tag/Move Hill Country Electric invoices
; ,`n/invTR{Tab}Name/Tag/Move Tri-Ed Video invoices
; ,`n/invPT{Tab}Name/Tag/Move Power & Tel invoices
; ,`n/enREQ{Tab}Name/Tag PO Requisitions
; ,`n/enPO{Tab}Name/Tag/Move POs
; ,`n/newItem{Tab}Loads a template for new Inventory/NonInventory/Exempt/MISC item
; ,`n/newReel{Tab}Loads a template for new reels
; ,`n{Tab}{Tab}{Tab}{Tab}{Tab}---------
; ,`n,IF the NISC GL window is open
; ,`n/tool{Tab}Enters the GL for tools (6571)
; ,`n/off{Tab}Enters the GL for office supplies (6572)
; ,`n#!g{Tab}Captures and then enters a GL number at the proper time (needs refinement)
; ,`n{Tab}{Tab}{Tab}{Tab}{Tab}---------
; ,`nIf MSOutlook window is active
; ,`n`,gas{Tab}Sends a Fleet Card fuel receipt to Evernote
; ,`n{Tab}{Tab}{Tab}{Tab}{Tab}---------
; ,`nIf the NSIC Vendor search window is open
; ,`n`,ven{Tab}Selects a specific vendor (must know vendor number to use)
; ,`n{Tab}{Tab}{Tab}{Tab}{Tab}---------
; ,`n0g{Tab}Use to automate the entry of items in NISC PO/Quote/Requisition line item screen

GuiClose:
ExitApp                           
Esc::ExitApp
