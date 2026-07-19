# Kubernetes & Cloud Native Associate

Welcome to the **Kubernetes & Cloud Native Associate** course.

This reusable, vendor-neutral training introduces Kubernetes and the wider cloud native ecosystem while preparing learners for the **Kubernetes and Cloud Native Associate (KCNA)** certification.

> This is an independent training resource. It is not an official Linux Foundation or CNCF course and is not endorsed by either organization.

---

## Course Objectives

By the end of this course participants will be able to:

- Explain cloud native principles and the role of container orchestration
- Describe Kubernetes cluster architecture and the main control-plane and node components
- Work with Pods, Deployments, ReplicaSets, DaemonSets, Jobs, and CronJobs
- Understand declarative configuration and the Kubernetes API object model
- Explain scheduling, labels, selectors, taints, tolerations, affinity, and resource requests
- Describe Kubernetes networking, Services, DNS, Ingress, and network policy concepts
- Explain ConfigMaps, Secrets, service accounts, RBAC, and basic workload security
- Understand persistent storage, PersistentVolumes, PersistentVolumeClaims, and StorageClasses
- Use basic troubleshooting workflows for workloads and services
- Explain application delivery concepts including CI/CD, GitOps, Helm, and progressive delivery
- Describe observability through metrics, logs, traces, events, and health probes
- Navigate the CNCF ecosystem and recognize common project categories
- Prepare systematically for the KCNA multiple-choice exam

---

## KCNA Exam Alignment

The course follows the currently published KCNA domains and competencies:

| Domain | Exam weight | Course coverage |
|---|---:|---|
| **Kubernetes Fundamentals** | **44%** | Core concepts, architecture, administration, scheduling, and containerization |
| **Container Orchestration** | **28%** | Networking, security, troubleshooting, and storage |
| **Cloud Native Application Delivery** | **16%** | Application delivery and debugging |
| **Cloud Native Architecture** | **12%** | Observability, ecosystem principles, community, and collaboration |

The objective-to-material mapping is documented in [`docs/kcna_objectives_mapping.md`](docs/kcna_objectives_mapping.md).

Exam policies, pricing, delivery software, and domain weights may change. Always verify the current details on the official Linux Foundation certification page before scheduling the exam.

---

## Course Structure

| Session | Topic | Primary exam domain |
|---:|---|---|
| 0 | Course introduction, exam overview, and lab setup | All domains |
| 1 | Cloud native foundations and containers | Kubernetes Fundamentals |
| 2 | Kubernetes architecture, API, and core resources | Kubernetes Fundamentals |
| 3 | Workloads, scheduling, configuration, and administration | Kubernetes Fundamentals |
| 4 | Networking, security, storage, and troubleshooting | Container Orchestration |
| 5 | Application delivery, GitOps, Helm, and debugging | Cloud Native Application Delivery |
| 6 | Observability, CNCF ecosystem, and community | Cloud Native Architecture |
| 7 | Exam review and readiness check | All domains |

---

## Repository Structure

```text
kubernetes-cloud-native-associate/
├── README.md
├── MANIFEST.md
├── LICENSE.md
├── Makefile
├── slides/
│   ├── 00_course_introduction.md
│   ├── 01_cloud_native_and_containers.md
│   ├── 02_kubernetes_architecture_and_core_concepts.md
│   ├── 03_workloads_scheduling_and_configuration.md
│   ├── 04_networking_security_storage_and_troubleshooting.md
│   ├── 05_application_delivery_and_debugging.md
│   ├── 06_observability_ecosystem_and_community.md
│   └── 07_exam_review.md
├── docs/
│   ├── lab_setup.md
│   ├── kcna_objectives_mapping.md
│   ├── study_plan_7_days.md
│   ├── exam_checklist.md
│   ├── command_cheat_sheet.md
│   ├── glossary.md
│   ├── useful_links.md
│   ├── instructor_guide.md
│   └── repository_integration.md
├── labs/
│   ├── README.md
│   ├── 01_cluster_and_kubectl_basics.md
│   ├── 02_pods_deployments_and_services.md
│   ├── 03_configuration_and_scheduling.md
│   ├── 04_storage_security_and_troubleshooting.md
│   └── 05_delivery_observability_and_ecosystem.md
├── examples/
│   ├── kind-config.yaml
│   └── manifests/
│       ├── namespace.yaml
│       ├── pod.yaml
│       ├── deployment.yaml
│       ├── service.yaml
│       ├── configmap.yaml
│       ├── secret-example.yaml
│       ├── pvc.yaml
│       ├── cronjob.yaml
│       └── probes-deployment.yaml
├── scripts/
│   ├── validate_environment.sh
│   ├── cluster_inventory.sh
│   └── validate_content.py
└── quizzes/
    ├── 01_kubernetes_fundamentals.md
    ├── 02_orchestration_delivery_and_architecture.md
    └── 03_mock_exam.md
```

---

## Prerequisites

Recommended knowledge:

- Basic Linux command-line usage
- Basic networking concepts such as IP addresses, ports, and DNS
- General understanding of processes, services, and filesystems
- Basic familiarity with containers is useful but not required
- Git and a text editor

No production Kubernetes cluster is required.

---

## Recommended Lab Environment

The examples are suitable for a disposable local cluster created with one of the following:

- **kind** with Docker or Podman
- **minikube**
- **k3d**
- An existing non-production Kubernetes cluster

Recommended local resources:

- 2 CPU cores
- 4 GB RAM available for the lab cluster
- 10 GB free disk space
- `kubectl`
- Docker Engine or Podman
- `kind` for the default setup

See [`docs/lab_setup.md`](docs/lab_setup.md) for detailed instructions.

---

## Getting Started

Clone the training repository and enter the module:

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/kubernetes-cloud-native-associate
```

List the available materials:

```bash
make list
```

Validate the training package:

```bash
make validate
```

Check the local tools and Kubernetes access:

```bash
make check-environment
```

Create the default kind cluster:

```bash
make cluster-create
```

Inspect the cluster:

```bash
make inventory
```

Apply the example resources:

```bash
make demo-apply
```

Remove the example resources and cluster:

```bash
make demo-delete
make cluster-delete
```

---

## Recommended Learning Approach

For every session:

1. Review the corresponding slide deck
2. Read the related objective mapping and glossary terms
3. Complete the associated lab in a disposable cluster
4. Explain the expected state before running each command
5. Use `kubectl get`, `describe`, `logs`, and events to verify the result
6. Complete the relevant quiz questions
7. Revisit weak areas according to the official exam weights

The course can be delivered as:

- A compact half-day introduction
- Two half-day workshops
- A seven-day self-study certification plan
- A reusable onboarding course for engineers entering the cloud native ecosystem

---

## Safety Notes

- Use only clusters where you are authorized to create and delete resources.
- Do not run the examples in production.
- Review every manifest and command before applying it.
- Use a dedicated namespace for training resources.
- Never commit real credentials, tokens, kubeconfig files, private keys, or production Secrets.
- Treat Base64-encoded Secret data as encoding, not encryption.
- Delete test resources after completing the labs.
- Avoid exposing NodePort, LoadBalancer, or Ingress endpoints to untrusted networks.

---

## Exam Preparation Notes

The KCNA exam is concept-focused, but practical experience makes scenario questions easier to reason about. Learners should be able to explain not only what a Kubernetes object is, but also why it is selected in a particular situation.

Before scheduling the exam:

- Complete the four weighted domain reviews
- Reach at least 80% on the included mock exam
- Explain all items in the exam checklist without notes
- Review the current official curriculum and candidate handbook
- Verify the remote testing system and identification requirements

---

## License

The educational content in this course, including presentations, documentation, exercises, and quizzes, is licensed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**.

Source code, scripts, and executable examples are licensed separately under the **MIT License**.

Third-party names, trademarks, documentation, and project materials remain subject to their respective owners and licenses.

## Author

**Vladislav Iliev**

[LinkedIn](https://www.linkedin.com/in/vld62/)
