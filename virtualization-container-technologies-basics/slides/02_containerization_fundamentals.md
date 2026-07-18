---
marp: true
paginate: true
title: Containerization Fundamentals
---

# Containerization Fundamentals

---

# What Is a Container?

A container is an isolated process environment created from a container image.

A container typically receives:

- A filesystem view
- A process namespace
- A network namespace
- Resource controls
- Environment variables
- Mounted volumes
- A defined startup command

Containers on the same host normally share the host kernel.

---

# Container Architecture

```text
+-----------+ +-----------+ +-----------+
| App +     | | App +     | | App +     |
| Libraries | | Libraries | | Libraries |
+-----------+ +-----------+ +-----------+
| Container Engine / Runtime            |
+---------------------------------------+
| Shared Host Operating-System Kernel   |
+---------------------------------------+
| Physical or Virtual Infrastructure    |
+---------------------------------------+
```

---

# Image vs Container

## Image

- Read-only application package
- Contains filesystem layers and metadata
- Built from instructions such as a Dockerfile or Containerfile
- Stored locally or in a registry

## Container

- Runtime instance created from an image
- Has a writable layer
- Has process, network, and resource state
- Can be started, stopped, inspected, and removed

---

# Linux Namespaces

Namespaces limit what a process can see.

Common namespace types isolate:

- Process IDs
- Mount points
- Network interfaces and routes
- Hostname
- User and group IDs
- Inter-process communication

A container is still composed of host processes, but those processes receive a restricted view.

---

# Linux cgroups

Control groups account for and limit resources.

Common controls include:

- CPU time
- Memory
- Process count
- I/O behavior

Without appropriate limits, one workload may consume resources needed by others.

---

# Container Engine

A container engine is the user-facing management layer.

Typical responsibilities:

- Pull and store images
- Build images
- Create and run containers
- Configure networks and volumes
- Provide logs and inspection commands
- Communicate with lower-level runtime components

Examples:

- Docker Engine
- Podman

---

# Docker and Podman

## Docker

- Client-server architecture
- Docker CLI communicates with the Docker daemon
- Broad ecosystem and Compose integration

## Podman

- Daemonless command-line design
- Strong rootless workflow support
- Docker-compatible command patterns for many common tasks
- Supports containers, images, and pods

Tool choice depends on the platform, ecosystem, and operational requirements.

---

# Runtime Layers

A simplified runtime chain:

```text
User CLI
   |
Container engine or orchestration system
   |
High-level runtime: containerd or CRI-O
   |
Low-level OCI runtime: runc, crun, or another implementation
   |
Linux kernel features
```

Not every platform uses exactly the same chain.

---

# Registries

A registry distributes container images.

Common capabilities:

- Image repositories
- Tags and immutable digests
- Authentication and authorization
- Vulnerability scanning
- Retention policies
- Replication
- Signing and provenance metadata

Examples include Docker Hub, Harbor, Quay, and cloud-provider registries.

---

# OCI Standards

The Open Container Initiative defines specifications for:

- Image format
- Runtime behavior
- Image distribution

Standards improve interoperability between tools and platforms.

An OCI-compatible image can be used by multiple engines and runtimes, subject to platform compatibility.

---

# Docker Compose

Compose defines a multi-container application in YAML.

It can describe:

- Services
- Images or build contexts
- Ports
- Networks
- Volumes
- Environment variables
- Health checks
- Dependencies

Compose is especially useful for local development, demonstrations, and integration testing.

---

# Kubernetes Relationship

Kubernetes does not replace container images or runtimes.

It coordinates containers across a cluster by managing:

- Scheduling
- Desired state
- Replicas
- Networking and service discovery
- Configuration and secrets
- Health checks
- Rolling updates
- Recovery from failures

A working container runtime is required on each node.

---

# Container Strengths

- Fast process-level startup
- High workload density
- Portable application packaging
- Reproducible build and test environments
- Efficient CI/CD workers
- Strong fit for microservices and immutable delivery

---

# Container Trade-Offs

- Shared-kernel security considerations
- Persistent data requires explicit design
- Networking can become complex
- Image and dependency supply-chain risks
- Host kernel compatibility matters
- Uncontrolled images and tags reduce reproducibility

---

# Key Takeaway

A container packages an application and its userspace dependencies while normally sharing the host kernel.

The application process, not a full guest OS, is the main workload unit.
