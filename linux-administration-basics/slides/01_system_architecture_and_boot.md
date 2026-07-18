---
marp: true
theme: default
paginate: true
---

# System Architecture and Boot

### LPIC-1 objectives 101.1–101.3

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Linux Hardware Interfaces

- `/proc` exposes process and kernel information.
- `/sys` exposes devices and kernel objects through sysfs.
- `/dev` contains device nodes managed dynamically, commonly through udev.

---

## Hardware Discovery Commands

- `lspci` lists PCI devices.
- `lsusb` lists USB devices.
- `lsmod` shows loaded kernel modules.
- `modprobe` loads or removes modules while resolving dependencies.

---

## Boot Sequence

- Firmware: BIOS or UEFI.
- Boot manager: typically GRUB 2.
- Kernel and initramfs are loaded.
- The first userspace process starts.
- Services and targets bring the system to the desired state.

---

## Kernel Messages and Boot Logs

- Use `dmesg -T` for kernel messages.
- Use `journalctl -b` for the current boot.
- Use `journalctl -b -1` for the previous boot when persistent journal data exists.
- Filter by priority with `journalctl -p warning`.

---

## systemd Targets

- `systemctl get-default` shows the default target.
- `systemctl isolate rescue.target` changes the active target.
- `systemctl set-default multi-user.target` changes the default.
- Understand runlevel-to-target compatibility links.

---

## Safe Shutdown and Communication

- Use `shutdown`, `reboot`, `poweroff`, or `systemctl`.
- Use `wall` to notify logged-in users.
- Allow services to stop cleanly and filesystems to synchronize.

---

## Troubleshooting Flow

- Confirm firmware sees the device.
- Check device enumeration.
- Check loaded modules.
- Review kernel and service logs.
- Compare current and previous boot behavior.

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
