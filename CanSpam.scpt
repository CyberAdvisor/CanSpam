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
			-- Delete spam
			--
			if _junkMsg's source does not contain "spf=pass" then
				my deleteSpamMsg(_junkMsg)
			else if _junkMsg's source does not contain "dmarc=pass" then
				my deleteSpamMsg(_junkMsg)
			else if _junkMsg's source does not contain "dkim=pass" then
				my deleteSpamMsg(_junkMsg)
			end if
		end repeat
		
	end tell
end manageSpam

on deleteSpamMsg(_message)
	tell application "Mail"
		set _message's read status to true
		delete _message
	end tell
end deleteSpamMsg
