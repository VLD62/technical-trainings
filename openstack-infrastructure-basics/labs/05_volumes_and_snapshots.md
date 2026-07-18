# Lab 05 - Volumes and Snapshots

## Goal

Create a block volume, attach it to an instance, write data, and understand snapshot behavior.

## 1. Create a Server

Reuse a small authorized instance or create a temporary one.

```bash
export SERVER_ID=<server-id>
export LAB_VOLUME="oslab-${USER}-volume"
export LAB_SNAPSHOT="oslab-${USER}-snapshot"
```

## 2. Create a Volume

```bash
openstack --os-cloud training volume create --size 2 "$LAB_VOLUME"
openstack --os-cloud training volume show "$LAB_VOLUME"
```

Optional: select a volume type with `--type` when instructed.

## 3. Attach the Volume

```bash
openstack --os-cloud training server add volume "$SERVER_ID" "$LAB_VOLUME"
openstack --os-cloud training volume show "$LAB_VOLUME"
openstack --os-cloud training volume attachment list --server "$SERVER_ID"
```

## 4. Inside the Instance

Identify the new device carefully:

```bash
lsblk
sudo blkid
```

For a new empty device only:

```bash
sudo mkfs.ext4 /dev/<new-device>
sudo mkdir -p /mnt/training-volume
sudo mount /dev/<new-device> /mnt/training-volume
echo "OpenStack block storage lab" | sudo tee /mnt/training-volume/message.txt
sync
```

Never format a device until you have positively identified it.

## 5. Snapshot

For application consistency, stop writes or unmount the filesystem first.

```bash
sudo umount /mnt/training-volume
openstack --os-cloud training volume snapshot create \
  --volume "$LAB_VOLUME" \
  "$LAB_SNAPSHOT"
```

If the cloud requires detachment for snapshots, detach first.

## 6. Inspect

```bash
openstack --os-cloud training volume snapshot show "$LAB_SNAPSHOT"
openstack --os-cloud training volume show "$LAB_VOLUME"
```

## 7. Cleanup

```bash
openstack --os-cloud training server remove volume "$SERVER_ID" "$LAB_VOLUME" || true
openstack --os-cloud training volume snapshot delete "$LAB_SNAPSHOT"
openstack --os-cloud training volume delete "$LAB_VOLUME"
```

## Review

- Why is a filesystem snapshot not automatically application-consistent?
- Why is a snapshot not necessarily an independent backup?
- Which service manages attachment state?
