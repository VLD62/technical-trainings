---
marp: true
theme: default
paginate: true
---

# Disk Layout, Partitions, and GRUB

### LPIC-1 objectives 102.1, 102.2, and 104.1

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Disk Layout Principles

- Separate filesystems can isolate growth and simplify recovery.
- Typical considerations include `/`, `/boot`, `/home`, `/var`, swap, and the EFI System Partition.
- The workload determines the correct layout; there is no universal partition scheme.

---

## MBR and GPT

- MBR is legacy and has partition and size limitations.
- GPT supports modern systems, large disks, and redundant metadata.
- UEFI systems normally use an EFI System Partition formatted as FAT.

---

## Inspection Commands

- `lsblk -f` shows block devices and filesystem metadata.
- `blkid` reports UUIDs and types.
- `fdisk -l` and `parted -l` inspect partition tables.
- `findmnt` shows the active mount hierarchy.

---

## Safe Practice with Loop Devices

- Create a sparse file with `truncate`.
- Attach it using `losetup --find --show`.
- Partition and format only the loop device.
- Detach it after unmounting with `losetup -d`.

---

## LVM Foundations

- Physical volumes provide capacity.
- Volume groups pool capacity.
- Logical volumes allocate usable block devices.
- LVM supports flexible resizing and snapshots, but requires careful planning.

---

## GRUB 2 Concepts

- Configuration is generated rather than maintained only by hand.
- Common commands include `grub-install`, `grub-mkconfig`, and distribution-specific wrappers.
- Kernel parameters can be edited temporarily from the GRUB menu for troubleshooting.

---

## Boot Recovery Mindset

- Identify whether failure occurs before or after the kernel starts.
- Verify the root filesystem and UUID references.
- Check initramfs contents when storage drivers are missing.
- Use rescue media and chroot carefully.

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
