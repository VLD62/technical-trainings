# Lab 9 — Flux Comparison

## Objective

Map the Argo CD application to Flux resources and optionally reconcile the same Kustomize overlay in a separate disposable cluster.

## Option A — Manifest Analysis

No Flux installation required.

Inspect:

```bash
cat examples/flux/git-repository.yaml
cat examples/flux/kustomization.yaml
```

Map:

| Argo CD | Flux |
|---|---|
| Application source | GitRepository |
| Kustomize Application | Kustomization |
| Automated sync | Reconciliation interval |
| Prune | `spec.prune` |
| Health wait | `spec.wait` |
| Source revision | GitRepository ref |

## Option B — Hands-On Flux

Use a separate cluster or remove Argo CD ownership of the target resources first. Never let both controllers manage the same objects.

Verify:

```bash
flux check --pre
```

Bootstrap into a dedicated practice repository by following the official Flux guide.

## Apply Source and Kustomization

Replace the repository URL:

```bash
kubectl apply -f flux/git-repository.yaml
kubectl apply -f flux/kustomization.yaml
```

Inspect:

```bash
flux get sources git
flux get kustomizations
kubectl get gitrepository,kustomization -n flux-system
```

## Reconcile

```bash
flux reconcile source git gitops-lab -n flux-system
flux reconcile kustomization demo-app-dev -n flux-system
```

## Create Drift

Scale the Deployment manually and observe the next reconciliation.

## Logs

```bash
flux logs --level=error --all-namespaces
kubectl logs -n flux-system deployment/source-controller
kubectl logs -n flux-system deployment/kustomize-controller
```

## Compare Experience

Evaluate:

- Installation
- Source abstraction
- Application view
- CLI
- UI expectations
- Health visibility
- Kustomize lifecycle
- Multi-tenancy
- Image automation
- Troubleshooting

## Reflection

- Which differences are architectural?
- Which are user-experience choices?
- Which tool fits a controller-first platform team?
- Which tool fits teams needing a strong application UI?
- What proof-of-concept criteria would be fair?
