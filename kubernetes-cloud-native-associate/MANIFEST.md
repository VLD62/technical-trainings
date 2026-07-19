# Course Manifest

This file summarizes the reusable materials included in the **Kubernetes & Cloud Native Associate: Basics** course.

## Core Files

| Path | Purpose |
|---|---|
| `README.md` | Course overview, exam alignment, prerequisites, and setup |
| `Makefile` | Short commands for validation, cluster setup, inventory, and demos |
| `LICENSE.md` | Licensing summary and third-party attribution guidance |

## Slides

| Path | Topic |
|---|---|
| `slides/00_course_introduction.md` | Course scope, KCNA format, learning flow, and lab safety |
| `slides/01_cloud_native_and_containers.md` | Cloud native principles, containers, images, registries, and runtimes |
| `slides/02_kubernetes_architecture_and_core_concepts.md` | Cluster architecture, API objects, Pods, controllers, and namespaces |
| `slides/03_workloads_scheduling_and_configuration.md` | Workloads, scheduling, resources, ConfigMaps, Secrets, and administration |
| `slides/04_networking_security_storage_and_troubleshooting.md` | Services, DNS, security, persistent storage, and diagnostic workflow |
| `slides/05_application_delivery_and_debugging.md` | CI/CD, GitOps, Helm, rollout strategies, probes, and debugging |
| `slides/06_observability_ecosystem_and_community.md` | Metrics, logs, traces, CNCF projects, governance, and collaboration |
| `slides/07_exam_review.md` | Weighted review, scenario reasoning, and exam readiness |

## Documentation

| Path | Purpose |
|---|---|
| `docs/lab_setup.md` | Local kind-based lab setup and alternatives |
| `docs/kcna_objectives_mapping.md` | Mapping from official domains to course materials |
| `docs/study_plan_7_days.md` | Intensive one-week study plan |
| `docs/exam_checklist.md` | Final knowledge and logistics checklist |
| `docs/command_cheat_sheet.md` | High-value `kubectl` and cluster inspection commands |
| `docs/glossary.md` | Concise definitions of Kubernetes and cloud native terms |
| `docs/useful_links.md` | Official learning and reference resources |
| `docs/instructor_guide.md` | Suggested delivery plan and demonstrations |
| `docs/repository_integration.md` | Main repository catalog and tree update snippets |

## Labs and Examples

| Path | Purpose |
|---|---|
| `labs/` | Five guided practical labs aligned to the exam domains |
| `examples/kind-config.yaml` | Minimal local kind cluster configuration |
| `examples/manifests/` | Generic Kubernetes resource examples for the labs |
| `scripts/validate_environment.sh` | Read-only local tool and cluster checks |
| `scripts/cluster_inventory.sh` | Read-only Kubernetes inventory collection |
| `scripts/validate_content.py` | Training package and Markdown link validation |
| `quizzes/` | Domain reviews and a 30-question mock exam |
