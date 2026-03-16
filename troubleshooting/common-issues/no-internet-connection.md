# Troubleshooting: No Internet Connection

**Common causes:** Bad IP config, DNS failure, adapter issue, proxy misconfiguration, ISP/network outage

---

## Step 1 — Check the Basics First

- Is it one user/machine or multiple? → Multiple = likely network/infrastructure issue, escalate
- Is the machine on Wi-Fi or wired?
- Any recent changes? (new software, Windows update, moved desks)

---

## Step 2 — Check Connection Status

Look at the taskbar network icon:

| Icon | Meaning |
|------|---------|
| Globe with exclamation | Connected to network, no internet |
| X on network icon | Not connected at all |
| Normal icon but no browsing | Possible DNS or proxy issue |

---

## Step 3 — Run Network Diagnostics

```powershell
.\scripts\network\Network-Diagnostics.ps1
```

Check for:
- Does the machine have a valid IP (not 169.254.x.x)?
- Is the default gateway reachable?
- Are DNS servers listed?

---

## Step 4 — 169.254.x.x IP (APIPA) — No DHCP Lease

The machine failed to get an IP from DHCP.

1. Run:
   ```powershell
   .\scripts\network\Flush-DNS-Reset-Network.ps1
   ```
2. If still 169.254.x.x — check if the network cable is seated / try a different port
3. Check if DHCP service is running on the server (if applicable)
4. Try setting a static IP temporarily to test connectivity

---

## Step 5 — Valid IP but No Internet

1. Can you ping the default gateway?
   ```
   ping 192.168.1.1   (replace with actual gateway)
   ```
   - **No** → Local network issue, check cable/switch/Wi-Fi
   - **Yes** → DNS or upstream issue, continue

2. Can you ping by IP?
   ```
   ping 8.8.8.8
   ```
   - **Yes** → DNS issue → flush DNS:
     ```
     ipconfig /flushdns
     ```
   - **No** → Firewall or routing issue

3. Check proxy settings:
   - IE/Edge: Settings > Proxy → make sure "Automatically detect settings" is on, or clear manual proxy

---

## Step 6 — Wi-Fi Specific

1. Forget the network and reconnect
2. Disable and re-enable the Wi-Fi adapter:
   `Device Manager > Network Adapters > right-click > Disable > Enable`
3. Check if other devices connect to the same Wi-Fi — if not, it's the access point

---

## Step 7 — Full Reset

If nothing above works:
```powershell
.\scripts\network\Flush-DNS-Reset-Network.ps1
```
Then reboot.

---

## Escalate If:
- Multiple machines on the same switch/VLAN are down
- DHCP server is unreachable
- Issue returns after reset
- VPN-only internet access broken (escalate to network team)
