#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;put a msgbox here that will give a list of things needed before continuing
#]::
InputBox, itemNumber,, Item Number
InputBox, itemDescription,, Item Description
InputBox, partNumber,, Part Number
InputBox, vendor,, Is there a specific manufacture we get this from?`nFor example: We get some of our tools from Klein Tools or it could be something like a cabinet from Zhone...etc
InputBox, exDescription,,Enter any other information about this item that would be useful
InputBox, group,, First two or three letters of the Group the item will be assigned to
InputBox, uom,, Unit of measure
InputBox, cycleCountClass,, Enter either A B C or EX or classification
StringUpper, itemNumber, itemNumber
StringUpper, itemDescription, itemDescription
StringUpper, partNumber, partNumber
StringUpper, vendor, vendor
StringUpper, exDescription, exDescription
StringUpper, group, group
StringUpper, uom, uom
StringUpper, cycleCountClass, cycleCountClass
	{
	SplashTextOn ,450,175, Get Ready, Begin Entering text`n1. Make sure you are on the Material Inventory > Item > Item screen`n2. Click ADD`n3. Place the cursor in the "Item:" box and you are ready!
	WinMove, Get Ready, , 4, 4
	}
MsgBox, 0, Ready!, Press OK when ready!,
SplashTextOff
Send %itemNumber%{Tab}
	Sleep 150
Send %itemDescription%{Tab}
	Sleep 150
Send P/N %partNumber%, %vendor%, %exDescription%{Tab}
	Sleep 150
Send %group%{Tab}
	Sleep 150
Send %uom%
	Sleep 150
Send {Tab}
	Sleep 150
Send {Tab}
	Sleep 150
Send {Tab}
	Sleep 150
Send {Tab}
	Sleep 150
Send %cycleCountClass%
	Sleep 150
;Send !s
MsgBox, Don't forget to fill in the information needed in both the "Location" and "PO Info" tabs!
ExitApp
Esc::ExitApp