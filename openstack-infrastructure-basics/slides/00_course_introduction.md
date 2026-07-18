# OpenStack Infrastructure: Basics

## Session 0 - Course Introduction

---

## Why OpenStack?

OpenStack is an open-source platform for building private and public Infrastructure as a Service clouds.

It exposes infrastructure capabilities through APIs:

- Compute
- Networking
- Identity
- Images
- Block, object, and shared-file storage
- Load balancing and orchestration
- Optional higher-level services

---

## Course Scope

This course covers:

- Architecture and core services
- Identity and resource organization
- Compute, images, networking, and storage
- Kolla-Ansible deployment concepts
- Day-2 operations and troubleshooting
- High availability and security

It does not attempt to replace version-specific upstream installation documentation.

---

## Learning Outcomes

Participants should be able to:

- Explain how an API request moves through OpenStack
- Use the unified OpenStack CLI
- Create and connect common IaaS resources
- Read a Kolla-Ansible inventory and `globals.yml`
- Collect operational evidence safely
- Explain major production-readiness decisions

---

## Target Audience

- Linux and infrastructure engineers
- DevOps and platform engineers
- Cloud administrators
- Network and storage engineers moving into cloud platforms
- Developers who need to understand private-cloud primitives

---

## Prerequisites

Recommended knowledge:

- Linux command line
- IP addressing, routing, DNS, and firewalls
- Virtual machines and hypervisors
- YAML and SSH

Optional deployment labs require disposable infrastructure and stronger Linux and networking experience.

---

## Recommended Flow

1. Architecture
2. Identity and CLI
3. Compute and images
4. Networking
5. Storage
6. Kolla-Ansible deployment
7. Operations
8. High availability and security
9. Labs and knowledge checks

---

## Lab Safety

- Use an authorized training project
- Confirm quotas before creating resources
- Use documentation address ranges in examples
- Never commit real credentials
- Do not run failure tests in production
- Record created resources and clean them up

---

## Training Materials

- Markdown slide decks
- Reference documentation
- CLI labs
- Generic configuration examples
- Read-only health-report script
- Quizzes and design scenarios

---

## Key Principle

OpenStack is not one program.

It is a set of cooperating services connected by:

- REST APIs
- Identity tokens
- A service catalog
- Databases
- A message bus
- Schedulers and agents
- Software-defined networking and storage backends
