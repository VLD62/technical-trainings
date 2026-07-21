# Argo CD Cheat Sheet

## Installation

```bash
kubectl create namespace argocd
kubectl apply -n argocd --server-side --force-conflicts \
  -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml
kubectl wait --for=condition=Available deployment/argocd-server \
  -n argocd --timeout=300s
```

For production, pin and verify a specific release.

## Access

```bash
kubectl -n argocd port-forward svc/argocd-server 8080:443
```

```bash
kubectl -n argocd get secret argocd-initial-admin-secret \
  -o jsonpath="{.data.password}" | base64 -d
echo
```

```bash
argocd login localhost:8080 --username admin --insecure
```

## Application Commands

```bash
argocd app list
argocd app get demo-app
argocd app diff demo-app
argocd app sync demo-app
argocd app wait demo-app --health --sync
argocd app history demo-app
argocd app manifests demo-app
argocd app resources demo-app
argocd app logs demo-app
argocd app delete demo-app
```

## Kubernetes-Native Commands

```bash
kubectl get applications -n argocd
kubectl get application demo-app -n argocd -o yaml
kubectl describe application demo-app -n argocd
kubectl get appprojects -n argocd
kubectl get applicationsets -n argocd
```

## Minimal Application

```yaml
apiVersion: argoproj.io/v1alpha1
kind: Application
metadata:
  name: demo-app
  namespace: argocd
spec:
  project: default
  source:
    repoURL: https://github.com/REPLACE_ME/gitops-lab.git
    targetRevision: main
    path: apps/demo-app/overlays/dev
  destination:
    server: https://kubernetes.default.svc
    namespace: gitops-demo-dev
  syncPolicy:
    syncOptions:
      - CreateNamespace=true
```

## Automated Policy

```yaml
syncPolicy:
  automated:
    enabled: true
    prune: true
    selfHeal: true
    allowEmpty: false
  syncOptions:
    - CreateNamespace=true
    - PruneLast=true
```

## Helm Source

```yaml
source:
  repoURL: https://github.com/REPLACE_ME/gitops-lab.git
  targetRevision: main
  path: charts/demo-app
  helm:
    valueFiles:
      - values-dev.yaml
```

## Kustomize Source

```yaml
source:
  repoURL: https://github.com/REPLACE_ME/gitops-lab.git
  targetRevision: main
  path: apps/demo-app/overlays/dev
```

## Useful Controller Logs

```bash
kubectl logs -n argocd deployment/argocd-server
kubectl logs -n argocd statefulset/argocd-application-controller
kubectl logs -n argocd deployment/argocd-repo-server
kubectl logs -n argocd deployment/argocd-applicationset-controller
```

## Refresh and Hard Refresh

```bash
argocd app get demo-app --refresh
argocd app get demo-app --hard-refresh
```

A normal refresh rechecks application state. A hard refresh also invalidates relevant manifest-generation cache.

## Common Checks

```bash
kubectl get events -n argocd --sort-by=.lastTimestamp
kubectl get pods -n argocd
kubectl auth can-i get deployments \
  --as=system:serviceaccount:argocd:argocd-application-controller \
  -n gitops-demo-dev
```

## Safe Troubleshooting Sequence

1. Read the Application conditions.
2. Confirm the source URL, path, and revision.
3. Render the source locally.
4. Inspect repository-server logs.
5. Compare desired and live manifests.
6. Check target namespace and permissions.
7. Check health and workload events.
8. Confirm another controller is not mutating the same fields.
9. Fix the declaration in Git.
10. Reconcile and verify health.
