use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions

(*
CanSpam
By Michael Lines
mikelines@gmail.com

ABOUT
This script, run as an app, autodeletes spam that meets certain criteria.

HISTORY
- 2023-01-26 - v1.0;  initial release
- 2023-02-23 - v1.1; updated to focus on DMARC controls
- 2023-03-04 - v1.2; tighten reliance on spf, dkim and dmarc
- 2023-03-18 - v1.3; added additional spf checks to catch relayed spam
- 2023-03-18 - v1.3.1; added logging
- 
KNOWN ISSUES
- NA

*)

on run
	-- Execute the app
	my manageSpam()
end run

on manageSpam()
	tell application "Mail"
		
		--
		-- Examine all junk messages and delete if needed
		--
		set _myJunkList to every message of junk mailbox
		repeat with _junkMsg in _myJunkList
			
			--
			-- Check spf, dmarc, dkim for and delete if spam
			--
			if _junkMsg's source contains "spf=fail" then
				my deleteSpamMsg(_junkMsg, "spf=fail")
			else if _junkMsg's source contains "spf=softfail" then
				my deleteSpamMsg(_junkMsg, "spf=softfail")
			else if _junkMsg's source does not contain "spf=pass" then
				my deleteSpamMsg(_junkMsg, "no spf=pass")
			else if _junkMsg's source does not contain "dmarc=pass" then
				my deleteSpamMsg(_junkMsg, "no dmarc=pass")
			else if _junkMsg's source does not contain "dkim=pass" then
				my deleteSpamMsg(_junkMsg, "no dkim=pass")
			end if
		end repeat
		
	end tell
end manageSpam

on deleteSpamMsg(_message, _failure)
	tell application "Mail"
		--
		-- Log the spam (replace <username> with your local apple userid)
		--
		set _logFile to "/Users/<username>/Desktop/CanSpam.txt"
		set _logMsg to ((current date) as string) & space & "Failure: " & _failure & "   Sender: '" & _message's sender & "'"
		do shell script "echo  " & quoted form of _logMsg & " >>  " & quoted form of _logFile
		--
		-- Delete the spam
		--
		set _message's read status to true
		delete _message
	end tell
end deleteSpamMsg
