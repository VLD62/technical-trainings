---
marp: true
paginate: true
title: Cloud Native Foundations and Containers
---

# Cloud Native Foundations

## From applications to distributed systems

---

# What Does Cloud Native Mean?

Cloud native is an approach to building and running applications that emphasizes:

- Automation
- Resilience
- Scalability
- Declarative configuration
- Loose coupling
- Observability
- Frequent, controlled change

Cloud native does not require a public cloud. The same principles can be used on-premises, at the edge, or in hybrid environments.

---

# Traditional and Cloud Native Delivery

| Traditional pattern | Cloud native pattern |
|---|---|
| Long-lived servers | Replaceable workloads |
| Manual configuration | Declarative configuration |
| Large releases | Small frequent changes |
| Vertical scaling | Horizontal scaling |
| Host-focused monitoring | Service and workload observability |
| Tight component coupling | API-driven loose coupling |

---

# Containers

A container packages an application and its runtime dependencies while sharing the host kernel.

Key properties:

- Process isolation
- Filesystem isolation
- Resource controls
- Portable image format
- Fast startup compared with full virtual machines
- Repeatable build and deployment workflow

---

# Image, Container, Registry

- **Image**: immutable application template composed of layers
- **Container**: running instance of an image
- **Registry**: service that stores and distributes images
- **Tag**: mutable human-readable image reference
- **Digest**: content-addressed immutable image reference

A secure workflow prefers trusted registries, minimal images, scanning, signing, and explicit versions.

---

# Container Runtime Layers

```text
Kubernetes
   |
Container Runtime Interface (CRI)
   |
High-level runtime: containerd or CRI-O
   |
OCI runtime: runc or crun
   |
Linux namespaces, cgroups, capabilities, seccomp
```

The interfaces reduce coupling between Kubernetes and specific runtime implementations.

---

# Why Orchestration?

Running one container is easy. Operating many distributed containers requires automation for:

- Placement
- Restart and reconciliation
- Scaling
- Service discovery
- Load balancing
- Configuration
- Secret delivery
- Storage
- Rollouts and rollback
- Health and observability

---

# Desired State and Reconciliation

A declarative system separates:

- **Desired state**: what the user requests
- **Current state**: what exists now
- **Controller loop**: continuous comparison and corrective action

This model is central to Kubernetes.

---

# Cloud Native Design Principles

Useful exam reasoning patterns:

- Prefer automation over manual repair
- Design for failure and replacement
- Keep state external or explicitly managed
- Scale horizontally when appropriate
- Use APIs and open interfaces
- Make health and telemetry visible
- Apply least privilege and defense in depth
