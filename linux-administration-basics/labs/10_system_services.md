# Lab 10 – Time, Logging, Mail, and Printing

## Objectives

- Inspect system and hardware clock configuration
- Verify time synchronization
- Query and generate log messages
- Review log rotation
- Explore MTA and CUPS concepts without building production services

## Time

```bash
date --iso-8601=seconds
timedatectl
sudo hwclock --show 2>/dev/null || true
chronyc tracking 2>/dev/null || true
chronyc sources 2>/dev/null || true
```

Record whether NTP synchronization is active and which service provides it.

## Journal

```bash
journalctl -b -p warning --no-pager | head -n 30
journalctl --since '30 minutes ago' --no-pager | tail -n 30
journalctl -u cron --since today 2>/dev/null || journalctl -u crond --since today 2>/dev/null || true
```

Generate a message:

```bash
logger -p user.notice -t lpic-lab "test logging message"
journalctl -t lpic-lab --since '5 minutes ago'
```

## Persistent Journal Review

```bash
ls -ld /run/log/journal /var/log/journal 2>/dev/null || true
systemd-analyze cat-config systemd/journald.conf 2>/dev/null | less
journalctl --disk-usage
```

Do not vacuum logs on a shared machine. Write the command that would remove archived journal data older than seven days.

## rsyslog

```bash
systemctl status rsyslog 2>/dev/null || true
grep -R --line-number --no-messages '^[^#]' /etc/rsyslog.conf /etc/rsyslog.d | head -n 40
```

Identify a rule that writes to a file.

## Logrotate

```bash
sudo logrotate -d /etc/logrotate.conf | less
find /etc/logrotate.d -maxdepth 1 -type f | head
```

Explain `rotate`, `daily`, `weekly`, `compress`, `missingok`, and `postrotate`.

## MTA Awareness

```bash
command -v sendmail || true
command -v mail || true
command -v mailq || true
ls -l ~/.forward 2>/dev/null || true
```

Explain aliases and forwarding without configuring an internet-facing mail server.

## Printing Awareness

```bash
systemctl status cups 2>/dev/null || true
lpstat -t 2>/dev/null || true
lpq 2>/dev/null || true
```

## Validation

- You can identify time synchronization state.
- You can filter journal data by boot, time, unit, priority, and tag.
- You can explain rsyslog and journald interaction conceptually.
- You can identify logrotate policy files.
- You know the scope of MTA and printing objectives.
