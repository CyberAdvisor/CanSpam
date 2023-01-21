use AppleScript version "2.4" -- Yosemite (10.10) or later
use scripting additions
-- Manage Server Spam application
-- Save as Application in script editor to Applications folder
-- Customize to delete problematic spam that rules won't address
-- 12/30/22 - Michael Lines - Initial version
-- 01/19/23 - Michael Lines - Updated to leverage Spamsieve, manage training folders. Install in Launchd using Linkon 3
(*
Auto Spaminator
By Michael Lines
mikelines@gmail.com

ABOUT
This script, run as an app, works with the SpamSieve product to help automate the processing of spam. 
Leverages code from the Rescue Good Messages and Remote Training publically available applescripts from SpamSieve.

HISTORY
- 2023-01-21 - v1.0;  initial release

KNOWN ISSUES
- No debugging, error handling included. Folders must be precreated as documented in the instructions.

*)

on run
	-- Execute the app
	my manageSpam()
end run

on manageSpam()
	tell application "Mail"
		check for new mail -- Refresh/sync mail
		
		--
		-- Examine all junk messages to score and delete if needed
		--
		set _myJunkList to every message of junk mailbox
		repeat with _junkMsg in _myJunkList
			
			--
			-- Score server (no color) detected spam messages
			--
			if _junkMsg's background color is none then
				set _source to _junkMsg's source
				tell application "SpamSieve" to set _score to score message _source without auto training
				
				--
				-- Decide whether to trash based on how spammy the message is
				--
				set _moveToTrash to my colorMessageAndDecideIfShouldMoveToTrash(_junkMsg, _score)
				if _moveToTrash then
					--
					-- Trash blue/gray known spam
					--
					delete _junkMsg
				else if _junkMsg's background color is none then
					--
					-- Move incorrectly flagged server spam to inbox
					--
					move _junkMsg to inbox
				else
					--
					-- Move remaining spam to folder for review
					-- 
					move _junkMsg to mailbox "SuspectSpam"
				end if
				
				--
				-- Check for blue/gray message added by Train Spam in Mail app
				--
			else if _junkMsg's background color is blue or _junkMsg's background color is gray then
				set _junkMsg's read status to false
				delete _junkMsg
			end if
		end repeat
		
		-- 
		-- Process mail in TrainGood mailbox
		--
		set _myGoodList to (get every message of mailbox "TrainGood" of account "iCloud")
		repeat with _goodMsg in _myGoodList
			set _source to _goodMsg's source
			tell application "SpamSieve" to add good _source
			set _goodMsg's read status to false
			set _goodMsg's background color to none
			move _goodMsg to inbox
		end repeat
		
		-- 
		-- Process mail in TrainSpam mailbox
		--
		set _mySpamList to (get every message of mailbox "TrainSpam" of account "iCloud")
		repeat with _spamMsg in _mySpamList
			set _source to _spamMsg's source
			tell application "SpamSieve" to add spam _source
			set _spamMsg's background color to blue
			set _spamMsg's read status to false
			delete _spamMsg
		end repeat
		
	end tell
end manageSpam

on colorMessageAndDecideIfShouldMoveToTrash(_message, _score)
	tell application "Mail"
		set _table to {¬
			{99, blue, true}, ¬
			{95, gray, true}, ¬
			{88, purple, false}, ¬
			{81, red, false}, ¬
			{75, orange, false}, ¬
			{50, yellow, false}, ¬
			{0, none, false}}
		-- Flag colors chosen so that messages sort by spamminess: gray, purple, blue, green, yellow, orange, none
		repeat with _row in _table
			set {_threshold, _color, _moveToTrash} to _row
			if _score ≥ _threshold then
				set _message's background color to _color
				set _message's read status to false -- Flag for review (in trash, suspect or inbox)
				return _moveToTrash
			end if
		end repeat
	end tell
end colorMessageAndDecideIfShouldMoveToTrash
