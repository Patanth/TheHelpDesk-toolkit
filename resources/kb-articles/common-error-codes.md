# Common Windows Error Codes — Quick Reference

A fast reference for error codes that come up regularly in Tier 1 support.

---

## Windows System Errors

| Code | Name | What It Means | Quick Fix |
|------|------|---------------|-----------|
| 0x80070005 | Access Denied | Permissions issue | Run as admin, check file/folder permissions |
| 0x80070057 | Invalid Parameter | Often seen in Windows Update | Run Windows Update troubleshooter |
| 0x8007000D | Invalid Data | Corrupted file or update | Run `sfc /scannow`, retry update |
| 0x80004005 | Unspecified Error | Broad — often network share or VM | Check share permissions, firewall |
| 0xC000021A | Critical Process Died | BSOD — system process crashed | Boot to safe mode, check recent drivers/updates |
| 0x0000007B | Inaccessible Boot Device | BSOD — can't read boot drive | Check SATA/NVMe drivers, boot order in BIOS |
| 0x00000050 | Page Fault in Non-Paged Area | BSOD — bad RAM or driver | Run MemTest86, check recent driver installs |

---

## Windows Update Errors

| Code | What It Means | Quick Fix |
|------|---------------|-----------|
| 0x80240034 | Update not applicable | Update already installed or not needed |
| 0x80070422 | Service not running | Start Windows Update service |
| 0x800705B4 | Timeout | Run `.\scripts\windows\Repair-WindowsUpdate.ps1` |
| 0x80073712 | Component store corrupted | Run `DISM /Online /Cleanup-Image /RestoreHealth` |
| 0x8024402F | Connection issue | Check internet, proxy, firewall |
| 0x80240fff | Background Intelligent Transfer | Restart BITS service |

---

## Network Errors

| Code | What It Means | Quick Fix |
|------|---------------|-----------|
| Error 678 | No response from remote computer | Check physical connection, modem/router |
| Error 691 | Access denied (wrong credentials) | Re-enter VPN/dial-up credentials |
| Error 718 | PPP timeout | VPN server not responding — check server status |
| Error 800 | VPN connection failed | Firewall blocking VPN port, or wrong server address |
| 0x80090304 | SSPI error (Kerberos) | Clock skew — sync time with domain controller |

---

## Office / Outlook Errors

| Code / Message | What It Means | Quick Fix |
|----------------|---------------|-----------|
| 0x800CCC0F | Connection dropped | Check network, restart Outlook |
| 0x80040600 | PST/OST file corrupted | Run `scanpst.exe` (Inbox Repair Tool) |
| 0x800CCC78 | Sender rejected | SMTP auth issue — check outgoing mail settings |
| "Cannot open your default email folders" | Profile or OST corrupt | Create new Outlook profile |
| 550 5.7.1 | Message rejected | Sender not authorized — check relay/spam settings |

---

## Event Viewer Common IDs

| Event ID | Source | Meaning |
|----------|--------|---------|
| 4625 | Security | Failed logon attempt |
| 4740 | Security | Account locked out |
| 4648 | Security | Logon with explicit credentials |
| 7034 | Service Control Manager | Service crashed unexpectedly |
| 41 | Kernel-Power | System rebooted without clean shutdown |
| 6008 | EventLog | Unexpected shutdown |
| 1001 | Windows Error Reporting | Application crash |

---

> **Tip:** Always copy the exact error code into your ticket. When Googling, include the code + OS version for best results (e.g. `0x80070005 Windows 11`).
