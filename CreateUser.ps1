# Connecting to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All"

# Define user details
$DisplayName = Read-Host "Enter the display name for the new user"
$UserPrincipalName = Read-Host "Enter the user principal name (first.last@gorede.com)"
$MailNickname = Read-Host "Enter the mail nickname (first.last)"
$Password = Read-Host "Enter a complex password for the new user"

# Define the password profile
$PasswordProfile = @{
    ForceChangePasswordNextSignIn = $true
    Password = $Password
}

# Create the new user
New-MgUser -DisplayName $DisplayName -UserPrincipalName $UserPrincipalName -MailNickname $MailNickname -AccountEnabled -PasswordProfile $PasswordProfile

# Output confirmation
Write-Output "User $DisplayName created successfully with User Principal Name $UserPrincipalName."
