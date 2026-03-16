# ============================================================
# Script:  Get-ADUserInfo.ps1
# Purpose: Pull a full summary of an AD user account
# Author:  TheHelpDesk-Toolkit
# Requires: ActiveDirectory PowerShell module (RSAT)
# Usage:   .\Get-ADUserInfo.ps1 -Username jsmith
# ============================================================

param (
    [Parameter(Mandatory)]
    [string]$Username
)

Import-Module ActiveDirectory -ErrorAction Stop

$user = Get-ADUser -Identity $Username -Properties * -ErrorAction SilentlyContinue

if (-not $user) {
    Write-Host "ERROR: User '$Username' not found." -ForegroundColor Red
    exit 1
}

Write-Host "`n===== AD Account Info: $Username =====" -ForegroundColor Cyan

Write-Host "`n[Identity]"
Write-Host "  Display Name:   $($user.DisplayName)"
Write-Host "  SAM Account:    $($user.SamAccountName)"
Write-Host "  UPN:            $($user.UserPrincipalName)"
Write-Host "  Email:          $($user.EmailAddress)"
Write-Host "  Department:     $($user.Department)"
Write-Host "  Title:          $($user.Title)"
Write-Host "  Manager:        $($user.Manager)"

Write-Host "`n[Account Status]"
Write-Host "  Enabled:        $($user.Enabled)"
Write-Host "  Locked Out:     $($user.LockedOut)"
Write-Host "  Password Expired: $($user.PasswordExpired)"
Write-Host "  Password Last Set: $($user.PasswordLastSet)"
Write-Host "  Last Logon:     $($user.LastLogonDate)"
Write-Host "  Created:        $($user.Created)"

Write-Host "`n[Groups]"
$groups = Get-ADPrincipalGroupMembership $Username | Sort-Object Name
foreach ($g in $groups) {
    Write-Host "  - $($g.Name)"
}

Write-Host "`n========================================`n" -ForegroundColor Cyan
