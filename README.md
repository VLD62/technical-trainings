# Technical Trainings

Reusable, hands-on technical trainings for DevOps, platform engineering, cloud
infrastructure, automation, observability, databases, software development, and
AI-assisted workflows.

Each training is an independent module with its own presentations, documentation,
guided labs, runnable examples, and knowledge checks. Modules are
technology-neutral, use placeholder credentials only, and are designed to be run
locally or adapted for team enablement sessions.

## Who this is for

- **Engineers** learning a new area through practical, self-paced material.
- **Team leads and enablement facilitators** who need ready-to-run session content.
- **Interviewers and reviewers** looking at how training material is structured,
  validated, and maintained.

## What you get

- **Practical labs and runnable examples**, not just slides.
- **Consistent module layout** so a second module feels familiar after the first.
- **Automated validation** in many modules (`make validate`, `make test`) and a
  repository-wide check that runs in CI.
- **Safe defaults**: no real secrets, placeholder endpoints, and cleanup notes for
  anything that provisions local resources.

## Training catalog

### Cloud and Infrastructure

| Training | Description | Automation |
|---|---|---|
| [Cloud Computing: Fundamentals](./cloud-computing-fundamentals/) | Vendor-neutral cloud concepts: service and deployment models, reliability, security, networking, storage, databases, observability, IaC, FinOps, and the core services of AWS, Azure, GCP, and OCI. | `make` |
| [Linux Administration: Basics](./linux-administration-basics/) | Vendor-neutral Linux administration: system architecture, command-line tools, package management, filesystems, users, services, networking, security, and shell scripting, aligned to LPIC-1 (101-500 and 102-500). | `make` |
| [OpenStack Infrastructure: Basics](./openstack-infrastructure-basics/) | OpenStack architecture and core services, Kolla-Ansible deployment, Neutron networking, Ceph storage, operations, troubleshooting, scaling, and high availability. | `make` |
| [Terraform: Fundamentals](./terraform-fundamentals/) | Infrastructure as Code with Terraform: HCL, providers, resources, variables, outputs, state, modules, lifecycle rules, backends, testing, refactoring, and CI/CD. | `make` |

### Containers and Platform Engineering

| Training | Description | Automation |
|---|---|---|
| [Virtualization & Container Technologies: Basics](./virtualization-container-technologies-basics/) | Virtual machines, hypervisors, container images and runtimes, registries, Docker, Podman, Compose, isolation, and hybrid infrastructure patterns. | `make` |
| [Kubernetes & Cloud Native Associate](./kubernetes-cloud-native-associate/) | KCNA-oriented preparation: Kubernetes fundamentals, container orchestration, cloud native delivery, architecture, observability, security, storage, and the CNCF ecosystem. | `make` |

### CI/CD and DevOps Tooling

| Training | Description | Automation |
|---|---|---|
| [Jenkins Pipelines: Basics](./jenkins-pipelines-basics/) | Jenkins and CI/CD workflows: Declarative and Scripted pipelines, agents, plugins, Jenkinsfiles, and pipeline practices. | — |
| [JFrog Artifactory: First Steps](./artifactory-first-steps/) | Artifact repositories: repository types, upload and download workflows, publishing, metadata, and automation. | — |
| [GitOps: Fundamentals](./gitops-fundamentals/) | GitOps principles and declarative delivery: reconciliation, repository strategies, Argo CD, Helm, Kustomize, ApplicationSet, Flux, promotion, CI integration, and troubleshooting. | `make` |

### Monitoring and Observability

| Training | Description | Automation |
|---|---|---|
| [Prometheus & Grafana: Basics](./prometheus-grafana-basics/) | Metrics monitoring: Prometheus architecture, Node Exporter, PromQL, Grafana dashboards, provisioning, alerting, and multi-host Linux monitoring. | `make` |
| [Zabbix Monitoring: Basics](./zabbix-monitoring-basics/) | Zabbix architecture and server components, Agent 2, templates, Kubernetes monitoring, alerting, access control, and troubleshooting. | — |

### Automation and Scripting

| Training | Description | Automation |
|---|---|---|
| [Bash Scripting: Fundamentals](./bash-scripting-fundamentals/) | Shell fundamentals, variables, parameters, conditions, loops, functions, arrays, text processing, files, error handling, debugging, security, testing, and reusable automation. | `make` |
| [Python Scripting: Basics](./python-scripting-basics/) | Python scripting and automation: functions, modules, file processing, CLI tools, logging, testing, and object-oriented design. | `make` |
| [Ansible First Steps](./ansible-first-steps/) | Ansible automation: inventories, ad-hoc commands, playbooks, facts, handlers, and common operational tasks. | — |

### Databases

| Training | Description | Automation |
|---|---|---|
| [PL/SQL & T-SQL Database Programming: Fundamentals](./plsql-tsql-database-programming-fundamentals/) | Database programming with Oracle PL/SQL and SQL Server T-SQL: procedural SQL, control flow, cursors, stored procedures, packages, transactions, error handling, triggers, dynamic SQL, security, and performance. | `make` |

### AI and Developer Workflows

| Training | Description | Automation |
|---|---|---|
| [AI Agents & Workflows: Basics](./ai-agents-workflows-basics/) | Practical introduction to AI agents and workflows: tools, memory, prompt engineering, LangChain, LangGraph, and LangSmith, with hands-on notebooks. | — |

> **Automation** indicates whether the module ships a `Makefile` with `validate`/`test`
> targets. A dash means the module is presentation- and reference-driven.

## Getting started

### Use a single module

Every module is self-contained. Open its `README.md` and follow the getting-started
section — that is all you need.

### Clone the repository

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings
```

### Run module setup and validation

Modules that ship a `Makefile` expose the same core targets:

```bash
cd bash-scripting-fundamentals   # or any module with a Makefile
make help                        # list available targets
make validate                    # structure, content, and syntax checks
make test                        # dependency-free behavior tests
make clean                       # remove generated output
```

### Validate the whole repository

From the repository root:

```bash
make validate                    # run repository-wide checks
# or, without make:
python3 scripts/validate_repo.py
```

This checks for broken relative links, unresolved clone-URL placeholders, missing
required files, and accidental organization-specific terms. The same checks run in CI
on pull requests.

## Contributing

Improvements are welcome. See [CONTRIBUTING.md](./CONTRIBUTING.md) for how to propose
changes, and [docs/adding-a-training-module.md](./docs/adding-a-training-module.md)
for the module conventions and a ready-to-copy README template.

## Repository structure

For the top-level layout and the anatomy of a training module, see
[docs/repository-structure.md](./docs/repository-structure.md).

## License

This repository uses a dual-license model, mirrored in each module's `LICENSE.md`:

- **Source code, scripts, configuration, and executable examples** — [MIT License](./LICENSE).
- **Educational content** (presentations, documentation, diagrams, quizzes, and
  exercises) — [Creative Commons Attribution-NonCommercial-ShareAlike 4.0
  International](./LICENSE-CONTENT.md).
- Third-party images, trademarks, and referenced materials remain subject to their
  respective owners and licenses.

## Author

**Vladislav Iliev** — [LinkedIn](https://www.linkedin.com/in/vld62/)
