# Guided Labs

## Sequence

| Lab | Topic | Estimated time |
|---|---|---:|
| 1 | Create cluster and install Argo CD | 30 min |
| 2 | Deploy the first Application | 40 min |
| 3 | Automated sync, drift, pruning, and health | 45 min |
| 4 | Kustomize environments and promotion | 45 min |
| 5 | Helm application | 40 min |
| 6 | AppProjects, RBAC discussion, and sync windows | 50 min |
| 7 | ApplicationSet | 40 min |
| 8 | CI updates the GitOps repository | 45 min |
| 9 | Flux comparison | 45 min |
| 10 | Final project | 90–180 min |

## Rules

- Use a disposable cluster.
- Replace all `REPLACE_ME` placeholders.
- Commit changes before expecting reconciliation.
- Do not place real secrets in the repository.
- Read deletion and pruning steps before running them.
- Record observations, not only commands.
- Prefer fixing desired state over editing live state.

## Lab Repository Preparation

Create a repository and copy:

```text
examples/app/       → apps/demo-app/
examples/helm/      → charts/
examples/argocd/    → argocd/
examples/flux/      → flux/
```

Adjust paths if you preserve the original `examples/` prefix.

## Evidence

For each lab capture:

- Git commit or pull request
- Argo CD or Flux status
- Relevant Kubernetes output
- One troubleshooting observation
- One production design consideration
