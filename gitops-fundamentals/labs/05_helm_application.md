# Lab 5 — Helm Application

## Objective

Lint and render a Helm chart, configure an Argo CD Application for it, and inspect the generated manifests.

## 1. Inspect the Chart

```bash
find examples/helm/demo-app -type f -maxdepth 3 -print
```

Review:

- `Chart.yaml`
- `values.yaml`
- `values-dev.yaml`
- Templates
- Helpers

## 2. Lint

```bash
helm lint examples/helm/demo-app
```

## 3. Render Defaults

```bash
helm template demo-app examples/helm/demo-app \
  --namespace gitops-helm-demo
```

## 4. Render Development Values

```bash
helm template demo-app examples/helm/demo-app \
  --namespace gitops-helm-demo \
  -f examples/helm/demo-app/values-dev.yaml
```

Compare:

- Replica count
- Environment variables
- Service type
- Resource requests

## 5. Copy to Lab Repository

```bash
mkdir -p charts
cp -R /path/to/gitops-fundamentals/examples/helm/demo-app charts/
```

Commit and push.

## 6. Prepare Application

Copy `examples/argocd/applications/helm-app.yaml`.

Replace:

- Repository URL
- Path when necessary

Apply:

```bash
kubectl apply -f argocd/applications/helm-app.yaml
```

## 7. Inspect Generated Manifests

```bash
argocd app manifests demo-app-helm
argocd app diff demo-app-helm
```

## 8. Sync

```bash
argocd app sync demo-app-helm
argocd app wait demo-app-helm --sync --health
```

## 9. Change Values Through Git

Edit `values-dev.yaml`:

```yaml
replicaCount: 2
config:
  message: "updated through Helm values"
```

Commit and push.

Observe reconciliation.

## 10. Avoid Hidden Overrides

Check whether the Application has UI or CLI parameter overrides:

```bash
argocd app get demo-app-helm
```

Discuss why values committed in Git are easier to reproduce than ad hoc overrides.

## Reflection

- Who owns the deployment lifecycle: Helm or Argo CD?
- Which files define complete desired state?
- How would you pin a chart dependency?
- What checks should validate rendered chart output?
