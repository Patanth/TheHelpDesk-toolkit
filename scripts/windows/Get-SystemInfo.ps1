# ============================================================
# Script:  Get-SystemInfo.ps1
# Purpose: Pull key system info from a local or remote machine
# Author:  TheHelpDesk-Toolkit
# Usage:   .\Get-SystemInfo.ps1
#          .\Get-SystemInfo.ps1 -ComputerName PCNAME
# ============================================================

param (
    [string]$ComputerName = $env:COMPUTERNAME
)

Write-Host "`n===== System Info: $ComputerName =====" -ForegroundColor Cyan

$os  = Get-WmiObject Win32_OperatingSystem -ComputerName $ComputerName
$cs  = Get-WmiObject Win32_ComputerSystem  -ComputerName $ComputerName
$cpu = Get-WmiObject Win32_Processor       -ComputerName $ComputerName
$disk = Get-WmiObject Win32_LogicalDisk    -ComputerName $ComputerName -Filter "DriveType=3"

# OS Info
Write-Host "`n[OS]"
Write-Host "  Name:        $($os.Caption)"
Write-Host "  Version:     $($os.Version)"
Write-Host "  Last Boot:   $($os.ConvertToDateTime($os.LastBootUpTime))"
Write-Host "  Uptime:      $([math]::Round(((Get-Date) - $os.ConvertToDateTime($os.LastBootUpTime)).TotalHours, 1)) hours"

# Hardware
Write-Host "`n[Hardware]"
Write-Host "  Manufacturer: $($cs.Manufacturer)"
Write-Host "  Model:        $($cs.Model)"
Write-Host "  CPU:          $($cpu.Name)"
Write-Host "  RAM:          $([math]::Round($cs.TotalPhysicalMemory / 1GB, 2)) GB"

# Disk
Write-Host "`n[Disk]"
foreach ($d in $disk) {
    $free = [math]::Round($d.FreeSpace / 1GB, 2)
    $total = [math]::Round($d.Size / 1GB, 2)
    $used = [math]::Round($total - $free, 2)
    Write-Host "  Drive $($d.DeviceID)  Used: $used GB / $total GB  Free: $free GB"
}

# Network
Write-Host "`n[Network]"
$adapters = Get-WmiObject Win32_NetworkAdapterConfiguration -ComputerName $ComputerName | Where-Object { $_.IPEnabled }
foreach ($a in $adapters) {
    Write-Host "  Adapter: $($a.Description)"
    Write-Host "  IP:      $($a.IPAddress[0])"
    Write-Host "  MAC:     $($a.MACAddress)"
}

Write-Host "`n======================================`n" -ForegroundColor Cyan
