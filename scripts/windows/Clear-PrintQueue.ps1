# ============================================================
# Script:  Clear-PrintQueue.ps1
# Purpose: Stop the print spooler, clear stuck jobs, restart
# Author:  TheHelpDesk-Toolkit
# Usage:   Run as Administrator
#          .\Clear-PrintQueue.ps1
# ============================================================

Write-Host "`nClearing print queue..." -ForegroundColor Yellow

# Stop the spooler
Stop-Service -Name Spooler -Force
Write-Host "  [1/3] Print Spooler stopped." -ForegroundColor Gray

# Delete all jobs in the spool folder
$spoolPath = "$env:SystemRoot\System32\spool\PRINTERS\*"
Remove-Item $spoolPath -Force -ErrorAction SilentlyContinue
Write-Host "  [2/3] Spool folder cleared." -ForegroundColor Gray

# Restart the spooler
Start-Service -Name Spooler
Write-Host "  [3/3] Print Spooler restarted." -ForegroundColor Gray

Write-Host "`nDone. Print queue has been cleared.`n" -ForegroundColor Green
