# Troubleshooting: Printer Offline / Stuck Print Queue

**Common causes:** Spooler crash, stuck job, driver issue, printer asleep/off, wrong port

---

## Step 1 — Check the Physical Printer

- Is it powered on?
- Does it show any error lights or messages on the display?
- Is it connected — USB cable seated, or on the correct network?
- Try powering it off, waiting 30 seconds, and powering back on

---

## Step 2 — Clear the Print Queue

Run as Administrator:
```powershell
.\scripts\windows\Clear-PrintQueue.ps1
```

Then try printing again.

---

## Step 3 — Set Printer Back Online

1. Open **Control Panel > Devices and Printers**
2. Right-click the printer → **See what's printing**
3. Click **Printer** menu → uncheck **Use Printer Offline**

---

## Step 4 — Check Printer Status in Devices & Printers

- If it shows **Error** — check the printer's IP hasn't changed (common with DHCP printers)
- Right-click → **Printer properties > Ports tab** — verify the IP matches the printer's actual IP

To find the printer's current IP: print a configuration page from the printer itself (usually hold the button on the printer for 5–10 seconds)

---

## Step 5 — Remove and Re-add the Printer

1. Right-click the printer → **Remove device**
2. Re-add: **Add a printer > The printer that I want isn't listed**
3. Add by IP address or hostname
4. If drivers are missing, download from the manufacturer's website

---

## Step 6 — Update or Reinstall Drivers

1. Open **Device Manager > Print queues**
2. Right-click the printer → **Update driver**
3. If that fails, right-click → **Uninstall device** (check "Delete driver software")
4. Reinstall fresh drivers from the manufacturer site

---

## Escalate If:
- Printer is shared from a print server and multiple users are affected
- Printer shows online but jobs disappear without printing (driver corruption on server)
- Network printer's IP keeps changing (request static IP from network team)
