---
marp: true
paginate: true
title: Kubernetes and Cloud Native Associate - Course Introduction
---

# Kubernetes & Cloud Native Associate

## Course Introduction

A reusable foundation course for Kubernetes, cloud native concepts, and KCNA exam preparation.

---

# Why This Course?

Cloud native systems combine:

- Containers and immutable images
- Declarative APIs
- Automated scheduling and reconciliation
- Service networking and persistent storage
- Continuous delivery and GitOps
- Metrics, logs, traces, and events
- Open source projects and communities

KCNA validates that a learner can reason about these building blocks.

---

# Learning Outcomes

Participants should be able to:

- Explain Kubernetes architecture and object relationships
- Select common workload, networking, and storage resources
- Describe scheduling, configuration, and security fundamentals
- Follow a structured troubleshooting workflow
- Explain application delivery and observability concepts
- Navigate the CNCF ecosystem
- Prepare for the KCNA exam using weighted study priorities

---

# Current KCNA Domain Weights

| Domain | Weight |
|---|---:|
| Kubernetes Fundamentals | 44% |
| Container Orchestration | 28% |
| Cloud Native Application Delivery | 16% |
| Cloud Native Architecture | 12% |

Study time should reflect the weighting, but no domain should be ignored.

---

# Exam Characteristics

- Beginner-level certification
- Online and remotely proctored
- Multiple-choice format
- Conceptual and scenario-based questions
- No formal prerequisites

Always verify the current duration, policies, software, and identification rules on the official certification page.

---

# Course Map

1. Cloud native and containers
2. Kubernetes architecture and core concepts
3. Workloads, scheduling, and configuration
4. Networking, security, storage, and troubleshooting
5. Application delivery and debugging
6. Observability, ecosystem, and community
7. Weighted exam review

---

# Lab Environment

Default approach:

- Ubuntu or another supported desktop Linux distribution
- Docker or Podman
- `kind`
- `kubectl`
- One disposable local cluster
- Dedicated `kcna-lab` namespace

The exam is multiple choice, but hands-on practice improves conceptual understanding.

---

# Safe Lab Rules

- Never use production clusters
- Review manifests before applying them
- Keep credentials and kubeconfig files out of Git
- Use synthetic Secret values only
- Avoid exposing training services publicly
- Delete the namespace and cluster after practice

---

# Independent Training Notice

This course:

- Is not an official Linux Foundation or CNCF course
- Does not include real or reconstructed exam questions
- Uses only public objectives and public technical documentation
- Must be checked against the latest official curriculum before delivery
