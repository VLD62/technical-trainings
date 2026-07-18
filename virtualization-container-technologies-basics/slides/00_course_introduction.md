---
marp: true
paginate: true
title: Virtualization and Container Technologies - Course Introduction
---

# Virtualization & Container Technologies

## Course Introduction

Reusable training for understanding virtual machines, containers, and the architecture decisions around them.

---

# Why This Topic Matters

Modern platforms combine several isolation and packaging technologies:

- Physical servers provide compute, memory, storage, and networking
- Virtual machines provide isolated guest operating systems
- Containers package applications and dependencies
- Orchestrators coordinate workloads across many hosts

Engineers need to understand the boundaries between these layers.

---

# Learning Outcomes

After the course, participants should be able to:

- Explain virtualization and containerization
- Describe hypervisor and container runtime layers
- Compare VMs and containers using practical criteria
- Identify suitable use cases for each technology
- Build and inspect a basic containerized application
- Recognize common operational and security risks

---

# Course Map

1. Virtualization fundamentals
2. Containerization fundamentals
3. Virtual machines vs containers
4. Use cases and architecture patterns
5. Practical container workflows
6. Operations, security, and next steps
7. Labs and knowledge checks

---

# Recommended Prerequisites

- Basic operating-system concepts
- Processes, files, ports, and services
- Basic Linux command-line usage
- Git and a text editor

Optional lab tools:

- Docker Engine and Docker Compose
- Podman
- KVM/libvirt or another local hypervisor

---

# Safe Lab Rules

- Use an isolated workstation or test environment
- Do not expose lab ports publicly
- Do not mount sensitive host directories
- Do not use production credentials
- Clean up containers, networks, and test VMs after practice
- Verify available CPU, memory, and disk capacity

---

# Delivery Options

## Awareness Session - 45 to 60 minutes

- Concepts
- Architecture comparison
- Use cases
- Short demonstration

## Workshop - 3 to 4 hours

- Full slide set
- Container labs
- Virtualization inspection
- Scenario exercises

---

# Key Question

> Which boundary does the workload need?

The answer depends on:

- Operating-system requirements
- Isolation requirements
- Performance and density
- Startup speed
- Portability
- Operational tooling
- Security and compliance
