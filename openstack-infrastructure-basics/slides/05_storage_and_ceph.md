# Storage Services and Ceph Integration

## Session 5

---

## Storage Models

OpenStack commonly exposes:

- Ephemeral instance disks
- Block storage
- Object storage
- Shared filesystems

Each model has different APIs, consistency expectations, performance patterns, and failure behavior.

---

## Ephemeral Storage

Ephemeral disks are tied to an instance lifecycle.

Consider:

- Local versus shared backend
- Resize and migration behavior
- Host failure
- Snapshot workflow
- Performance and capacity isolation

Do not store irreplaceable application state only on ephemeral disks.

---

## Cinder Block Storage

Cinder manages volumes, snapshots, backups, attachments, and volume types.

A volume type can map user intent to:

- Backend
- Performance tier
- Replication capability
- Encryption
- Availability zone
- Extra specifications

---

## Object Storage

Object storage is accessed through an API rather than a mounted block device.

Use cases:

- Backups
- Artifacts
- Images
- Logs
- Application objects

OpenStack Swift and Ceph RGW can provide object interfaces with different architecture and operational models.

---

## Manila Shared Filesystems

Manila provides shared filesystems as a service.

Possible protocols and backends include:

- NFS
- SMB
- CephFS
- Vendor storage systems

Network reachability and share-access rules are central to Manila design.

---

## Ceph Integration

Ceph can provide:

- RBD for Glance, Nova, and Cinder
- CephFS for Manila
- RGW for object storage

A single cluster may support multiple use cases, but workload isolation and recovery impact must be designed explicitly.

---

## Ceph Building Blocks

- MON - cluster maps and quorum
- MGR - management modules and metrics
- OSD - data storage and replication
- MDS - CephFS metadata
- RGW - object gateway
- CRUSH - deterministic data placement
- Pools - logical data groupings

---

## Failure Domains

CRUSH failure domains can model:

- OSD
- Host
- Chassis
- Rack
- Room
- Datacenter

Replication across three OSDs on one host does not protect against host failure.

---

## Capacity Planning

Account for:

- Replication or erasure-coding overhead
- Recovery headroom
- Reserved free space
- Snapshots and clones
- Image growth
- Backup retention
- Uneven device utilization
- Rebalance and failure recovery

Raw capacity is not usable capacity.

---

## Performance Questions

- SSD, HDD, or mixed media?
- Separate WAL/DB devices?
- Network bandwidth and latency?
- Small random I/O or sequential throughput?
- Recovery load?
- Client queue depth?
- Encryption overhead?
- Noisy-neighbor controls?

---

## Storage Troubleshooting

1. Confirm resource status in OpenStack
2. Check attachment and connector state
3. Check backend service and pool health
4. Check capacity and placement groups
5. Check network path between clients and storage
6. Review latency, errors, and recovery activity
7. Protect evidence before forcing detach or deleting resources
