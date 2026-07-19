# KCNA Objectives Mapping

This mapping aligns the course with the currently published KCNA domains. The official curriculum remains the source of truth.

## 1. Kubernetes Fundamentals — 44%

| Competency | Primary materials | Practice |
|---|---|---|
| Kubernetes core concepts | Slides 02 and 03; glossary | Labs 01–03 |
| Administration | Slides 02 and 03; command cheat sheet | Labs 01 and 03 |
| Scheduling | Slide 03 | Lab 03 |
| Containerization | Slide 01 | Labs 01 and 02 |

Key knowledge:

- Cluster architecture and component responsibilities
- Kubernetes API objects and declarative configuration
- Pods, controllers, labels, selectors, namespaces, and annotations
- Container images, registries, runtimes, and OCI concepts
- Scheduling inputs, resources, affinity, taints, and tolerations
- ConfigMaps, Secrets, service accounts, contexts, and rollouts

## 2. Container Orchestration — 28%

| Competency | Primary materials | Practice |
|---|---|---|
| Networking | Slide 04; command cheat sheet | Labs 02 and 04 |
| Security | Slides 03 and 04 | Labs 03 and 04 |
| Troubleshooting | Slides 04 and 05 | Labs 02 and 04 |
| Storage | Slide 04 | Lab 04 |

Key knowledge:

- Pod networking and Service discovery
- ClusterIP, NodePort, LoadBalancer, headless Services, DNS, and Ingress
- NetworkPolicy and service mesh purpose
- Authentication, RBAC, admission, service accounts, and workload security
- Volumes, PVs, PVCs, StorageClasses, dynamic provisioning, and CSI
- Events, logs, object status, selectors, endpoints, and common failure states

## 3. Cloud Native Application Delivery — 16%

| Competency | Primary materials | Practice |
|---|---|---|
| Application delivery | Slide 05 | Lab 05 |
| Debugging | Slides 04 and 05 | Labs 02, 04, and 05 |

Key knowledge:

- CI, continuous delivery, and continuous deployment
- GitOps source-of-truth and reconciliation model
- Helm charts, values, templates, releases, and repositories
- Rolling, recreate, blue/green, and canary approaches
- Probes, logs, events, rollout history, rollback, and port-forwarding
- Artifact provenance and supply-chain security concepts

## 4. Cloud Native Architecture — 12%

| Competency | Primary materials | Practice |
|---|---|---|
| Observability | Slide 06 | Lab 05 |
| Cloud native ecosystem and principles | Slides 01 and 06 | Lab 05 |
| Community and collaboration | Slide 06 | Lab 05 |

Key knowledge:

- Metrics, logs, traces, events, health, SLIs, and SLOs
- Prometheus, OpenTelemetry, and common ecosystem categories
- OCI, CRI, CNI, CSI, and API extension concepts
- CNCF project lifecycle, landscape, governance, and contribution models

## Coverage Rule

The course intentionally includes practical topics beyond the minimum conceptual level. Practical depth is used to reinforce understanding and should not be interpreted as an exact prediction of exam questions.
