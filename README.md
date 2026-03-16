# TheHelpDesk-Toolkit

A one-stop shop for Tier 1 Help Desk admins — troubleshooting guides, resources, tools, and scripts for day-to-day support work.

---

## Folder Structure

```
TheHelpDesk-toolkit/
├── scripts/
│   ├── windows/
│   │   ├── Clear-PrintQueue.ps1
│   │   ├── Get-SystemInfo.ps1
│   │   └── Repair-WindowsUpdate.ps1
│   ├── network/
│   │   ├── Flush-DNS-Reset-Network.ps1
│   │   └── Network-Diagnostics.ps1
│   └── user-management/
│       ├── Get-ADUserInfo.ps1
│       ├── Reset-ADPassword.ps1
│       └── Unlock-ADAccount.ps1
├── troubleshooting/
│   ├── common-issues/
│   │   ├── no-internet-connection.md
│   │   ├── outlook-not-syncing.md
│   │   ├── printer-offline.md
│   │   ├── user-cant-login.md
│   │   └── vpn-not-connecting.md
│   └── checklists/
│       ├── new-ticket-checklist.md
│       └── pre-escalation-checklist.md
├── resources/
│   ├── kb-articles/
│   │   ├── common-error-codes.md
│   │   └── port-numbers-reference.md
│   ├── templates/
│   │   ├── escalation-email-template.md
│   │   ├── offboarding-checklist.md
│   │   ├── onboarding-checklist.md
│   │   └── shift-handoff-template.md
│   └── policies/
│       ├── escalation-policy.md
│       └── password-policy-reference.md
└── tools/
    └── revo-uninstaller.md
```

---

## Quick Reference

| Category | What's Inside |
|----------|---------------|
| Scripts | Automation scripts to speed up repetitive tasks |
| Troubleshooting | Guides and checklists for common Tier 1 issues |
| Resources | KB articles, templates, and policy references |
| Tools | Utilities used during support sessions |

---

## Contributing

1. Add scripts to the appropriate subfolder
2. Include a comment header in every script (author, date, purpose)
3. Add a matching KB article or README in the relevant `troubleshooting/` or `resources/` folder when applicable

---

## A Note on AI-Assisted Content

This repository was built with the assistance of [Claude Code](https://claude.ai/claude-code) by Anthropic. AI tools are welcome and encouraged as part of the contribution process — they can be a great way to draft scripts, generate templates, and speed up documentation.

That said, **all AI-generated content must be reviewed and verified by the contributor before being submitted.** Please do not blindly push AI output without first testing it in your environment and confirming it works as intended. You are responsible for what you submit — AI is a tool, not a substitute for your judgement.

> If it hasn't been tested, it isn't ready.

---

## Categories Covered

- Password resets & account lockouts
- Network connectivity issues
- Printer troubleshooting
- Software installation & licensing
- VPN issues
- Hardware diagnostics
- Email/Outlook issues
- Onboarding & offboarding workflows
