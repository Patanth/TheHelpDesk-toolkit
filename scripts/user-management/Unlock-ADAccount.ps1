# ============================================================
# Script:  Unlock-ADAccount.ps1
# Purpose: Unlock a locked Active Directory user account
# Author:  TheHelpDesk-Toolkit
# Requires: ActiveDirectory PowerShell module (RSAT)
# Usage:   .\Unlock-ADAccount.ps1 -Username jsmith
# ============================================================

param (
    [Parameter(Mandatory)]
    [string]$Username
)

Import-Module ActiveDirectory -ErrorAction Stop

$user = Get-ADUser -Identity $Username -Properties LockedOut, LastBadPasswordAttempt -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "ERROR: User '$Username' not found in Active Directory." -ForegroundColor Red
    exit 1
}

Write-Host "`nUser: $($user.Name) ($($user.SamAccountName))" -ForegroundColor Cyan

if ($user.LockedOut) {
    Unlock-ADAccount -Identity $Username
    Write-Host "Account has been unlocked successfully." -ForegroundColor Green
} else {
    Write-Host "Account is NOT currently locked." -ForegroundColor Yellow
}

Write-Host "Last bad password attempt: $($user.LastBadPasswordAttempt)`n"
