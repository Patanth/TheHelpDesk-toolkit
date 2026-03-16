# ============================================================
# Script:  Reset-ADPassword.ps1
# Purpose: Reset an AD user's password and optionally unlock account
# Author:  TheHelpDesk-Toolkit
# Requires: ActiveDirectory PowerShell module (RSAT)
# Usage:   .\Reset-ADPassword.ps1 -Username jsmith
# ============================================================

param (
    [Parameter(Mandatory)]
    [string]$Username
)

Import-Module ActiveDirectory -ErrorAction Stop

$user = Get-ADUser -Identity $Username -Properties LockedOut, PasswordLastSet -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "ERROR: User '$Username' not found in Active Directory." -ForegroundColor Red
    exit 1
}

Write-Host "`nUser: $($user.Name) ($($user.SamAccountName))" -ForegroundColor Cyan
Write-Host "Password Last Set: $($user.PasswordLastSet)"

# Prompt for new password securely
$newPassword = Read-Host "Enter new password" -AsSecureString

try {
    Set-ADAccountPassword -Identity $Username -NewPassword $newPassword -Reset
    Set-ADUser -Identity $Username -ChangePasswordAtLogon $true

    # Unlock if locked
    if ($user.LockedOut) {
        Unlock-ADAccount -Identity $Username
        Write-Host "Account was locked — it has been unlocked." -ForegroundColor Yellow
    }

    Write-Host "Password reset successfully. User must change password at next logon.`n" -ForegroundColor Green
} catch {
    Write-Host "ERROR: Failed to reset password — $($_.Exception.Message)" -ForegroundColor Red
}
