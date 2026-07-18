---
marp: true
paginate: true
title: Virtual Machines vs Containers
---

# Virtual Machines vs Containers

---

# Three Deployment Models

## Bare Metal

One operating system controls the physical host.

## Virtual Machines

Each workload boundary includes a guest operating system.

## Containers

Each workload boundary is an isolated process environment that normally shares the host kernel.

---

# Conceptual Analogy

- **Bare metal** - a private house: complete control of the whole property
- **Virtual machine** - an apartment: private rooms and utilities inside a shared building
- **Container** - a private workspace in a shared facility: isolated activity with more shared infrastructure

Analogies are useful, but technical decisions must use real requirements.

---

# Architecture Comparison

| Characteristic | Bare Metal | Virtual Machine | Container |
|---|---|---|---|
| Operating system | One host OS | One guest OS per VM | Shared host kernel |
| Isolation boundary | Physical host | Virtual hardware and guest OS | Process and kernel controls |
| Startup | Full host boot | Guest OS boot | Process startup |
| Resource overhead | Entire machine | Guest OS per VM | Application and userspace |
| OS diversity | One host platform | High | Limited by host kernel family |
| Packaging portability | Low | Medium | High when platform-compatible |

---

# Isolation Is Not Binary

Isolation depends on configuration and implementation.

Questions to ask:

- Is the kernel shared?
- Is hardware virtualization used?
- Are user namespaces enabled?
- Are capabilities reduced?
- Are security profiles applied?
- Are devices exposed?
- Are host directories mounted?
- Is the runtime rootless?

A badly configured VM or container can weaken its intended boundary.

---

# Performance and Density

Containers usually achieve higher density because they avoid a full guest OS per workload.

VMs can provide near-native performance with hardware acceleration, but each VM reserves or consumes resources for its guest system.

Measure the actual workload:

- CPU
- Memory
- Storage I/O
- Network I/O
- Startup latency
- Operational overhead

---

# Portability

## VMs

A VM image can package an entire operating-system environment, but image size and hypervisor format may affect portability.

## Containers

An image packages application userspace, but must match the target CPU architecture and kernel expectations.

"Runs anywhere" always has platform conditions.

---

# Patching Responsibility

## VM

Patch:

- Hypervisor and host
- Guest operating system
- Application and dependencies

## Container

Patch:

- Host kernel and runtime
- Base image
- Application and dependencies
- Rebuild and redeploy the image

Containers reduce some packaging overhead, but do not eliminate patching.

---

# Persistent Data

VMs often treat virtual disks as durable guest storage.

Containers are frequently designed as replaceable instances:

- Keep application state outside the writable container layer
- Use managed databases, volumes, or object storage
- Back up persistent data separately
- Recreate containers from versioned images

---

# Networking

VM networking often resembles physical networking:

- Virtual NIC
- Virtual switch or bridge
- VLAN or routed network

Container networking is more dynamic:

- Per-container network namespaces
- Bridge or overlay networks
- Port publishing
- Service discovery
- Short-lived endpoints

---

# When VMs Are a Strong Choice

- Different guest operating systems are required
- Full kernel control is needed
- Stronger workload separation is required
- Legacy applications expect a complete OS
- Existing operations are VM-centered
- Hardware or driver access is guest-specific

---

# When Containers Are a Strong Choice

- Application packaging must be consistent
- Workloads need fast creation and removal
- High density matters
- CI/CD needs disposable workers
- Services are independently deployable
- The organization uses cloud-native operations

---

# Hybrid Architecture

A common production pattern is:

```text
Physical Infrastructure
        |
Virtual Machines
        |
Container Runtime
        |
Containerized Applications
```

Why combine them?

- VM-level infrastructure boundaries
- Container-level application packaging
- Flexible capacity management
- Familiar cloud operating model

---

# Decision Checklist

1. Does the workload require a different OS or kernel?
2. What isolation boundary is required?
3. How quickly must instances start and scale?
4. How much density is needed?
5. Where does persistent state live?
6. Which management tooling already exists?
7. What compliance and audit controls apply?
8. Who patches each layer?

---

# Key Takeaway

Virtual machines and containers solve different layers of the problem.

Choose based on workload boundaries and operational requirements, not fashion.
