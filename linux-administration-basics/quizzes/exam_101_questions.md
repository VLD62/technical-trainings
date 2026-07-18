# Exam 101-500 Practice Questions

Complete the questions before opening the answer section. These are original study questions, not real examination questions.

## Questions

1. Which virtual filesystem normally exposes kernel device objects and attributes?
2. Which command lists loaded kernel modules?
3. Which command loads a module while resolving dependencies?
4. What is loaded after firmware and the boot manager but before the normal userspace services?
5. Which `journalctl` option selects the current boot?
6. Which command shows the current default systemd target?
7. Why is GPT generally preferred on modern systems?
8. What is the usual purpose of an EFI System Partition?
9. Which command shows filesystem UUIDs and types for block devices?
10. What is the relationship between a physical volume, volume group, and logical volume?
11. Which command displays dynamic libraries required by an executable?
12. Which Debian command identifies the installed package owning a file?
13. Which RPM command identifies the installed package owning a file?
14. What is the difference between `rpm` and `dnf`?
15. What should be regenerated when cloning a Linux image if identity uniqueness is required?
16. Which quoting form prevents variable expansion?
17. Which command reports whether a name is an alias, function, builtin, or executable?
18. What does `find ... -print0 | xargs -0 ...` protect against?
19. What is the risk of `dd`?
20. What does file descriptor 2 represent?
21. What does `2>&1` do?
22. Which tool writes input to both stdout and a file?
23. Which regex anchor matches the beginning of a line?
24. Which grep option enables extended regular expressions?
25. Which vi command deletes the current line?
26. Which signal requests normal process termination?
27. Which signal cannot be caught or ignored?
28. What does a higher nice value normally mean?
29. Which command checks inode consumption?
30. Which file defines persistent filesystem mounts?
31. Why are UUIDs preferred over `/dev/sdX` names in fstab?
32. What does execute permission on a directory allow?
33. What does SGID on a directory commonly do?
34. What does the sticky bit do on a shared writable directory?
35. What is the key difference between hard and symbolic links?
36. Can a normal hard link cross filesystems?
37. Where is host-specific system configuration normally stored?
38. Where is variable application and service data commonly stored?
39. Which command searches a prebuilt filename database?
40. What must happen after files change for `locate` results to become current?

---

## Answer Key

1. `/sys`.
2. `lsmod`.
3. `modprobe`.
4. The Linux kernel and usually an initramfs.
5. `-b`.
6. `systemctl get-default`.
7. It supports modern firmware workflows, large disks, more partitions, and redundant metadata.
8. It stores UEFI boot loaders and related files on a FAT-formatted partition.
9. `blkid` or `lsblk -f`.
10. Physical volumes provide capacity, volume groups pool it, and logical volumes allocate usable block devices.
11. `ldd`.
12. `dpkg -S /path/to/file`.
13. `rpm -qf /path/to/file`.
14. `rpm` is a lower-level package tool; `dnf` resolves dependencies and repositories.
15. Examples include SSH host keys and the D-Bus machine ID; cloud-init may handle first-boot initialization.
16. Single quotes.
17. `type`.
18. Filenames containing spaces, newlines, and other unusual characters.
19. It writes raw data and can overwrite a target device without filesystem safeguards.
20. Standard error.
21. It duplicates standard error to the current destination of standard output.
22. `tee`.
23. `^`.
24. `-E`.
25. `dd`.
26. SIGTERM.
27. SIGKILL.
28. Lower CPU scheduling priority.
29. `df -i`.
30. `/etc/fstab`.
31. Device names can change; UUIDs identify the filesystem more stably.
32. Traversal and access to named entries, subject to other permissions.
33. New entries inherit the directory group.
34. It restricts deletion or renaming of entries to appropriate owners or privileged users.
35. Hard links reference the same inode; symbolic links store a path.
36. No.
37. `/etc`.
38. `/var`.
39. `locate`.
40. The locate database must be updated, commonly with `updatedb`.
