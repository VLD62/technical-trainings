# Lab 2 — First Argo CD Application

## Objective

Commit the example application to Git, create an Argo CD Application, inspect the diff, synchronize it, and verify the workload.

## 1. Copy the Example

In your lab Git repository:

```bash
mkdir -p apps/demo-app
cp -R /path/to/gitops-fundamentals/examples/app/base apps/demo-app/
cp -R /path/to/gitops-fundamentals/examples/app/overlays apps/demo-app/
```

Commit and push:

```bash
git add apps/demo-app
git commit -m "feat: add demo application environments"
git push
```

## 2. Render Locally

```bash
kubectl kustomize apps/demo-app/overlays/dev
```

Verify:

- Namespace is `gitops-demo-dev`
- Deployment has the development replica count
- ConfigMap contains `APP_ENV=development`
- Service selects the same labels as the Deployment

## 3. Prepare the Application

Copy:

```bash
cp /path/to/gitops-fundamentals/examples/argocd/applications/kustomize-dev.yaml \
  argocd/applications/demo-app-dev.yaml
```

Replace:

```text
https://github.com/REPLACE_ME/gitops-lab.git
```

with your repository URL.

If your directory layout differs, update `spec.source.path`.

Commit and push the Application file.

## 4. Apply the Application Definition

```bash
kubectl apply -f argocd/applications/demo-app-dev.yaml
kubectl get application demo-app-dev -n argocd
```

The Application may initially be OutOfSync.

## 5. Inspect Before Sync

CLI:

```bash
argocd app get demo-app-dev
argocd app diff demo-app-dev
```

Kubernetes:

```bash
kubectl describe application demo-app-dev -n argocd
```

UI:

- Open the application tree
- Inspect resource count
- Check target revision
- Review the diff

## 6. Synchronize

```bash
argocd app sync demo-app-dev
argocd app wait demo-app-dev --sync --health
```

Alternative: use the UI Sync action.

## 7. Verify Kubernetes

```bash
kubectl get all,configmap -n gitops-demo-dev
kubectl describe deployment demo-app -n gitops-demo-dev
```

## 8. Test the Service

```bash
kubectl port-forward -n gitops-demo-dev svc/demo-app 8081:80
```

Open `http://localhost:8081`.

## 9. Inspect History

```bash
argocd app history demo-app-dev
kubectl get application demo-app-dev -n argocd -o yaml
```

## Verification

The application should be:

```text
Sync: Synced
Health: Healthy
```

## Reflection

- What is the source of truth?
- Which Git revision is deployed?
- Did applying the Application itself deploy the workload immediately?
- What information is visible in Argo CD that a plain `kubectl apply` does not preserve?
