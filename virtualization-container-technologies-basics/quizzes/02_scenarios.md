# Quiz 02 - Scenario Decisions

For each scenario, select a primary design and explain one alternative.

## 1. Kernel Module Development

A team develops and tests custom Linux kernel modules against several kernel versions.

Questions:

- VM or container?
- What must be isolated?
- What does the test environment need to control?

<details>
<summary>Suggested direction</summary>

Virtual machines are normally the stronger default because each test needs its own kernel. Containers share the host kernel unless a more specialized sandbox or VM-backed runtime is used.

</details>

## 2. Static Website Build

A pipeline runs a documentation generator, publishes files, and exits.

<details>
<summary>Suggested direction</summary>

A disposable container is a good fit because the job is short-lived, repeatable, and does not require a different kernel.

</details>

## 3. Old Database Appliance

A vendor only supports a specific legacy operating system and fixed system configuration.

<details>
<summary>Suggested direction</summary>

A VM can preserve the complete supported operating-system environment. Add network restrictions, backups, ownership, and a retirement plan.

</details>

## 4. Public Multi-Tenant Code Runner

Users submit arbitrary code through a public service.

<details>
<summary>Suggested direction</summary>

Do not rely on a default container boundary alone. Consider per-tenant VMs, microVMs, sandboxed runtimes, strict quotas, network controls, and strong host isolation.

</details>

## 5. Developer Application Stack

The stack contains a web service, reverse proxy, database, and cache.

<details>
<summary>Suggested direction</summary>

Containers with Compose provide a repeatable local workflow. Persistent data, initialization, health checks, and port configuration must be explicit.

</details>

## 6. Container Platform Nodes

A company wants to operate Kubernetes on infrastructure that can be scaled and maintained independently.

<details>
<summary>Suggested direction</summary>

A hybrid design is common: Kubernetes nodes run as VMs, and the application workloads run as containers inside those nodes.

</details>

## 7. Dedicated High-Performance Database

A database requires predictable I/O, large memory, and strict latency targets.

<details>
<summary>Suggested direction</summary>

Bare metal or a carefully tuned VM may be appropriate. The decision should be based on measured latency, storage design, failover, and operational requirements rather than a universal rule.

</details>

## 8. Security Review

A container runs as root, mounts `/`, uses `--privileged`, and has access to the engine socket.

<details>
<summary>Suggested direction</summary>

The configuration effectively removes major isolation controls. Redesign the workload to use least privilege, narrow mounts, dropped capabilities, no runtime socket, explicit limits, and a non-root user.

</details>
