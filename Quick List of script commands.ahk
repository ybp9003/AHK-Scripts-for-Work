#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Scripts := 
(
"EVERNOTE:
	/NewQuote
	/TagFleet
	/veh	process Billy's reports
	/encc	Process credit card receits
	/enqt	Process quotes from vendors
	/enpo	Process PO after being sent to vendor
	/Uni	Process Unifirst invoice (obsolete)
	\t	Auto insert the word ""tag:""
	frs2	Process gas card receipts
	/eninv	Process invoice
	/enreq	Process requisitions
	/newitem	Generates a pre-formatted note
	/newreel	Generates a pre-formatted note
	/qtrn	Remame quotes after PO is assigned

MISC:
	^+4	40% markup
	PN	P/N{SPACE}
	OFS	OUT FOR SIGNATURES
	PCC	PURCHASED WITH CREDIT CARD
	,HIL	HILL COUNTRY TELEPHONE COOP
	,PUR	PURCHASING@HCTC.COOP
	@JH	JHERRING@HCTC.COOP
	@JM	JMARKWORDT@HCTC.COOP
	@JW	JWALLY@HCTC.COOP
	@DM	DMOLDENHAUER@HCTC.COOP
	@HC	@HCTC.COOP
	#Z	COPY, ALT+TAB, PASTE (sorta works)
	^!N	OPENS NOTEPAD++ AND THE SCRIPTS DIRECTORY
	DTS	DATETIMESTAMP
	,TH	EMAIL SIGNATURE
	^+Z	GLOBAL SEARCH EVERNOTE USING SELECTED TEXT
	^U	REPLACE SELCTED TEXT WITH ALL UPPERCASE
	^+U	Replace Selected Text With ""Title Text""
	^L	replace selected text with all lowercase
	
NISC:
	INIT/	PO message
	*1z	Process DSL Service Orders
	,ven	Selects vendor
	0G	Generic Item on a PO
	
OUTLOOK:
	/RO	Process an approved RO
	,gas	Send gas receipts to EN
	
HELLOSIGN:
	posig	Submit PO thru HelloSign.com
	
CHROME:
	^#f	Format Painter
	time	Timesheet entry
	#\	Insert new RO numbers

MANUAL EXECUTED:
	^#m	Opens dialog to select one"
)

MsgBox,64,,%Scripts%
ExitApp