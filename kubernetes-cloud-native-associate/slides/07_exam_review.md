---
marp: true
paginate: true
title: KCNA Exam Review
---

# KCNA Exam Review

## Weighted preparation and scenario reasoning

---

# Domain 1: Kubernetes Fundamentals — 44%

Be ready to explain:

- Cluster and component responsibilities
- API objects and declarative state
- Pods and workload controllers
- Labels, selectors, namespaces, and annotations
- Scheduling and resource management
- ConfigMaps, Secrets, service accounts, and administration basics
- Images, containers, runtimes, and registries

---

# Domain 2: Container Orchestration — 28%

Be ready to explain:

- Pod and Service networking
- DNS, Ingress, Gateway, and service mesh concepts
- RBAC, admission, workload security, and network policy
- PVs, PVCs, StorageClasses, and CSI
- Events, logs, status, and common failure patterns

---

# Domain 3: Application Delivery — 16%

Be ready to explain:

- CI, continuous delivery, and continuous deployment
- GitOps reconciliation
- Helm charts and releases
- Rollout strategies and rollback
- Probes, logs, events, and application debugging
- Image and software supply-chain practices

---

# Domain 4: Cloud Native Architecture — 12%

Be ready to explain:

- Metrics, logs, traces, events, and observability
- Prometheus and OpenTelemetry purposes
- CNCF project lifecycle and landscape
- Cloud native principles and open interfaces
- Community governance and collaboration

---

# Scenario Question Method

1. Identify the layer: workload, network, storage, security, delivery, or observability
2. Identify the desired outcome
3. Remove answers that solve a different layer
4. Prefer the standard Kubernetes or cloud native abstraction
5. Check whether the answer is declarative, automated, and least-privileged
6. Re-read qualifiers such as internal, persistent, scheduled, or namespace-scoped

---

# Common Distinctions

- Pod vs Deployment
- Deployment vs StatefulSet
- Job vs CronJob
- ClusterIP vs NodePort vs LoadBalancer
- ConfigMap vs Secret
- Request vs limit
- Readiness vs liveness
- Role vs ClusterRole
- PV vs PVC vs StorageClass
- Monitoring vs observability
- CI vs continuous delivery vs continuous deployment

---

# Final Readiness Check

You should be able to:

- Draw the cluster architecture from memory
- Trace a request from client to Service to Pod
- Explain how a Pod is scheduled and started
- Diagnose a selector mismatch
- Explain a pending PVC
- Select an appropriate workload controller
- Explain a GitOps reconciliation loop
- Match common CNCF projects to their purpose
- Score at least 80% on the included mock exam

---

# Exam-Day Principles

- Read every qualifier
- Eliminate clearly wrong layers first
- Flag uncertain questions and return later
- Do not overcomplicate beginner-level scenarios
- Prefer standard, portable, least-privileged solutions
- Reserve time for review

Always follow the current official candidate handbook and remote testing instructions.
