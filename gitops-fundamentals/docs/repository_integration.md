# Repository Integration

## Recommended Directory

Add the module at:

```text
technical-trainings/gitops-fundamentals/
```

## Training Catalog Entry

Add this row to the root `README.md` Training Catalog:

```markdown
| **GitOps: Fundamentals** | Practical introduction to GitOps principles, declarative delivery, reconciliation, repository strategies, Argo CD, Helm, Kustomize, ApplicationSet, Flux, security, environment promotion, CI integration, observability, and troubleshooting. | [Open training](./gitops-fundamentals/) |
```

## Repository Structure Entry

Add:

```text
├── gitops-fundamentals/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── LICENSE.md
│   ├── Makefile
│   ├── slides/
│   ├── docs/
│   ├── labs/
│   ├── examples/
│   ├── scripts/
│   └── quizzes/
```

Place it near the Kubernetes, Jenkins, Terraform, and cloud-native delivery modules.

## Suggested Commit Message

```text
feat(training): add GitOps fundamentals course
```

Extended form:

```text
feat(training): add GitOps fundamentals course

- cover OpenGitOps principles and reconciliation
- add Argo CD, Helm, Kustomize, ApplicationSet, and Flux materials
- include guided labs, examples, validation scripts, and quizzes
- document security, promotion, CI integration, and operations
```
