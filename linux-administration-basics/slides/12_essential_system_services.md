---
marp: true
theme: default
paginate: true
---

# Essential System Services

### LPIC-1 objectives 108.1–108.4

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## System and Hardware Time

- The system clock is maintained by the kernel.
- The hardware clock persists across shutdowns.
- UTC is normally preferred for the hardware clock.
- Use `timedatectl`, `date`, and `hwclock` appropriately.

---

## NTP and Chrony

- Network time synchronization corrects clock drift.
- Chrony is common on modern systems.
- `chronyc sources` and `chronyc tracking` inspect synchronization.
- Large time jumps can affect logs, certificates, and distributed systems.

---

## System Logging

- systemd-journald collects structured journal events.
- rsyslog can route, store, send, and receive syslog messages.
- Facilities and priorities control message selection.
- Use `logger` to generate test messages.

---

## Journal Operations

- Filter by unit, boot, time, priority, PID, or executable.
- Persistent storage commonly uses `/var/log/journal`.
- Control retention and size through journald configuration.
- Vacuum old entries deliberately.

---

## Log Rotation

- Logrotate archives, compresses, removes, and recreates logs.
- Policies are stored globally and in drop-in files.
- Applications may need a signal after rotation.
- Test configuration before relying on it.

---

## MTA Basics

- Know common MTAs such as Postfix, Sendmail, and Exim.
- Understand aliases and per-user forwarding.
- The objective focuses on awareness and basic client-host operations, not full mail-server engineering.

---

## Printing

- CUPS manages print queues and jobs.
- `lpq`, `lpr`, and `lprm` provide common or compatibility interfaces.
- Troubleshooting includes queue state, connectivity, permissions, and drivers.

---

## Practice

- Run the commands in a disposable lab.
- Capture expected and unexpected output.
- Explain what changed and how to reverse it.
- Complete the matching lab and checklist items.

---

## Key Takeaways

- Understand the concept before memorizing options.
- Know the important commands, files, and failure modes.
- Prefer safe, observable, reversible practice.
- Review the official LPIC-1 objectives as the source of truth.
