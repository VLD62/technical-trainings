# Lab 7 – Permissions, Links, and FHS

## Objectives

- Apply symbolic and numeric permissions
- Observe umask behavior
- Use SGID and sticky directories
- Compare hard and symbolic links
- Navigate important FHS locations

## Setup

```bash
LAB_DIR=$(mktemp -d /tmp/lpic-perms.XXXXXX)
cd "$LAB_DIR"
touch report.txt
mkdir shared private
```

## Basic Permissions

```bash
chmod 640 report.txt
stat -c '%A %a %U %G %n' report.txt
chmod u+x,g-w,o-rwx report.txt
stat -c '%A %a %n' report.txt
```

Calculate the final numeric mode before checking.

## umask

```bash
umask
OLD_UMASK=$(umask)
umask 027
touch masked-file
mkdir masked-dir
stat -c '%A %a %n' masked-file masked-dir
umask "$OLD_UMASK"
```

Explain why default file permissions do not include execute bits.

## SGID Directory

Use a group available to your user:

```bash
GROUP_NAME=$(id -gn)
chgrp "$GROUP_NAME" shared
chmod 2775 shared
touch shared/example
stat -c '%A %a %U %G %n' shared shared/example
```

## Sticky Directory

```bash
chmod 1777 shared
stat -c '%A %a %n' shared
```

Explain the behavior of `/tmp` and why mode `0777` alone would be insufficient.

## Links

```bash
printf 'same inode data\n' > original
ln original hard-link
ln -s original symbolic-link
ls -li original hard-link symbolic-link
rm original
cat hard-link
readlink symbolic-link
```

Explain why the hard link still works and the symbolic link is broken.

## FHS Discovery

For each directory, write its primary purpose:

```bash
for d in /bin /boot /dev /etc /home /opt /proc /run /srv /sys /tmp /usr /var; do
  ls -ld "$d"
done
```

Use `whereis`, `which`, `type`, `find`, and `locate` to find `passwd` and explain differences.

## Cleanup

```bash
cd /
rm -rf "$LAB_DIR"
```

## Validation

- You can calculate permissions in both notation styles.
- You can explain directory execute permission.
- You can distinguish SUID, SGID, and sticky bit.
- You can explain inode behavior for both link types.
