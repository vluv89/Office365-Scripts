# Connect to ExchangeOnline Module
Set-ExecutionPolicy RemoteSigned -Force
Connect-ExchangeOnline

#Its best to check the current permissions before you make any changes so incase you make any mistake, you can revert the prvious permissions. 
#Check the current permissions for a user's calender
Get-mailboxFolderPermission -identity johndoe@contoso.com:\calendar

# Provide access to calendar - Replace user's email address. 
Add-MailboxFolderPermission -Identity johndoe@contoso.com:\Calendar -User janedoe@contoso.com -AccessRights reviewer

# To change the permissions that already exists for the user requires differnt command. instead of running the Add-mailbox, you would use set-mailbox command.
#For example, if Jane already has Reviewer access to John's calendar, you would use the command below to change the permissions to Editor:

Set-MailboxFolderPermission -Identity johndoe@contoso.com:\Calendar -User janedoe@contoso.com -AccessRights Editor
# this command will fail if the user do not have existing permissions already. 
