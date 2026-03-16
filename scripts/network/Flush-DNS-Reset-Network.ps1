# ============================================================
# Script:  Flush-DNS-Reset-Network.ps1
# Purpose: Flush DNS, release/renew IP, reset Winsock/TCP stack
# Author:  TheHelpDesk-Toolkit
# Usage:   Run as Administrator
#          .\Flush-DNS-Reset-Network.ps1
# ============================================================

Write-Host "`nResetting network stack..." -ForegroundColor Yellow

Write-Host "  [1/5] Flushing DNS cache..."
ipconfig /flushdns | Out-Null

Write-Host "  [2/5] Releasing IP address..."
ipconfig /release | Out-Null

Write-Host "  [3/5] Renewing IP address..."
ipconfig /renew | Out-Null

Write-Host "  [4/5] Resetting Winsock..."
netsh winsock reset | Out-Null

Write-Host "  [5/5] Resetting TCP/IP stack..."
netsh int ip reset | Out-Null

Write-Host "`nNetwork reset complete." -ForegroundColor Green
Write-Host "A reboot is recommended for all changes to take effect.`n" -ForegroundColor Yellow
