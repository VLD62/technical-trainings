# Lab 9 – Users, Groups, Scheduling, and Localisation

## Objectives

- Inspect account databases
- Create and modify temporary users and groups
- Schedule recurring and one-time jobs
- Inspect locales and timezone settings

## Safety

Use unique lab names and remove them at the end. Keep a root console available.

## Account Inspection

```bash
getent passwd root
getent group "$(id -gn)"
sudo getent shadow root | cut -d: -f1,2
```

Explain why `getent` is preferable to reading only local files in environments using centralized identity services.

## Temporary Accounts

```bash
sudo groupadd lpiclab
sudo useradd -m -s /bin/bash -G lpiclab lpicuser
sudo passwd lpicuser
id lpicuser
sudo chage -l lpicuser
sudo usermod -L lpicuser
sudo passwd -S lpicuser
sudo usermod -U lpicuser
```

Inspect the relevant entries in passwd, shadow, and group databases.

## Cron

Create a temporary user crontab entry that writes a timestamp every five minutes to `/tmp/lpic-cron.log`:

```cron
*/5 * * * * /usr/bin/date >> /tmp/lpic-cron.log 2>&1
```

Use absolute paths. List the crontab and then remove the entry after validation.

## at

When `atd` is installed and running:

```bash
echo '/usr/bin/date > /tmp/lpic-at.log' | at now + 2 minutes
atq
```

Remove the job if you do not want to wait.

## systemd Timer

Review the example units in `examples/systemd/`. Copy them to a user systemd directory and run them as user units if your system supports it:

```bash
mkdir -p ~/.config/systemd/user
cp examples/systemd/lpic-report.* ~/.config/systemd/user/
systemctl --user daemon-reload
systemctl --user enable --now lpic-report.timer
systemctl --user list-timers
```

Disable and remove them after the lab.

## Locale and Timezone

```bash
locale
locale -a | head
LANG=C date
LANG=en_US.UTF-8 date 2>/dev/null || true
timedatectl
```

Explain `LANG`, `LC_*`, `LC_ALL`, and `TZ` precedence.

## Cleanup

```bash
sudo userdel -r lpicuser
sudo groupdel lpiclab
rm -f /tmp/lpic-cron.log /tmp/lpic-at.log
```

## Validation

- The temporary user and group no longer exist.
- You can explain local account database fields.
- You can distinguish cron, at, and systemd timers.
- You can produce deterministic English command output for scripts.
