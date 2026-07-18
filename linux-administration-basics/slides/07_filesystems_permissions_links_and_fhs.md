---
marp: true
theme: default
paginate: true
---

# Filesystems, Permissions, Links, and FHS

### LPIC-1 objectives 104.1–104.7 excluding removed 104.4

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Filesystem Types

- ext4 is common and mature.
- XFS is widely used for scalable filesystems.
- VFAT and exFAT support broad interoperability.
- Btrfs introduces copy-on-write, subvolumes, checksums, and other advanced features.

---

## Integrity and Capacity

- `df` reports filesystem space.
- `du` estimates directory usage.
- `df -i` checks inode availability.
- Run filesystem repair tools only in appropriate states and with backups.

---

## Mounting

- `mount` attaches a filesystem into the directory tree.
- `umount` detaches it when not busy.
- `/etc/fstab` defines persistent mount configuration.
- UUIDs and labels are usually more stable than device names.

---

## Permission Model

- Owner, group, and other each receive read, write, and execute bits.
- Directory permissions have different effects from file permissions.
- `chmod`, `chown`, `chgrp`, and `umask` manage access.

---

## Special Modes

- SUID may execute a file with the file owner identity.
- SGID on a directory can preserve group ownership for new files.
- The sticky bit restricts deletion in shared writable directories.
- Audit special bits because they affect security.

---

## Hard and Symbolic Links

- Hard links reference the same inode.
- Symbolic links store a path.
- Hard links normally cannot cross filesystems.
- Deleting one hard-link name does not remove data while another link remains.

---

## Filesystem Hierarchy Standard

- `/etc` contains host-specific configuration.
- `/var` contains variable data.
- `/usr` contains shareable, mostly read-only userland data.
- `/run` contains volatile runtime state.
- Know the expected purpose of `/boot`, `/home`, `/opt`, `/srv`, `/tmp`, and `/dev`.

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
