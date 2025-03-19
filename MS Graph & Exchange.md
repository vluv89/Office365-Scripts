In PowerShell, managing **calendar access** typically involves **Exchange Online PowerShell (EXO), Microsoft Graph API, or on-premises Exchange cmdlets**. Below is a list of the key PowerShell cmdlets related to **calendar access permissions and management**:

---

### **📌 Exchange Online PowerShell (EXO)**
These cmdlets require the **ExchangeOnlineManagement** module.

#### **1️⃣ Managing Calendar Folder Permissions**
```powershell
Get-MailboxFolderPermission -Identity user@domain.com:\Calendar
Set-MailboxFolderPermission -Identity user@domain.com:\Calendar -User user2@domain.com -AccessRights Editor
Add-MailboxFolderPermission -Identity user@domain.com:\Calendar -User user2@domain.com -AccessRights Reviewer
Remove-MailboxFolderPermission -Identity user@domain.com:\Calendar -User user2@domain.com
```
🔹 **Common Calendar AccessRights Values:**
- **Owner** – Full control.
- **Editor** – Create, edit, and delete all items.
- **Reviewer** – Read-only access.

---

#### **2️⃣ Checking and Managing Free/Busy Information**
```powershell
Get-MailboxCalendarConfiguration -Identity user@domain.com
Set-MailboxCalendarConfiguration -Identity user@domain.com -AutomateProcessing AutoAccept
```
🔹 **AutomateProcessing Options:**
- **AutoAccept** – Automatically accepts meeting requests.
- **AutoUpdate** – Updates free/busy information.
- **None** – No automatic processing.

---

#### **3️⃣ Managing Organizational Calendar Sharing Policies**
```powershell
Get-SharingPolicy
Set-SharingPolicy -Identity "Default Sharing Policy" -Domains "*:CalendarSharingFreeBusySimple"
New-SharingPolicy -Name "External Calendar Sharing" -Domains "partner.com:CalendarSharingFreeBusyReviewer"
```
🔹 Used for **cross-organization** calendar sharing.

---

### **📌 On-Premises Exchange (Exchange Management Shell)**
If using on-premises Exchange, the following cmdlets apply:

```powershell
Get-MailboxFolderStatistics -Identity user@domain.com
Get-MailboxFolderPermission -Identity user@domain.com:\Calendar
Set-MailboxCalendarConfiguration -Identity user@domain.com -AllowConflicts $true
```

---

### **📌 Microsoft Graph PowerShell (for Microsoft 365/Exchange Online)**
For modern authentication and **Microsoft 365 calendar access**, use **Graph API PowerShell**:

#### **1️⃣ Install and Connect**
```powershell
Install-Module Microsoft.Graph
Connect-MgGraph -Scopes "Calendars.ReadWrite, Calendars.Read.Shared"
```

#### **2️⃣ Get Calendar Events**
```powershell
Get-MgUserEvent -UserId user@domain.com
```

#### **3️⃣ Share Calendar with Another User**
```powershell
New-MgUserCalendarPermission -UserId user@domain.com -CalendarId Calendar -Roles "editor" -EmailAddress user2@domain.com
```

---

### **🔹 Summary**
| Cmdlet | Purpose |
|--------|---------|
| **Get-MailboxFolderPermission** | Check calendar permissions |
| **Set-MailboxFolderPermission** | Modify calendar permissions |
| **Add-MailboxFolderPermission** | Grant calendar permissions |
| **Remove-MailboxFolderPermission** | Remove access to the calendar |
| **Get-MailboxCalendarConfiguration** | View mailbox calendar settings |
| **Set-MailboxCalendarConfiguration** | Configure auto-processing settings |
| **New-SharingPolicy** | Set calendar sharing rules |
| **Get-MgUserEvent** | Retrieve calendar events via Microsoft Graph |


