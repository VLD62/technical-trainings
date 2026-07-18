---
marp: true
paginate: true
title: Virtualization Fundamentals
---

# Virtualization Fundamentals

---

# What Is Virtualization?

Virtualization introduces an abstraction layer between physical resources and the systems that consume them.

It can provide virtual versions of:

- Servers
- Storage
- Networks
- Desktops
- Devices

The most familiar form is server virtualization with virtual machines.

---

# Physical Server Without Virtualization

```text
+---------------------------+
| Application               |
+---------------------------+
| Operating System          |
+---------------------------+
| Physical CPU / RAM / Disk |
+---------------------------+
```

One operating system controls the physical machine directly.

This can provide a simple and strong ownership boundary, but may underuse resources.

---

# Virtual Machine Architecture

```text
+-----------+ +-----------+ +-----------+
| App       | | App       | | App       |
| Guest OS  | | Guest OS  | | Guest OS  |
+-----------+ +-----------+ +-----------+
|          Hypervisor                  |
+--------------------------------------+
| Physical CPU / RAM / Disk / Network  |
+--------------------------------------+
```

Each VM receives virtual CPU, memory, storage, network devices, and its own guest OS.

---

# What Does a Hypervisor Do?

A hypervisor:

- Creates and removes virtual machines
- Maps virtual hardware to physical resources
- Schedules virtual CPUs
- Allocates and protects memory
- Connects virtual storage and networks
- Enforces isolation between guests
- Supports lifecycle operations such as start, stop, pause, and migration

---

# Type 1 Hypervisor

A Type 1, or bare-metal, hypervisor runs directly on the host hardware or as the primary virtualization layer.

Common examples:

- VMware ESXi
- Microsoft Hyper-V Server architecture
- KVM as part of the Linux kernel virtualization stack
- Xen

Typical use:

- Data centers
- Private cloud
- Production virtualization platforms

---

# Type 2 Hypervisor

A Type 2, or hosted, hypervisor runs as an application on a general-purpose host operating system.

Common examples:

- Oracle VirtualBox
- VMware Workstation or Fusion
- Parallels Desktop

Typical use:

- Developer workstations
- Training labs
- Desktop testing
- Multi-OS experimentation

---

# QEMU, KVM, and libvirt

These names describe different layers:

- **KVM** provides hardware-assisted virtualization through the Linux kernel
- **QEMU** provides machine emulation and virtual devices
- **libvirt** provides a management API and tools for multiple virtualization backends
- **virsh** is a command-line interface for libvirt-managed guests

They are commonly used together, but they are not the same component.

---

# Virtual Storage

Virtual storage can present logical disks independently of physical devices.

Examples:

- Virtual disk image files
- Logical volumes
- Storage pools
- Thin provisioning
- Snapshots
- Network-backed block devices

Benefits:

- Flexible allocation
- Easier migration and backup
- Consistent interfaces for guests

---

# Virtual Networking

Virtual networking connects guests without requiring a separate physical interface for each VM.

Common building blocks:

- Virtual switches and bridges
- NAT networks
- Routed networks
- VLANs
- Overlay networks
- Virtual network interfaces

The network design determines reachability, isolation, and performance.

---

# VM Lifecycle

```text
Define -> Provision -> Start -> Operate -> Snapshot/Backup -> Stop -> Remove
```

Operational questions:

- Where is the VM definition stored?
- Where is the virtual disk stored?
- How is the guest patched?
- How are snapshots and backups managed?
- What happens when the host fails?

---

# Virtualization Strengths

- Strong guest operating-system boundaries
- Different operating systems on the same host
- Support for legacy software
- Mature lifecycle and migration tooling
- Full kernel control inside each guest
- Clear resource allocation per VM

---

# Virtualization Trade-Offs

- Each VM includes a full guest operating system
- Higher memory and storage overhead
- Longer provisioning and startup than a process container
- Guest patching and image maintenance
- VM sprawl when lifecycle governance is weak

---

# Key Takeaway

Virtualization creates independently managed computers from shared physical infrastructure.

The guest operating system is part of the workload boundary.
