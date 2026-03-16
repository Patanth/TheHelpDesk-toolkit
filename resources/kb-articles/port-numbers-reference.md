# Common Port Numbers — Quick Reference

Useful when troubleshooting firewall rules, VPN issues, or connectivity problems.

---

## Most Common Ports for Help Desk

| Port | Protocol | Service | Notes |
|------|----------|---------|-------|
| 20/21 | TCP | FTP | File Transfer — rarely used now, often blocked |
| 22 | TCP | SSH | Secure remote shell |
| 23 | TCP | Telnet | Insecure — should be disabled |
| 25 | TCP | SMTP | Outgoing email (server-to-server) |
| 53 | TCP/UDP | DNS | Name resolution — if this is blocked, nothing works |
| 67/68 | UDP | DHCP | IP address assignment |
| 80 | TCP | HTTP | Unencrypted web traffic |
| 110 | TCP | POP3 | Legacy email retrieval |
| 143 | TCP | IMAP | Email retrieval |
| 389 | TCP/UDP | LDAP | Active Directory lookups |
| 443 | TCP | HTTPS | Encrypted web traffic |
| 445 | TCP | SMB | Windows file sharing / mapped drives |
| 587 | TCP | SMTP (TLS) | Outgoing email (client submission) |
| 636 | TCP | LDAPS | Encrypted LDAP |
| 993 | TCP | IMAPS | Encrypted IMAP |
| 995 | TCP | POP3S | Encrypted POP3 |
| 1194 | UDP | OpenVPN | Common VPN protocol |
| 1433 | TCP | MSSQL | Microsoft SQL Server |
| 3389 | TCP | RDP | Remote Desktop Protocol |
| 3306 | TCP | MySQL | MySQL database |
| 5985/5986 | TCP | WinRM | Windows Remote Management (PowerShell remoting) |
| 8080 | TCP | HTTP Alt | Often used by web proxies or dev servers |
| 8443 | TCP | HTTPS Alt | Alternate HTTPS |

---

## VPN-Specific Ports

| Port | Protocol | VPN Type |
|------|----------|----------|
| 500 | UDP | IKEv1/IKEv2 (IPSec) |
| 1701 | UDP | L2TP |
| 1723 | TCP | PPTP |
| 4500 | UDP | IPSec NAT Traversal |
| 443 | TCP | SSL VPN (Cisco AnyConnect, Pulse, etc.) |
| 1194 | UDP | OpenVPN |

---

## Active Directory / Domain Ports

| Port | Service |
|------|---------|
| 88 | Kerberos authentication |
| 135 | RPC Endpoint Mapper |
| 389 | LDAP |
| 445 | SMB (Group Policy, SYSVOL) |
| 464 | Kerberos password change |
| 636 | LDAPS |
| 3268/3269 | Global Catalog |
| 49152–65535 | Dynamic RPC (required for AD replication) |

---

> **Tip:** If a user can ping a server but can't connect to a service, a specific port is likely being blocked. Use `Test-NetConnection -ComputerName server -Port 3389` in PowerShell to test connectivity on a specific port.
