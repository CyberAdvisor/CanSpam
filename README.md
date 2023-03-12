# CanSpam
CanSpam is an Applescript that eliminates virtually all spam from your mailbox, leaving you more time to focus on the mail that matters. 

## What is required
- The default Apple email app on a Mac computer. This will not work with other email clients such as Edison, Spark, etc., nor will it run on IOS. 
- A single apple (icloud) email account for your incoming mail. If you have multiple email accounts this will still work if you forward email from them to your primary apple account. This could be enhanced to handle multiple accounts but since I don't have the need, I have not done so. 
- The Lingon 3 utility from the Apple store to automate the running of the script (or you can code the plist yourself)
- A Mac computer that you can dedicate to running the CanSpam script. You can use this computer for other purposes, however you will need to make sure that it is running 24x7 (there are numerous apps available to do this) if you want spam across all of your Apple devices to be caught. 

## Why is this needed?
Spam is a waste of time to manage, and having to review your junk mailbox to see if any good email has been caught is a pain and exposes you to at least the headers of the spam messages. By using this script almost all spam messages will be sent to your trash so you never have to see them, and for those other unwanted emails who are sent by legtimate senders, you can use the Apple Mail blocking facility to also send those directly to the trash.

## How does it work?
CanSpam evaluates all spam messages to see if they have valid SPF, DKIM and DMARC headers. If not, and the mail has already been classified as junk by Apple by being in your junk folder, then it is almost certain to be a spam message and thus can be trashed.

If for some reason a company with misconfigured SPF, DKIM or DMARC sends you a message and it is trashed, you will then know where to go look for it (in your trash). You can then also ask yourself if you want to do business with a company who cannot maintain basic email secuity controls. 

If you receive email from a legtimate company that you no longer wish to hear from, first use their unsubscribe link if it is available. If they refuse to honor their own unsubscribe, then use the Apple Mail Block Contact feature to send all of their future emails directly to the trash (you will need to enable this in the Apple Mail Junk Mail preferences).

## Installation instructions
1. Download the CanSpam applescript, open it in the Script Editor, and save it as an application to your desktop (you will need to hold the option key to see the Save As.. option appear in the File Menu).
2. Move the CanSpam app on your desktop to your Applications folder (you will need to have admin permissions)
3. Purchase the Lingon 3 utility, create a new job, and the point it to the application you just moved in your application folder. You only need to specify how often you want this to run in the options - this will create the launchd job to periodically run the script app.
4. You may receive popups the first time this runs requesting various mail permissions - allow them all.

## What's the workflow to use this?
1. After installation, virtually all of your spam mail will now be automatically moved to the trash (depending on how often you have set the app to run). 
2. If for any reason an email from a legtimate company you were expecting is moved to the trash, this be because they have an issue with their SPF, DKIM or DMARC records. If you wish you can notify them to fix their email controls!
3. You now should only find emails in your junk folder from senders with legtimate SPF, DKIM and DMARC records. If you want to receive these emails, use the "Move to Inbox" option in Apple Mail to train Apple Mail that these are legtimate emails and not junk them in the future. If not, you can use the Block Contact to send them directly to the trash in the future. 
4. Live your life without stressing about spam! 

## Final words
- Use at your own risk
- If you have issues, you can post your questions here
- Enjoy!

