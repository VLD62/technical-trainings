---
marp: true
theme: default
paginate: true
---

# Users, Groups, Scheduling, and Localisation

### LPIC-1 objectives 107.1–107.3

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Account Databases

- `/etc/passwd` stores account metadata.
- `/etc/shadow` stores protected password hashes and aging data.
- `/etc/group` stores group membership and metadata.
- Use `getent` so name-service sources are respected.

---

## User and Group Tools

- `useradd`, `usermod`, and `userdel` manage users.
- `groupadd`, `groupmod`, and `groupdel` manage groups.
- `passwd` changes credentials.
- `chage` manages password aging.

---

## Account Design

- Use service accounts with limited shells and permissions.
- Assign supplementary groups intentionally.
- Use `/etc/skel` for new-user defaults.
- Lock or expire unused accounts rather than sharing credentials.

---

## Cron and At

- Cron runs recurring jobs.
- `at` runs a job once at a specified time.
- System and user crontabs have different formats.
- Access can be controlled with allow and deny files.

---

## systemd Timers

- A timer activates a service unit.
- Calendar and monotonic triggers are supported.
- Persistent timers can catch up after downtime.
- Use `systemctl list-timers` to inspect schedules.

---

## Locales and Encoding

- `LANG` sets a default locale.
- `LC_*` variables override categories.
- `LC_ALL` overrides all locale categories.
- `LANG=C` can make script output predictable.

---

## Timezones

- Timezone data normally lives under `/usr/share/zoneinfo`.
- `timedatectl` inspects and configures time settings on systemd systems.
- `TZ` can override timezone behavior for a process.

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
