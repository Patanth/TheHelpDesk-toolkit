# Password Policy — Reference Guide

A quick reference for password requirements and best practices. Update this to match your organization's actual policy.

---

## Standard Requirements (Update to Match Your Org)

| Setting | Requirement |
|---------|-------------|
| Minimum length | 12 characters |
| Complexity | Must include uppercase, lowercase, number, and symbol |
| Maximum age | 90 days |
| Minimum age | 1 day (prevents immediate reuse) |
| Password history | Last 10 passwords cannot be reused |
| Account lockout threshold | 5 failed attempts |
| Lockout duration | 30 minutes (or until admin unlocks) |
| Observation window | 30 minutes |

> **Important:** These are example defaults. Always refer to your organization's Group Policy (GPO) or security policy documentation for the actual enforced values.

---

## Help Desk Responsibilities

**You CAN:**
- Reset passwords when identity is verified
- Unlock locked accounts
- Inform users of password requirements

**You CANNOT:**
- Share a user's password with anyone, including their manager
- Set a password without requiring the user to change it at next logon
- Bypass password complexity requirements
- Reset passwords without verifying identity first

---

## Identity Verification Before Password Reset

Always verify identity before resetting a password. Acceptable methods (use what your org defines):

- [ ] Callback to the user's verified phone number on file
- [ ] Manager confirmation in writing
- [ ] Employee ID or badge number match
- [ ] Security question (if configured)
- [ ] In-person with valid ID

**Never reset a password based solely on an email request** — email accounts can be compromised.

---

## Password Reset Process

1. Verify user identity (see above)
2. Reset using ADUC or:
   ```powershell
   .\scripts\user-management\Reset-ADPassword.ps1 -Username jsmith
   ```
3. Set a temporary password — communicate it securely (phone, not email)
4. Ensure "User must change password at next logon" is checked
5. Document the reset in the ticket

---

## Common Questions

**"My password doesn't meet requirements" after setting one:**
- Check length and complexity — remind user that spaces and special characters count
- If using a password manager, ensure it's generating a compliant password

**"I just changed my password and now it's asking me to change it again":**
- "Minimum age" policy is set — usually resolves after 24 hours
- Or the password was flagged as too similar to a previous one

**"My account locks every time I change my password":**
- Check for saved credentials in Credential Manager or mapped drives using the old password
- Mobile devices with Exchange sync can also trigger lockouts
