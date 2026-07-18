# Compute, Placement, and Images

## Session 3

---

## Nova Components

Typical Nova services include:

- API
- Scheduler
- Conductor
- Compute
- Console proxy
- Metadata integration

Nova coordinates other services rather than implementing every dependency itself.

---

## Placement

Placement tracks resource providers, inventories, traits, allocations, and aggregates.

Examples of resources:

- vCPU
- Memory
- Disk
- PCI devices
- Custom resource classes

Nova asks Placement for candidates before scheduling.

---

## Flavors

A flavor defines a compute shape:

- vCPU count
- RAM
- Root disk
- Ephemeral disk
- Swap
- Extra specifications

Extra specifications can request capabilities such as CPU policy, huge pages, NUMA behavior, or hardware traits.

---

## Images and Glance

Glance stores image metadata and coordinates image data backends.

Common formats:

- qcow2
- raw
- vmdk
- iso
- vhd or vhdx in selected workflows

The supported format is not the same as the best format for every backend.

---

## Image Hygiene

Before publishing an image:

- Patch the operating system
- Remove temporary users and credentials
- Clear machine identity and host keys when appropriate
- Install and configure cloud-init
- Remove logs and caches
- Validate boot mode and disk controller compatibility
- Record source, checksum, owner, and lifecycle date

---

## Instance Build Flow

```text
User -> Nova API -> Scheduler -> Compute
                    |           |-- Glance image
                    |           |-- Neutron ports
                    |           |-- Cinder volumes
                    +-- Placement candidates
```

A failure may originate in any participating service.

---

## Key Pairs and Cloud-Init

Key pairs provide initial SSH access.

Cloud-init can configure:

- Users and SSH keys
- Packages
- Files
- Hostname
- Commands
- Network behavior in supported images

Do not place reusable secrets in user data.

---

## Server Groups

Server groups influence placement:

- Affinity
- Anti-affinity
- Soft affinity
- Soft anti-affinity

Use them to express workload placement goals, not as a substitute for infrastructure failure-domain design.

---

## Instance Lifecycle

Common actions:

- Start and stop
- Reboot
- Resize
- Rebuild
- Rescue
- Snapshot
- Shelve and unshelve
- Migrate or live migrate
- Evacuate after host failure

Each action has storage, networking, and scheduling implications.

---

## Scheduling Inputs

Scheduling can consider:

- Resource capacity
- Traits
- Host aggregates
- Availability zones
- Server groups
- NUMA and CPU policy
- PCI devices and accelerators
- Image properties
- Weighers and filters

---

## Compute Troubleshooting

Check in order:

1. Server status and fault
2. Request ID
3. Nova service state
4. Hypervisor capacity
5. Placement allocations
6. Image availability
7. Network port state
8. Volume state
9. Compute logs and libvirt state

Avoid immediately rebuilding or deleting the server before collecting evidence.
