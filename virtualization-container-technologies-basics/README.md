# Virtualization & Container Technologies: Basics

Welcome to the **Virtualization & Container Technologies: Basics** course.

This training provides reusable slides, reference documentation, practical labs, and generic examples for learning how virtual machines and containers work, where they differ, and how they are used in modern infrastructure and software delivery.

---

## Course Objectives

By the end of this course participants will:

- Explain the purpose of virtualization and containerization
- Distinguish bare metal, virtual machines, and containers
- Understand Type 1 and Type 2 hypervisors
- Recognize the roles of QEMU/KVM, libvirt, VirtualBox, Hyper-V, and VMware
- Explain images, containers, registries, engines, and runtimes
- Understand how namespaces and cgroups support container isolation
- Compare Docker and Podman at a conceptual level
- Understand the roles of containerd, runc, Docker Compose, and Kubernetes
- Select an appropriate technology for common engineering scenarios
- Build, run, inspect, limit, and troubleshoot a simple containerized application

---

## Course Structure

### Session 0 - Course Introduction

- Course scope and objectives
- Prerequisites and lab safety
- Recommended learning flow

### Session 1 - Virtualization Fundamentals

- Physical resources and abstraction
- Server, storage, and network virtualization
- Virtual machines and guest operating systems
- Type 1 and Type 2 hypervisors
- QEMU, KVM, libvirt, VirtualBox, Hyper-V, and VMware

### Session 2 - Containerization Fundamentals

- Images and containers
- Shared host kernel and process isolation
- Linux namespaces and cgroups
- Container engines, runtimes, and registries
- Docker, Podman, containerd, runc, and OCI standards

### Session 3 - Virtual Machines vs Containers

- Architecture comparison
- Isolation, startup, resource use, and portability
- Security boundaries and operational trade-offs
- Hybrid architectures

### Session 4 - Use Cases and Architecture Patterns

- Development and test environments
- Legacy workloads and multi-OS requirements
- CI/CD agents and reproducible builds
- Microservices and cloud-native applications
- VM-hosted container platforms

### Session 5 - Practical Container Workflows

- Pulling and running images
- Building a custom image
- Ports, environment variables, volumes, and networks
- Multi-container applications with Compose
- Inspection, logs, resource limits, and cleanup

### Session 6 - Operations, Security, and Next Steps

- Image provenance and versioning
- Rootless containers and least privilege
- Resource controls and persistent data
- Troubleshooting workflow
- Choosing between VMs, containers, and hybrid designs

### Session 7 - Labs and Knowledge Check

- Inspect host virtualization support
- Run a first container
- Build a container image
- Start a multi-container stack
- Compare VM and container characteristics
- Complete scenario-based quizzes

---

## Repository Structure

```text
virtualization-container-technologies-basics/
├── README.md
├── MANIFEST.md
├── Makefile
├── slides/
│   ├── 00_course_introduction.md
│   ├── 01_virtualization_fundamentals.md
│   ├── 02_containerization_fundamentals.md
│   ├── 03_virtual_machines_vs_containers.md
│   ├── 04_use_cases_and_architecture_patterns.md
│   ├── 05_practical_container_workflows.md
│   └── 06_operations_security_and_next_steps.md
├── docs/
│   ├── architecture_notes.md
│   ├── cheat_sheet.md
│   ├── glossary.md
│   ├── instructor_guide.md
│   ├── security_and_operations.md
│   └── useful_links.md
├── labs/
│   ├── README.md
│   ├── 01_inspect_host_virtualization.md
│   ├── 02_run_first_container.md
│   ├── 03_build_container_image.md
│   ├── 04_multi_container_compose.md
│   ├── 05_isolation_and_resource_limits.md
│   └── 06_vm_or_container_scenarios.md
├── examples/
│   ├── hello-container/
│   │   ├── Dockerfile
│   │   └── app.py
│   ├── compose-stack/
│   │   ├── compose.yaml
│   │   ├── app/
│   │   │   ├── Dockerfile
│   │   │   └── app.py
│   │   └── proxy/
│   │       └── nginx.conf
│   └── libvirt/
│       └── domain-example.xml
├── scripts/
│   ├── check_virtualization.sh
│   └── validate_content.py
└── quizzes/
    ├── 01_fundamentals.md
    └── 02_scenarios.md
```

---

## Prerequisites

Recommended knowledge:

- Basic Linux command-line usage
- Basic operating-system and networking concepts
- Familiarity with processes, files, ports, and services
- Git and a text editor

For container labs:

- Docker Engine with the Compose plugin, or Podman for the single-container exercises
- Permission to run containers on the local machine
- Internet access to pull public training images

For optional virtualization practice:

- A system with hardware virtualization enabled
- Linux with KVM/libvirt, or another local hypervisor
- Enough memory and disk space for a small guest operating system

No production infrastructure is required.

---

## Getting Started

Clone the repository and enter the course directory:

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/virtualization-container-technologies-basics
```

List the available materials:

```bash
make list
```

Validate the training package:

```bash
make validate
```

Check host virtualization capabilities:

```bash
make check-virtualization
```

Build and run the first container example:

```bash
make build
make run
```

Open the example in a browser:

```text
http://localhost:8080
```

Stop and remove the example:

```bash
make stop
```

Start the multi-container Compose lab:

```bash
make compose-up
```

Open:

```text
http://localhost:8081
```

Stop the stack:

```bash
make compose-down
```

---

## Recommended Learning Approach

For each session:

1. Review the corresponding slide deck
2. Read the related reference notes
3. Run the associated lab in an isolated environment
4. Modify one setting and observe the result
5. Record the operational and security implications
6. Complete the knowledge-check questions

The course can be delivered as:

- One compact 45-60 minute awareness session
- Two 60-minute sessions with demonstrations
- A half-day workshop including all labs

---

## Safety and Security Notes

- Run labs only on systems where you are authorized to install or execute virtualization and container software.
- Do not expose lab ports to untrusted networks.
- Do not mount sensitive host directories into containers.
- Do not place secrets directly in images, Compose files, or source control.
- Prefer non-root application processes and rootless container workflows where practical.
- Use explicit image versions or digests for controlled environments.
- Apply CPU and memory limits before running untrusted or resource-intensive workloads.
- Treat a shared kernel as a meaningful security boundary consideration.
- Keep hypervisors, container engines, runtimes, guest systems, and images patched.

---

## Notes

This course uses generic examples only. It does not include internal system names, proprietary architecture, company-specific processes, internal URLs, or screenshots from the source materials.

The original source documents were used only as a topic outline. All public course text, diagrams, examples, and labs in this directory were recreated in a vendor-neutral format.

---

## License

The educational content in this course, including presentations, documentation, diagrams, exercises, and quizzes, is licensed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**.

Source code, scripts, and executable examples are licensed separately under the **MIT License**.

Third-party products, names, trademarks, and documentation remain subject to their respective owners and licenses.

## Author

**Vladislav Iliev**

[LinkedIn](https://www.linkedin.com/in/vld62/)
