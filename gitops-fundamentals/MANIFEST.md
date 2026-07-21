# Course Manifest

## Module

- **Title:** GitOps: Fundamentals
- **Directory:** `gitops-fundamentals`
- **Primary practical platform:** Kubernetes
- **Primary GitOps tool:** Argo CD
- **Secondary comparison tool:** Flux
- **Configuration tools:** Plain YAML, Kustomize, Helm
- **CI examples:** Jenkins and GitHub Actions
- **Delivery modes:** Instructor-led, workshop, onboarding, self-study
- **Suggested duration:** 12–16 instructional hours plus final project

## Learning Assets

| Area | Count | Purpose |
|---|---:|---|
| Slide decks | 9 | Instructor-led theory and discussion |
| Reference documents | 17 | Detailed explanations and operational guidance |
| Guided labs | 10 | Progressive practical exercises |
| Example sets | 5 | Reusable manifests, chart, CI, and controller examples |
| Utility scripts | 5 | Environment setup, validation, and cleanup |
| Quizzes | 4 | Knowledge checks and final assessment |

## Curriculum Coverage

- OpenGitOps principles
- Desired and actual state
- Reconciliation and convergence
- Drift detection and remediation
- Pull-based delivery
- Git repository patterns
- Branch, folder, and repository promotion models
- Argo CD architecture and installation
- Argo CD Applications and AppProjects
- Automated synchronization, pruning, and self-healing
- Health, history, rollback, hooks, waves, and windows
- Plain YAML, Kustomize, and Helm
- Repository and cluster credentials
- Secrets-management patterns
- RBAC, least privilege, and multi-tenancy
- ApplicationSet and multi-cluster deployment
- CI-to-GitOps integration
- Image update patterns
- Flux architecture and comparison
- Metrics, logs, events, notifications, and troubleshooting
- Disaster recovery and operating-model design

## Validation Expectations

Run:

```bash
make content-check
```

The validation checks:

- Required course files
- Relative Markdown links
- Referenced example paths
- YAML parsing when PyYAML is available
- Shell script syntax
- Python syntax
- Executable bit recommendations

Cluster-dependent validation is deliberately separate:

```bash
make render
make helm-lint
```

## Content Conventions

- Markdown uses ATX headings.
- Commands use fenced code blocks.
- Kubernetes resources use `apiVersion`, `kind`, `metadata`, and `spec` consistently.
- Example namespaces use the `gitops-` prefix.
- Example repositories use placeholders that learners must replace.
- Real credentials and secrets are never included.
- Production advice is explicitly distinguished from disposable lab shortcuts.
