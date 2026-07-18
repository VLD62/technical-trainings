# OpenStack Storage Notes

## 1. Storage Selection

| Requirement | Typical service |
|---|---|
| Boot disk tied to instance lifecycle | Nova ephemeral storage |
| Persistent attachable disk | Cinder |
| API-addressed objects | Swift or compatible object storage |
| Shared filesystem | Manila |
| Image repository | Glance with file, object, or RBD backend |

## 2. Cinder Concepts

- Volume
- Snapshot
- Backup
- Attachment
- Volume type
- Backend
- Availability zone
- Group and consistency-group features where supported

Volume status should be interpreted together with backend state and attachment records.

## 3. Ceph RBD Integration

A common design uses RBD pools for:

- Glance images
- Cinder volumes
- Nova ephemeral disks
- Cinder backups in selected designs

Benefits can include copy-on-write cloning and reduced data movement when services share the same Ceph cluster.

## 4. Pool Design

Separate pools can support:

- Different replication or erasure-coding profiles
- Different CRUSH rules
- Different quotas
- Operational isolation
- Clear ownership and monitoring

Too many pools can also add placement-group and management overhead.

## 5. Replication and Capacity

Example only:

```text
Raw capacity: 300 TB
Replication size: 3
Theoretical data capacity: about 100 TB
Operational headroom: keep a significant free-space margin
```

Actual usable capacity depends on device classes, pool rules, metadata, recovery reserve, snapshots, imbalance, and safety thresholds.

## 6. Recovery Behavior

When an OSD or host fails, Ceph may:

- Mark data degraded
- Re-replicate data
- Increase network and disk load
- Reduce client performance
- Require operator action if quorum or failure domains are affected

Capacity plans must include recovery, not only steady-state usage.

## 7. Network Design

Consider separating:

- Client I/O
- Cluster replication and recovery
- Management

At small scale, networks may be shared, but bandwidth and failure impact must still be measured.

## 8. Storage Troubleshooting Questions

- Is OpenStack reporting a control-plane state problem or a backend I/O problem?
- Is the backend full or near a safety threshold?
- Is the client keyring valid and authorized?
- Are monitors reachable?
- Is the pool healthy?
- Is recovery or rebalancing active?
- Is the attachment stale?
- Is multipath required and configured?
- Is the volume encrypted, replicated, or dependent on a snapshot?

## 9. Backup Principle

Snapshots are not automatically independent backups.

Define:

- Backup target
- Retention
- Encryption
- Restore testing
- Off-cluster or off-site copy
- Application consistency
- Recovery-time and recovery-point objectives
