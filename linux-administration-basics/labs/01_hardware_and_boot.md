# Lab 1 – Hardware and Boot

## Objectives

- Inspect hardware and kernel interfaces
- Identify loaded modules
- Review the boot sequence and logs
- Inspect systemd targets and services
- Practice safe user communication and shutdown planning

## Safety

Do not isolate rescue mode or reboot a shared system. Use a VM console and snapshot.

## Tasks

### 1. Collect baseline information

```bash
uname -a
cat /etc/os-release
lscpu
lsmem 2>/dev/null || true
lsblk -f
```

Record the kernel version, architecture, init system, and root filesystem.

### 2. Inspect device interfaces

```bash
ls -ld /proc /sys /dev
head -n 10 /proc/cpuinfo
find /sys/class -maxdepth 1 -mindepth 1 -type d | head
lspci 2>/dev/null | head || true
lsusb 2>/dev/null | head || true
```

Explain which information is virtual and which entries represent device access.

### 3. Inspect modules

```bash
lsmod | head
MODULE=$(lsmod | awk 'NR==2 {print $1}')
modinfo "$MODULE" | head -n 20
```

Do not remove an unknown module. Identify one harmless module in your VM and explain its purpose.

### 4. Review boot evidence

```bash
dmesg -T | less
journalctl -b --no-pager | head -n 50
journalctl -b -p warning --no-pager
```

Find one kernel event and one service event.

### 5. Inspect systemd targets

```bash
systemctl get-default
systemctl list-units --type=target
systemctl list-dependencies --plain default.target | head -n 40
```

Map `multi-user.target`, `graphical.target`, `rescue.target`, and `emergency.target` to their intended use.

### 6. Inspect a service

Choose SSH or another installed service:

```bash
systemctl status ssh 2>/dev/null || systemctl status sshd
systemctl is-active ssh 2>/dev/null || systemctl is-active sshd
systemctl is-enabled ssh 2>/dev/null || systemctl is-enabled sshd
journalctl -u ssh --since today 2>/dev/null || journalctl -u sshd --since today
```

### 7. Plan a shutdown without executing it

Write the command that would:

- Notify all users
- Reboot in ten minutes
- Cancel the scheduled reboot

Validate syntax with manual pages instead of running it on a shared system.

## Validation

- You can explain BIOS/UEFI → boot manager → kernel/initramfs → init/service manager.
- You can distinguish `dmesg` from `journalctl`.
- You can identify the default target and service state.
- You can explain why `modprobe` is preferred over direct low-level module insertion for normal administration.

## Challenge

Use `journalctl` to show only events from the previous boot and only at warning priority or higher. Explain what must be configured for previous-boot logs to exist.
