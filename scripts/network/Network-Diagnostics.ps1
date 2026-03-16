# ============================================================
# Script:  Network-Diagnostics.ps1
# Purpose: Run a full suite of network diagnostics in one shot
# Author:  TheHelpDesk-Toolkit
# Usage:   .\Network-Diagnostics.ps1
#          .\Network-Diagnostics.ps1 -Target "8.8.8.8"
# ============================================================

param (
    [string]$Target = "8.8.8.8"
)

Write-Host "`n===== Network Diagnostics =====" -ForegroundColor Cyan

# IP Config
Write-Host "`n[IP Configuration]" -ForegroundColor Yellow
Get-NetIPAddress -AddressFamily IPv4 | Where-Object { $_.InterfaceAlias -notlike "*Loopback*" } |
    Select-Object InterfaceAlias, IPAddress, PrefixLength | Format-Table -AutoSize

# Default Gateway
Write-Host "[Default Gateway]" -ForegroundColor Yellow
Get-NetRoute -DestinationPrefix "0.0.0.0/0" | Select-Object InterfaceAlias, NextHop | Format-Table -AutoSize

# DNS Servers
Write-Host "[DNS Servers]" -ForegroundColor Yellow
Get-DnsClientServerAddress -AddressFamily IPv4 | Where-Object { $_.ServerAddresses } |
    Select-Object InterfaceAlias, ServerAddresses | Format-Table -AutoSize

# Ping test
Write-Host "[Ping Test: $Target]" -ForegroundColor Yellow
$ping = Test-Connection -ComputerName $Target -Count 4 -ErrorAction SilentlyContinue
if ($ping) {
    $avg = [math]::Round(($ping | Measure-Object ResponseTime -Average).Average, 1)
    Write-Host "  Success — Avg latency: $avg ms" -ForegroundColor Green
} else {
    Write-Host "  FAILED — No response from $Target" -ForegroundColor Red
}

# DNS resolution
Write-Host "`n[DNS Resolution Test]" -ForegroundColor Yellow
try {
    $resolved = Resolve-DnsName "google.com" -ErrorAction Stop | Select-Object -First 1
    Write-Host "  google.com resolved to: $($resolved.IPAddress)" -ForegroundColor Green
} catch {
    Write-Host "  FAILED — DNS resolution error" -ForegroundColor Red
}

# Internet connectivity
Write-Host "`n[Internet Connectivity]" -ForegroundColor Yellow
try {
    $response = Invoke-WebRequest -Uri "http://www.msftconnecttest.com/connecttest.txt" -UseBasicParsing -TimeoutSec 5
    if ($response.Content -match "Microsoft Connect Test") {
        Write-Host "  Internet: Connected" -ForegroundColor Green
    }
} catch {
    Write-Host "  Internet: NOT reachable" -ForegroundColor Red
}

Write-Host "`n==============================`n" -ForegroundColor Cyan
