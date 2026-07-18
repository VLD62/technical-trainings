# Lab 2 – Disk, Partition, and Filesystem Practice

## Objectives

- Create a safe file-backed block device
- Create a GPT partition table and partition
- Format, mount, and inspect a filesystem
- Configure a sample persistent mount entry
- Clean up completely

## Safety

Every destructive command must target the loop device created in this lab. Never substitute a physical system disk.

## Tasks

### 1. Create a test disk image

```bash
truncate -s 1G /tmp/lpic-disk.img
LOOP_DEV=$(sudo losetup --find --show --partscan /tmp/lpic-disk.img)
printf 'Loop device: %s\n' "$LOOP_DEV"
lsblk "$LOOP_DEV"
```

Keep the variable in the same shell.

### 2. Create a GPT partition

```bash
sudo parted -s "$LOOP_DEV" mklabel gpt
sudo parted -s "$LOOP_DEV" mkpart primary ext4 1MiB 100%
sudo partprobe "$LOOP_DEV"
lsblk "$LOOP_DEV"
```

Identify the partition path, commonly `${LOOP_DEV}p1`.

### 3. Create and inspect an ext4 filesystem

```bash
PARTITION="${LOOP_DEV}p1"
sudo mkfs.ext4 -L LPICLAB "$PARTITION"
sudo blkid "$PARTITION"
```

Record the filesystem UUID and label.

### 4. Mount and use the filesystem

```bash
sudo mkdir -p /mnt/lpic-lab
sudo mount "$PARTITION" /mnt/lpic-lab
findmnt /mnt/lpic-lab
df -hT /mnt/lpic-lab
sudo sh -c 'echo "LPIC filesystem lab" > /mnt/lpic-lab/README.txt'
ls -la /mnt/lpic-lab
```

### 5. Create a sample fstab entry

Do not edit the real `/etc/fstab`. Generate an example:

```bash
UUID=$(sudo blkid -s UUID -o value "$PARTITION")
printf 'UUID=%s /mnt/lpic-lab ext4 defaults,nofail 0 2\n' "$UUID" | tee /tmp/lpic-fstab.example
sudo mount -a -f -T /tmp/lpic-fstab.example
```

Explain each field.

### 6. Inspect capacity and inodes

```bash
df -hT /mnt/lpic-lab
df -i /mnt/lpic-lab
du -sh /mnt/lpic-lab
```

### 7. Clean up

```bash
sudo umount /mnt/lpic-lab
sudo losetup -d "$LOOP_DEV"
rm -f /tmp/lpic-disk.img /tmp/lpic-fstab.example
sudo rmdir /mnt/lpic-lab
```

## Validation

- `losetup -a` no longer lists the image.
- `/mnt/lpic-lab` is not mounted.
- You can explain GPT, partition, filesystem, UUID, label, and mount point as separate concepts.
- You can explain why filesystem checks normally require an unmounted filesystem.

## Challenge

Repeat the lab with XFS if supported. Compare available repair and tuning tools with ext4. Do not assume the commands are interchangeable.
