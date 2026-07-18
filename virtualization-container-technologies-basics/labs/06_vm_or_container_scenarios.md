# Lab 06 - VM or Container Decision Scenarios

## Goal

Select an appropriate technology and justify the decision using requirements rather than preference.

For each scenario, choose:

- Bare metal
- Virtual machine
- Container
- Hybrid architecture

Then record the key trade-offs.

## Scenario 1 - Legacy Windows Application

An application requires an unsupported Windows version and a kernel-level driver. It cannot be rebuilt in the next six months.

Consider:

- Guest OS requirement
- Network isolation
- Security risk
- Backup and retirement plan

## Scenario 2 - Disposable CI Worker

A build job needs Python, Git, and a compiler. It should start quickly, run once, upload an artifact, and disappear.

Consider:

- Reproducibility
- Startup time
- Credential access
- Host isolation

## Scenario 3 - Multi-Tenant Untrusted Workloads

Different customers submit workloads that cannot trust each other. Strong separation is required.

Consider:

- Shared kernel risk
- VM or sandboxed runtime options
- Resource quotas
- Network policy

## Scenario 4 - Local Development Stack

A developer needs a web application, reverse proxy, database, and cache with repeatable versions.

Consider:

- Compose workflow
- Persistent volumes
- Port conflicts
- Onboarding time

## Scenario 5 - High-Performance Appliance

A latency-sensitive network appliance needs direct access to dedicated hardware and predictable CPU scheduling.

Consider:

- Bare metal
- Device passthrough
- Real-time requirements
- Operational complexity

## Scenario 6 - Cloud-Native Web Platform

Several independently deployed services need rolling updates, horizontal scaling, and automated recovery.

Consider:

- Containers and orchestration
- State management
- Observability
- Image supply chain

## Suggested Answer Pattern

```text
Choice:
Primary reason:
Required isolation boundary:
State location:
Operational tooling:
Security controls:
Main trade-off:
```

There may be more than one valid design. A good answer explains why the chosen boundary satisfies the requirements.
