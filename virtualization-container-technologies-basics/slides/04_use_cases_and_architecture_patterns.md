---
marp: true
paginate: true
title: Use Cases and Architecture Patterns
---

# Use Cases and Architecture Patterns

---

# Virtualization Use Case: Multiple Operating Systems

One physical host can run several guest systems:

```text
Linux VM     Windows VM     BSD VM
    \            |            /
              Hypervisor
                  |
             Physical Host
```

Useful for:

- Compatibility testing
- Platform-specific applications
- Training and certification labs
- Consolidating low-utilization servers

---

# Virtualization Use Case: Dev and QA Environments

A VM can represent a complete test environment with:

- A selected operating-system version
- Specific system libraries
- Services and middleware
- Network configuration
- Test data

Snapshots can speed up reset and repeat workflows, but they are not a substitute for backups.

---

# Virtualization Use Case: Legacy Systems

A VM can preserve an older runtime environment when immediate modernization is not possible.

Controls should include:

- Network isolation
- Restricted access
- Documented ownership
- Backups and recovery tests
- A migration or retirement plan

Virtualization can contain technical debt; it does not remove it.

---

# Container Use Case: CI/CD Agents

Disposable container workers can provide:

- Consistent tools and versions
- Isolated build dependencies
- Fast creation and cleanup
- Parallel execution
- Versioned build environments

The pipeline still needs secure credentials, trusted images, and controlled host access.

---

# Container Use Case: Development Environments

A repository can define its environment using:

- Dockerfile or Containerfile
- Compose file
- Environment templates
- Seed data
- Startup scripts

Benefits:

- Faster onboarding
- Fewer local dependency conflicts
- Better parity between developers and CI

---

# Container Use Case: Microservices

Each service can have:

- Its own image
- Independent release cycle
- Resource limits
- Health checks
- Scaling policy
- Network identity

This flexibility increases the need for observability, automation, and ownership clarity.

---

# Pattern: VM Running Containers

```text
+-----------------------------------+
| VM Guest OS                       |
| +-----------+ +-----------------+ |
| | Container | | Container       | |
| | Service A | | Service B       | |
| +-----------+ +-----------------+ |
+-----------------------------------+
| Hypervisor                        |
+-----------------------------------+
| Physical Infrastructure           |
+-----------------------------------+
```

A common choice in private clouds and public cloud instances.

---

# Pattern: Local Compose Stack

```text
Browser -> Reverse Proxy -> Application
                         -> Supporting Service
```

Compose provides a repeatable local environment for:

- Development
- Integration testing
- Demonstrations
- Small training labs

It is not automatically a production orchestration strategy.

---

# Pattern: Clustered Container Platform

```text
Control Plane
    |
+---------+---------+---------+
| Node A  | Node B  | Node C  |
| Pods    | Pods    | Pods    |
+---------+---------+---------+
```

The platform schedules workloads, maintains desired state, and reacts to failures.

Applications should be designed for replacement, health checks, and distributed operation.

---

# Pattern: Cloud Development Workspace

A managed workspace may provide:

- VM or container compute
- Browser or remote IDE access
- Version-controlled templates
- Standard tools
- Central policy and lifecycle management

The user experience hides infrastructure details, but the same VM and container concepts still apply.

---

# Anti-Pattern: Treating Containers as Tiny VMs

Warning signs:

- Running many unrelated services in one container
- Installing packages manually into running containers
- Keeping important state only in the writable layer
- Using SSH as the normal management path
- Never rebuilding the image

Prefer declarative images and replaceable instances.

---

# Anti-Pattern: VM Sprawl

Warning signs:

- Unknown owners
- Forgotten snapshots
- Unpatched guest systems
- Overallocated CPU and memory
- Duplicate environments
- No retirement process

Use inventory, ownership, lifecycle automation, and capacity reporting.

---

# Architecture Review Questions

- What is the workload unit: machine, service, job, or function?
- Which components are stateful?
- What must survive instance replacement?
- Which network paths are required?
- What is the recovery model?
- How is the workload observed?
- How are images and templates updated?
- Where are secrets stored?

---

# Key Takeaway

The best architecture often combines technologies.

Use each layer for the boundary it handles well.
