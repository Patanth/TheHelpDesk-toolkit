# ============================================================
# Script:  Repair-WindowsUpdate.ps1
# Purpose: Reset Windows Update components to fix stuck/failed updates
# Author:  TheHelpDesk-Toolkit
# Usage:   Run as Administrator
#          .\Repair-WindowsUpdate.ps1
# ============================================================

Write-Host "`nResetting Windows Update components..." -ForegroundColor Yellow

# Stop services
$services = @("wuauserv", "cryptSvc", "bits", "msiserver")
foreach ($svc in $services) {
    Stop-Service -Name $svc -Force -ErrorAction SilentlyContinue
    Write-Host "  Stopped: $svc" -ForegroundColor Gray
}

# Rename cache folders
Write-Host "`nRenaming SoftwareDistribution and Catroot2..." -ForegroundColor Gray
Rename-Item "$env:SystemRoot\SoftwareDistribution"    "SoftwareDistribution.old"  -ErrorAction SilentlyContinue
Rename-Item "$env:SystemRoot\System32\catroot2"        "catroot2.old"              -ErrorAction SilentlyContinue

# Reset BITS and Windows Update service
sc.exe sdset bits   "D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)" | Out-Null
sc.exe sdset wuauserv "D:(A;;CCLCSWRPWPDTLOCRRC;;;SY)(A;;CCDCLCSWRPWPDTLOCRSDRCWDWO;;;BA)(A;;CCLCSWLOCRRC;;;AU)(A;;CCLCSWRPWPDTLOCRRC;;;PU)" | Out-Null

# Re-register DLLs
$dlls = @(
    "atl.dll","urlmon.dll","mshtml.dll","shdocvw.dll","browseui.dll",
    "jscript.dll","vbscript.dll","scrrun.dll","msxml.dll","msxml3.dll",
    "msxml6.dll","actxprxy.dll","softpub.dll","wintrust.dll","dssenh.dll",
    "rsaenh.dll","gpkcsp.dll","sccbase.dll","slbcsp.dll","cryptdlg.dll",
    "oleaut32.dll","ole32.dll","shell32.dll","initpki.dll","wuapi.dll",
    "wuaueng.dll","wuaueng1.dll","wucltui.dll","wups.dll","wups2.dll",
    "wuweb.dll","qmgr.dll","qmgrprxy.dll","wucltux.dll","muweb.dll","wuwebv.dll"
)
foreach ($dll in $dlls) {
    regsvr32.exe /s $dll
}
Write-Host "  DLLs re-registered." -ForegroundColor Gray

# Restart services
foreach ($svc in $services) {
    Start-Service -Name $svc -ErrorAction SilentlyContinue
    Write-Host "  Started: $svc" -ForegroundColor Gray
}

Write-Host "`nWindows Update reset complete. Run Windows Update now to check for updates.`n" -ForegroundColor Green
