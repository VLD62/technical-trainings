---
marp: true
paginate: true
title: Operations, Security, and Next Steps
---

# Operations, Security, and Next Steps

---

# Security Is Layered

For virtual machines:

- Firmware and hardware
- Hypervisor and host
- Virtual network and storage
- Guest operating system
- Application

For containers:

- Host kernel
- Container engine and runtime
- Image supply chain
- Container configuration
- Application

A secure workload depends on every layer below it.

---

# Container Hardening Basics

- Run as a non-root user
- Prefer rootless operation where practical
- Drop unnecessary Linux capabilities
- Avoid privileged containers
- Use read-only filesystems where possible
- Mount only required paths
- Apply CPU, memory, and process limits
- Use security profiles supported by the platform
- Do not expose the runtime socket to application containers

---

# Image Supply Chain

- Use trusted image sources
- Prefer minimal base images
- Pin versions or digests in controlled environments
- Scan images and dependencies
- Generate software bills of materials where required
- Sign and verify release artifacts
- Rebuild images when base layers are patched
- Remove unused packages and build tools from final images

---

# VM Operational Controls

- Standardize VM templates
- Patch host and guest systems
- Track owners and business purpose
- Limit snapshot age
- Back up data independently of snapshots
- Monitor capacity and overcommitment
- Test recovery procedures
- Retire unused guests

---

# Observability

Monitor the appropriate layer:

- Physical host health
- Hypervisor capacity and errors
- VM guest health
- Container runtime health
- Container restarts and resource use
- Application metrics, logs, and traces

A green infrastructure layer does not guarantee a healthy application.

---

# Common VM Troubleshooting Questions

- Is hardware virtualization enabled?
- Is the hypervisor service running?
- Does the host have enough CPU, memory, and disk?
- Is the virtual disk accessible?
- Is the VM connected to the expected network?
- Did a snapshot or migration operation fail?
- Does the guest boot log show an OS problem?

---

# Common Container Troubleshooting Questions

- Did the main process exit?
- Is the image correct for the CPU architecture?
- Are required environment variables present?
- Is the port published and the application listening?
- Can the service resolve dependencies?
- Are mounted files readable by the container user?
- Did the workload exceed its memory limit?
- Is the image pull authorized?

---

# Choosing the Technology

Choose a VM when the guest OS is part of the required boundary.

Choose a container when the application process is the required boundary and the host kernel can be shared.

Choose a hybrid model when infrastructure and application teams need both boundaries.

---

# What to Learn Next

## Virtualization

- KVM and QEMU
- libvirt and virsh
- Virtual networking
- Storage pools and snapshots
- Cloud-init
- Infrastructure as code

## Containers

- Dockerfile design
- Rootless Podman
- OCI images and runtimes
- Registries and image security
- Kubernetes fundamentals
- Observability and policy enforcement

---

# Final Summary

- Virtualization abstracts hardware and provides guest operating systems
- Containers isolate application processes while normally sharing the host kernel
- VMs provide OS flexibility and stronger workload separation
- Containers provide lightweight packaging and fast lifecycle operations
- Hybrid architectures are common
- Security, patching, networking, storage, and observability remain essential

---

# Final Decision Principle

> Use the smallest boundary that safely satisfies the workload requirements.

Smaller boundaries improve efficiency.

Stronger boundaries improve separation.

Good architecture balances both.
