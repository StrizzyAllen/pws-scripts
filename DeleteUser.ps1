# Connecting to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Get the user you want to remove
$UserPrincipalName = Read-Host "Enter the user principal name of the user to remove (first.last@gorede.com)"

# Confirm the removal of the user
$confirmation = Read-Host "Are you sure you want to remove the user $UserPrincipalName? (yes/no)"
if ($confirmation -eq "yes") {
    Remove-MgUser -UserId $UserPrincipalName

    # Output confirmation
    Write-Output "User $UserPrincipalName has been removed successfully."
} else {
    Write-Output "User removal cancelled."
}
