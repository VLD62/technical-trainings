# Seven-Day KCNA Study Plan

This plan is designed for an intensive first attempt by a learner who already has general Linux and DevOps experience.

## Daily Pattern

Use approximately three focused hours per day:

1. 60–75 minutes of reading and slides
2. 60 minutes of hands-on practice
3. 30–45 minutes of active recall and quiz review

## Day 1 — Cloud Native and Containers

- Read slide 01
- Review image, container, registry, runtime, OCI, CRI, CNI, and CSI
- Draw the container runtime stack
- Complete the introductory section of Lab 01
- Review glossary terms related to containers

Target: explain why orchestration is needed and how containers differ from virtual machines.

## Day 2 — Kubernetes Architecture and API

- Read slide 02
- Draw the control plane and node components
- Practice API discovery with `kubectl api-resources` and `kubectl explain`
- Complete Lab 01
- Answer the architecture section in Quiz 01

Target: explain every core component and the relationship between `spec`, `status`, and controllers.

## Day 3 — Workloads, Scheduling, and Configuration

- Read slide 03
- Compare Deployment, StatefulSet, DaemonSet, Job, and CronJob
- Complete Lab 03
- Practice ConfigMaps, Secrets, requests, limits, labels, and scheduling
- Finish Quiz 01

Target: select the correct workload and scheduling mechanism for a scenario.

## Day 4 — Networking and Troubleshooting

- Read the networking and troubleshooting sections of slide 04
- Complete Lab 02
- Trace traffic from a client to Service to Pod
- Create and diagnose a deliberate selector mismatch
- Review common Pod states and event messages

Target: explain Service types, DNS, Ingress, endpoint selection, and the diagnostic workflow.

## Day 5 — Security and Storage

- Read the security and storage sections of slide 04
- Complete Lab 04
- Review RBAC object relationships and service accounts
- Compare PV, PVC, StorageClass, and CSI
- Answer the first half of Quiz 02

Target: reason about least privilege, Secret limitations, network policy, and storage provisioning.

## Day 6 — Delivery, Observability, and CNCF

- Read slides 05 and 06
- Complete Lab 05
- Compare CI, delivery, deployment, GitOps, Helm, and rollout strategies
- Review metrics, logs, traces, events, Prometheus, and OpenTelemetry
- Browse the CNCF landscape by category
- Finish Quiz 02

Target: connect delivery, runtime behavior, telemetry, and ecosystem tools.

## Day 7 — Mock Exam and Final Review

- Complete Quiz 03 without notes
- Review every incorrect answer
- Re-read the objective mapping according to domain weights
- Complete `docs/exam_checklist.md`
- Draw three diagrams from memory:
  - Cluster architecture
  - Service-to-Pod traffic flow
  - GitOps reconciliation loop
- Verify the official candidate handbook and testing requirements

Readiness target: at least 80% on the mock exam and confident explanations for all checklist items.
