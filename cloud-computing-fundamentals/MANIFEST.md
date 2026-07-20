# Course Manifest

This file summarizes the reusable materials included in the Cloud Computing: Fundamentals course.

## Core Files

| Path | Purpose |
|---|---|
| `README.md` | Course overview, objectives, provider coverage, prerequisites, and setup |
| `Makefile` | Short commands for validation, environment checks, inventory, and service mapping |
| `LICENSE.md` | Licensing summary and third-party attribution guidance |

## Slides

| Path | Topic |
|---|---|
| `slides/00_course_introduction.md` | Course scope, learning flow, lab safety, and provider-neutral thinking |
| `slides/01_cloud_concepts_and_service_models.md` | Cloud characteristics, deployment models, IaaS, PaaS, SaaS, containers, and serverless |
| `slides/02_global_infrastructure_and_reliability.md` | Regions, zones, fault domains, high availability, backup, and disaster recovery |
| `slides/03_identity_security_and_governance.md` | Shared responsibility, IAM, encryption, logging, policy, and governance |
| `slides/04_compute_storage_networking_and_databases.md` | Core technical service categories and architecture choices |
| `slides/05_aws_fundamentals.md` | AWS organization, infrastructure, IAM, networking, compute, storage, and operations |
| `slides/06_azure_fundamentals.md` | Azure tenants, subscriptions, resource groups, identity, services, and management |
| `slides/07_google_cloud_fundamentals.md` | Google Cloud hierarchy, projects, IAM, global networking, and core services |
| `slides/08_oci_private_hybrid_and_multicloud.md` | OCI foundations, private cloud, OpenStack, hybrid integration, and multi-cloud trade-offs |
| `slides/09_operations_cost_and_cloud_adoption.md` | Observability, IaC, platform engineering, FinOps, migration, and operating models |

## Documentation

| Path | Purpose |
|---|---|
| `docs/lab_setup.md` | Local and optional provider lab setup with billing safeguards |
| `docs/provider_service_mapping.md` | Cross-provider capability and service comparison |
| `docs/cloud_architecture_checklist.md` | Requirements and design review checklist |
| `docs/security_and_shared_responsibility.md` | Security ownership and baseline controls |
| `docs/cost_management_and_finops.md` | Cost allocation, budgets, optimization, and FinOps foundations |
| `docs/glossary.md` | Concise definitions of cloud terminology |
| `docs/useful_links.md` | Official documentation and learning resources |
| `docs/instructor_guide.md` | Suggested delivery plans, demonstrations, and discussion prompts |
| `docs/repository_integration.md` | Main repository catalog and tree update snippets |

## Labs, Examples, Scripts, and Quizzes

| Path | Purpose |
|---|---|
| `labs/` | Six provider-neutral design and decision exercises |
| `examples/workload-requirements.yaml` | Fictional workload used throughout the labs |
| `examples/tagging-policy.yaml` | Example mandatory metadata policy |
| `examples/provider-service-map.csv` | Machine-readable provider comparison |
| `examples/cli/` | Read-only provider CLI examples |
| `scripts/validate_environment.sh` | Local tool and optional cloud CLI checks |
| `scripts/cloud_cli_inventory.sh` | Read-only provider context inventory |
| `scripts/validate_content.py` | Required-file and Markdown-link validation |
| `quizzes/` | Three topic reviews and a final assessment |
