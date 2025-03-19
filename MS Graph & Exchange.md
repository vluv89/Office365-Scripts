📌 Microsoft Graph PowerShell (for Microsoft 365/Exchange Online)
For modern authentication and Microsoft 365 calendar access, use Graph API PowerShell:

1️⃣ Install and Connect
powershell
Copy
Edit
Install-Module Microsoft.Graph
Connect-MgGraph -Scopes "Calendars.ReadWrite, Calendars.Read.Shared"
2️⃣ Get Calendar Events
powershell
Copy
Edit
Get-MgUserEvent -UserId user@domain.com
3️⃣ Share Calendar with Another User
powershell
Copy
Edit
New-MgUserCalendarPermission -UserId user@domain.com -CalendarId Calendar -Roles "editor" -EmailAddress user2@domain.com
🔹 Summary
Cmdlet	Purpose
Get-MailboxFolderPermission	Check calendar permissions
Set-MailboxFolderPermission	Modify calendar permissions
Add-MailboxFolderPermission	Grant calendar permissions
Remove-MailboxFolderPermission	Remove access to the calendar
Get-MailboxCalendarConfiguration	View mailbox calendar settings
Set-MailboxCalendarConfiguration	Configure auto-processing settings
New-SharingPolicy	Set calendar sharing rules
Get-MgUserEvent	Retrieve calendar events via Microsoft Graph
