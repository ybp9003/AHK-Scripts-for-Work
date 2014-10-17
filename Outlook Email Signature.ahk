;=========================================================================================
;IDEAS FOR IMPROVEMENT GO HERE:

;=========================================================================================

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

Signature = 
(
Thank You,
Joe Herring
Purchasing Department
Hill Country Telephone Coop
830.367.6243
)
Send %Signature%
; Send `nThank you,`nJoe Herring`nPurchasing Department`nHill Country Telephone Coop`n830.367.6243
ExitApp

Scrolllock::exitapp