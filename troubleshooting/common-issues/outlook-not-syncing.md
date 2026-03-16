# Troubleshooting: Outlook Not Syncing / Can't Send or Receive Email

**Common causes:** Cached credentials, corrupted profile, OST file issue, connectivity, add-in conflict

---

## Step 1 — Check the Status Bar

Look at the bottom of the Outlook window:

| Status | Meaning |
|--------|---------|
| "Connected" | Working normally |
| "Disconnected" | No connection to mail server |
| "Trying to connect..." | Authentication or network issue |
| "Need Password" | Credential prompt required |

---

## Step 2 — Quick Fixes First

- Click **Send/Receive All Folders** (F9)
- Check internet connection is working
- Close and reopen Outlook
- Restart the machine

---

## Step 3 — Fix Credentials

1. Open **Control Panel > Credential Manager > Windows Credentials**
2. Remove any entries related to Office, MicrosoftOffice, or your mail server
3. Reopen Outlook — it will prompt to re-enter credentials
4. Sign in and check if sync resumes

---

## Step 4 — Repair Office / Outlook Profile

**Repair the mail profile:**
1. Control Panel > Mail > Show Profiles
2. Click **Add** to create a new profile, or select existing and click **Properties > Email Accounts**
3. Remove and re-add the Exchange/Office 365 account

**Run Office Quick Repair:**
1. Control Panel > Programs > Microsoft 365 > Change
2. Select **Quick Repair** → Run

---

## Step 5 — Rebuild the OST File

The OST is Outlook's local cache — if it's corrupted, Outlook won't sync.

1. Close Outlook completely
2. Open **Control Panel > Mail > Data Files**
3. Note the OST file path
4. Navigate to the file in Explorer, rename it to `.old` (e.g. `Outlook.ost.old`)
5. Reopen Outlook — it will rebuild the OST automatically (may take time depending on mailbox size)

---

## Step 6 — Disable Add-ins

1. Open Outlook in Safe Mode: `Win + R` → `outlook.exe /safe`
2. If it syncs in Safe Mode, an add-in is the cause
3. Go to **File > Options > Add-ins > Manage COM Add-ins**
4. Disable add-ins one at a time to identify the culprit

---

## Escalate If:
- Multiple users in the same office are affected (server-side issue)
- User's mailbox is over quota
- "The name cannot be resolved" error (DNS or Autodiscover issue)
- MFA prompts looping without resolving
