# Auto Spaminator
An Applescript process that leverages SpamSieve to help automate processing of spam email, so that you only have to review the limited email that can't be auto deleted. The more you use it by training incorrectly classified spam, the better if performs!

## What is required
- The default Apple email app on a Mac computer. This will not work with other email clients such as Edison, Spark, etc., nor will it run on IOS (but you can manage the spam processing from your IOS device). 
- A single apple (icloud) email account for your incoming mail. If you have multiple email accounts this will still work if you forward email from them to your primary apple account. This could be enhanced to handle multiple accounts but since I don't have the need, I have not done so. 
- The excellent SpamSieve app from c-command.com, which is the engine that does the mail classification and whose applescripts were the inspiration for this.
- The great and inexpensive Lingon 3 utility from the Apple store to automate the running of the script (or you can code the plist yourself)

## Why is this needed?
Spam is a waste of time to manage, and having to review your junk mailbox to see if any good email has been caught is a pain, even with a great tool like Spamsieve. Spamsieve does provide additional Applescripts to make this process easier - the Remote Training and Rescue Good Messages scripts which you can use instead of the Spaminator. The Spaminator applescript combines and enhances the concepts from both of these scripts into a single script that is run as a standalone app in your applications folder, and it works in concert with the Mail app SpamSieve rules for detecting spam.

## How does it work?
- Every minute (or whatever period you set with Linkon 3), this script will run and:
1. Classify all the mail in the junk folder with Spamsieve as to how likely they are to be spam.
2. Color all mail in the folder based on their spamminess (blue and gray are the most likely to be spam).
3. Move blue/gray junk messages to the trash (highly likely spam - where most of your junk mail will end up after training).
4. Move non-junk mail (that may have been incorrectly classified on the Apple server side) to your inbox.
5. Move all remaining suspect spam to a folder for later review (this will be a very small amount over time).
6. Use SpamSieve to process mail as good that you have placed in your TrainGood folder.
7. Use SpamSieve to process mail as spam that you have placed in your TrainSpam folder.

## Installation instructions
1. Purchase and install Spamsieve for Apple email using the thorough instructions provided.
2. Test to make sure Spamsieve is working for you and that the TrainSpam and TrainGood commands are showing in the Apple mail app. 
3. Perform the initial training of SpamSieve as detailed in the instructions.
4. Create 3 Spamsieve rules in the Mail app as specified in section 4.6.3 of the SpamSieve manual to move both Blue and Gray messages to the trash.
5. Create the following folders in iCloud Mail: TrainSpam, TrainGood and SuspectSpam
6. Download the Auto-Spaminator applescript, open it in the Script Editor, and save it as an application to your desktop (you will need to hold the option key to see the Save As.. option appear in the File Menu).
7. Move the Auto-Spaminator app on your desktop to your Applications folder (you will need to have admin permissions)
8. Purchase the Lingon 3 utility, create a new job, and the point it to the application you just moved in your application folder. You only need to specify how often you want this to run in the options - this will create the launchd job to periodically run the script app.
9. You may receive popups the first time this runs requesting various mail permissions - allow them all.
10. Preferably a dedicated mac (a drone) that can stay open and run mail and this script 24x7. 

## What's the workflow to use this?
1. After installation, most of your spam will be auto processed and moved to the trash. 
2. Any message that falls between known good and known bad will be moved to the SuspectSpam folder. When I see messages appear here I review and then move them to either the TrainGood or TrainSpam folder as appropriate, by either moving the messages if I am reviewing on my IOS device, or my using the TrainGood and TrainSpam commands embedded in the Apple email app by Spamsieve. With continued use of SpamSieve this will be rarer and rarer.
3. Live my life and don't stress about spam! The more you use this (and train the SpamSieve model), the less you will need to deal with spam as the Spaminator (and SpamSieve) will be taking care of it for you.

## Final words
- Use at your own risk
- If you have issues, you can post your questions here, or for much faster response make use of the excellent SpamSieve community forums as these are much more active and your issue is likely to be in the installation of SpamSieve itself
- Enjoy!

