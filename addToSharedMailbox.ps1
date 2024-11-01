# Connect to exchange online first - make sure you have the correct permissions or use the IT admin credential

Import-Module ExchangeOnlineManagement
Connect-ExchangeOnline 

# Define the user (user email) and the shared mailboxes (mailbox address) you want to add them too

$userEmail = "first.last@companydomain.com"
$sharedMailboxes = @("department@companiydomain.com")

# loop through each mailbox and add full access
foreach ($mailbox in $sharedMailboxes) {
    # Grant full access 
    Add-MailboxPermission -identity $mailbox -user $userEmail -AccessRights fullAccess -inheritanceType All -autoMapping $false
    
    # Grant Send As Permission
    Add-RecipientPermission -Identity $mailbox -Trustee $userEmail -AccessRights SendAs
}

Write-Host "Send as permissions have been granted to $userId for $sharedMailboxes"

# Disconnect from the exchange server

Disconnect-ExchangeOnline