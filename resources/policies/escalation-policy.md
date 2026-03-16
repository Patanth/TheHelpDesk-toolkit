# Escalation Policy — Reference Guide

This document outlines when and how to escalate tickets at Tier 1. Adjust thresholds to match your organization's SLAs.

---

## When to Escalate

### Escalate Immediately (Do Not Troubleshoot)
- Security incidents (malware, ransomware, data breach, phishing with credential compromise)
- Complete outages affecting multiple users or a department
- C-level / executive issues (escalate with highest priority, notify your supervisor)
- Hardware failures with no spare available

### Escalate After Initial Troubleshooting
- Issue not resolved after following the relevant troubleshooting guide
- Issue requires access or permissions you don't have (server access, firewall changes, AD schema)
- Issue is reproducible but root cause is unclear after basic investigation
- Recurring issue (same user, same problem, more than twice in 30 days)

### Do Not Escalate — Handle at Tier 1
- Password resets and account unlocks
- Basic connectivity issues (DNS flush, IP reset)
- Printer offline / stuck queue
- Standard software installs from approved list
- New hire provisioning from template

---

## Priority Levels

| Priority | Definition | Response Target | Resolution Target |
|----------|------------|-----------------|-------------------|
| P1 – Critical | Full outage, business stopped | 15 minutes | 4 hours |
| P2 – High | Major function impaired, workaround exists | 1 hour | 8 hours |
| P3 – Medium | Partial impact, workaround available | 4 hours | 24 hours |
| P4 – Low | Minor issue, no business impact | 8 hours | 72 hours |

> Adjust these targets to match your organization's actual SLA agreements.

---

## How to Escalate Properly

1. **Document first** — complete the pre-escalation checklist before escalating
2. **Use the escalation email template** when escalating via email (`resources/templates/escalation-email-template.md`)
3. **Set correct priority** — don't inflate priority without justification
4. **Notify the user** — tell them who is handling the ticket next and when to expect an update
5. **Stay available** — Tier 2 may need you to gather additional info from the user

---

## Escalation Paths

| Issue Type | Escalate To |
|------------|-------------|
| Network / infrastructure | Network / Infrastructure Team |
| Server / Active Directory | Systems Administration |
| Email / Office 365 | Systems Admin or Microsoft Support |
| Security incident | Security Team / CISO (immediate) |
| Application-specific | Application Owner or Vendor |
| Hardware (under warranty) | Vendor / Procurement |
| Access / permissions | Systems Admin or App Owner |

---

## What Makes a Bad Escalation

- No troubleshooting steps documented
- Incorrect priority
- User not notified
- Vague description ("it doesn't work")
- Escalating something resolvable at Tier 1

A bad escalation wastes everyone's time and reflects on your ticket quality. When in doubt, ask a senior tech before escalating.
