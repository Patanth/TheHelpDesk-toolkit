# Troubleshooting: User Can't Log In

**Common causes:** Locked account, expired password, incorrect credentials, profile corruption, domain connectivity issue

---

## Step 1 — Identify the Error Message

| Error Message | Go To |
|---------------|-------|
| "The user name or password is incorrect" | Step 2 |
| "Your account has been locked" | Step 3 |
| "Your password has expired" | Step 4 |
| "The sign-in method you're trying to use isn't allowed" | Step 5 |
| Spinning/loading, never logs in | Step 6 |
| Logs in but gets blank/black screen | Step 7 |

---

## Step 2 — Wrong Username or Password

- Confirm Caps Lock is off
- Confirm they're using the correct username format (e.g. `domain\username` or `username@domain.com`)
- Have them try their last 2–3 known passwords
- If still failing → proceed to Step 3 to check account status

---

## Step 3 — Account Locked

1. Check in Active Directory Users and Computers (ADUC) or run:
   ```powershell
   .\scripts\user-management\Unlock-ADAccount.ps1 -Username jsmith
   ```
2. Check **LastBadPasswordAttempt** — if very recent, ask user if anyone else has access
3. Unlock the account and have user try again
4. If it locks again immediately → check for mapped drives or scheduled tasks using old credentials

---

## Step 4 — Expired Password

- Reset via ADUC or:
  ```powershell
  .\scripts\user-management\Reset-ADPassword.ps1 -Username jsmith
  ```
- Set **"User must change password at next logon"**
- If user is remote and can't reach the domain to change it, have them VPN in first or use SSPR (Self-Service Password Reset) if configured

---

## Step 5 — Sign-In Method Not Allowed

- Check if the account has the correct logon workstation restrictions in ADUC
- Verify the machine is joined to the domain: `System Properties > Computer Name`
- Check if the user's OU has a GPO blocking interactive logon

---

## Step 6 — Machine Hangs at Login / Never Loads

1. Check domain connectivity — can the machine ping the DC?
   ```powershell
   .\scripts\network\Network-Diagnostics.ps1
   ```
2. Try logging in with a local admin account to isolate if it's domain or profile related
3. Run `gpupdate /force` from a local admin session
4. Check Event Viewer > Windows Logs > Security for logon failure events

---

## Step 7 — Blank/Black Screen After Login

1. Try `Ctrl + Alt + Del` → Task Manager → File > Run new task > `explorer.exe`
2. If that works, the shell may be corrupted — run `sfc /scannow` as admin
3. Check if a GPO or startup script is causing the hang (Event Viewer > Application)
4. If a roaming profile is in use, rename the local cached profile and let it rebuild

---

## Escalate If:
- Account keeps locking repeatedly despite no user error
- Multiple users on the same machine can't log in
- Domain trust relationship error appears
- Issue persists after profile rebuild
