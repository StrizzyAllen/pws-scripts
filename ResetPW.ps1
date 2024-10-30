# connect to Microsoft Graph
Connect-MgGraph -Scopes "User.ReadWrite.All", "Directory.AccessAsUser.All" -NoWelcome

# define the user and new password
$UserId = Read-Host "Enter the user email to reset the password for"
$NewPassword = Read-Host "Enter the new password" -AsSecureString

# define password profile
$PasswordProfile = @{
    Password = $NewPassword
    ForceChangePasswordNextSignIn = $true
}

# reset the password
Update-MgUser -UserId $UserId -PasswordProfile $PasswordProfile

Write-Output "Password reset successfully for $UserId"