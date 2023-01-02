# Delete Server Spam AppleScript
A simple Applescript to take action on email flagged as spam on the iCloud server. This is presented as a template that you can customize to process junk mail the way you want. 

## Why is this needed?
Server side spam messages are not subject to Apple Mail app email rules, and as a result when viewed in the Junk folder would display the full content, potentially alerting the spammer that this was a valid address. In contract, spam which is detected by the Apple Mail client will have remote images disabled by default so that they are not shown when previewing the message.

## What does this do?
This script runs as an application (in your Applications Folder) every minute, reviewing all junk email for the following:
1. Marks all junk email as read and as junk (to address server junk not showing as junk in the app)
2. As an example, shows how to write specific rules to delete junk from persistent spammers that was being caught server side, where you rules had no effect.
3. Moves all other server side junk to a separate folder underneath the Junk folder so that you can either review later or ignore. 

This mail flow is an example to show you what is possible and is not intended as the final solution for anyone. 

## How do I modify/use this?
1. Download the script to your computer (must be an Apple) and open it with the Script Editor. 
2. From there, customize as you wish and then Save As (hold down the Option key) an Application instead of a script. 
3. Make sure to select the "stay open after run handler" checkbox. 
4. Move the application to your Applicaion Folder and run it. 
5. It will ask you for permission to access your email. 
6. Right click on the running app in the dock and select "Options / Open at Login"
