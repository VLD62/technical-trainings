# Security and Operations Notes

## 1. Shared Responsibility by Layer

### Virtual Machine Stack

| Layer | Typical Responsibilities |
|---|---|
| Hardware and firmware | Platform updates, secure boot, hardware health |
| Hypervisor and host | Patching, access control, logging, capacity, network configuration |
| VM definition | CPU, memory, devices, disks, network, secure boot settings |
| Guest OS | Accounts, packages, firewall, patching, monitoring |
| Application | Dependencies, secrets, data protection, logging |

### Container Stack

| Layer | Typical Responsibilities |
|---|---|
| Host kernel | Security updates, hardening, resource capacity |
| Engine and runtime | Patching, configuration, authorization, logging |
| Image pipeline | Trusted source, scanning, signing, rebuilds |
| Container configuration | User, capabilities, mounts, networks, limits |
| Application | Dependencies, secrets, input validation, observability |

## 2. VM Security Practices

- Restrict hypervisor management access.
- Separate management, storage, migration, and workload traffic where required.
- Use standardized and maintained guest templates.
- Disable unnecessary virtual devices.
- Encrypt sensitive virtual disks and backups.
- Avoid indefinite snapshot chains.
- Track guest owners, purpose, and lifecycle state.
- Test backup restore, not only backup creation.

## 3. Container Security Practices

- Run the application as a non-root user.
- Prefer rootless containers when supported by the workload.
- Avoid `--privileged` and broad device access.
- Do not mount the container engine socket into application containers.
- Drop unneeded capabilities.
- Use read-only root filesystems where practical.
- Mount only required host paths and prefer read-only mounts.
- Apply memory, CPU, and process limits.
- Separate workloads with appropriate networks.
- Use secret stores rather than image layers or plain environment files.

## 4. Image Governance

- Approve trusted registries and base images.
- Use explicit tags or digests.
- Record the source commit and build process.
- Scan operating-system packages and application dependencies.
- Rebuild when a base image receives security fixes.
- Remove build tools from final runtime images using multi-stage builds.
- Keep images small enough to review and distribute efficiently.
- Define retention policies for old and unreferenced images.

## 5. Resource Governance

Without limits, a single VM or container can affect neighboring workloads.

Plan and monitor:

- CPU requests, quotas, and overcommitment
- Memory limits and out-of-memory behavior
- Storage capacity and I/O latency
- Network bandwidth and connection counts
- Process and file-descriptor limits

## 6. Persistent Data

For VMs:

- Understand whether the virtual disk, guest filesystem, and application data are crash-consistent.
- Coordinate application-aware backups where required.

For containers:

- Keep durable state outside the writable container layer.
- Back up volumes and external services separately.
- Test recreation of the container from image and configuration alone.

## 7. Logging and Audit

Collect logs from:

- Hypervisor and host services
- VM guest systems
- Container engine and runtime
- Container standard output and standard error
- Application-specific log and audit streams

Include identity and change context for management operations.

## 8. Troubleshooting Discipline

Use a layered approach:

1. Confirm scope and recent changes.
2. Check host capacity and service health.
3. Check workload lifecycle state.
4. Read logs before changing configuration.
5. Confirm network and storage dependencies.
6. Compare actual runtime configuration with the source definition.
7. Reproduce in a controlled lab when possible.
8. Record the root cause and prevention action.

## 9. Technology Selection

Do not decide only from startup speed or familiarity.

Evaluate:

- Required kernel and operating system
- Isolation and compliance
- Workload lifecycle
- Persistence model
- Scaling behavior
- Existing platform capabilities
- Skills and support model
- Recovery and business continuity
- Total operational cost
