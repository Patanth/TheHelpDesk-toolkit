# Troubleshooting: VPN Not Connecting

**Common causes:** Wrong credentials, expired certificate, split tunneling config, firewall blocking, client needs update

---

## Step 1 — Identify the Error

| Error | Likely Cause |
|-------|-------------|
| "Wrong username or password" | Bad credentials or MFA issue |
| "Certificate is invalid" | Expired cert or wrong VPN profile |
| "Connection timed out" | Firewall, ISP blocking, or VPN server down |
| Connects but no access to resources | Split tunneling or DNS issue |
| Connects then immediately drops | MTU issue or keep-alive config |

---

## Step 2 — Basic Checks

- Confirm internet connection works without VPN
- Confirm the user is using the correct VPN client and profile
- Check if VPN was working before — if yes, ask what changed
- Try from a different network (e.g. mobile hotspot) to rule out ISP/local firewall blocking

---

## Step 3 — Credential & MFA Issues

1. Have user re-enter their credentials carefully (check Caps Lock)
2. If MFA is required — confirm they're approving the push notification or entering the correct code
3. Check if their AD password has expired (VPN auth often uses AD):
   ```powershell
   .\scripts\user-management\Get-ADUserInfo.ps1 -Username jsmith
   ```
4. If password expired, reset it first, then retry VPN

---

## Step 4 — Reinstall / Reset VPN Client

1. Uninstall the VPN client (use Revo Uninstaller for a clean removal — see `tools/revo-uninstaller.md`)
2. Reboot
3. Reinstall the latest version of the VPN client
4. Re-import the VPN profile if needed

---

## Step 5 — Connected but Can't Access Internal Resources

1. Check if DNS is resolving internal names:
   ```
   nslookup internalserver.company.local
   ```
2. If DNS fails, internal DNS servers may not be pushed via VPN — escalate to network team
3. Check if split tunneling is configured — the user may need to route all traffic through VPN

---

## Step 6 — Firewall Checks

- Temporarily disable Windows Defender Firewall and retry VPN
- Check if a third-party firewall (antivirus suite) is blocking the VPN adapter
- Ports commonly needed: UDP 500, UDP 4500 (IKEv2), TCP 443 (SSL VPN), UDP 1194 (OpenVPN)

---

## Escalate If:
- VPN server is unreachable for all users
- Certificate has expired (requires admin renewal)
- User's account is locked from too many VPN auth failures
- Split tunneling policy needs to be changed
