# Lab 3 — Automated Sync, Drift, Pruning, and Health

## Objective

Enable automated synchronization, create live drift, observe self-healing, test pruning, and distinguish sync from health.

## 1. Enable Automated Sync

Edit the Application:

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

Commit and push the change, then apply the updated Application definition if the bootstrap directory is not itself managed by Argo CD:

```bash
kubectl apply -f argocd/applications/demo-app-dev.yaml
```

## 2. Git Change

Update the ConfigMap message in the dev overlay.

Commit and push:

```bash
git add .
git commit -m "feat(dev): update demo message"
git push
```

Observe:

```bash
argocd app get demo-app-dev --refresh
argocd app wait demo-app-dev --sync --health
```

## 3. Create Live Drift

```bash
kubectl scale deployment demo-app \
  -n gitops-demo-dev --replicas=7
```

Immediately inspect:

```bash
kubectl get deployment demo-app -n gitops-demo-dev
argocd app diff demo-app-dev
```

Wait and inspect again.

Expected: self-healing restores the desired replica count.

## 4. Create ConfigMap Drift

```bash
kubectl patch configmap demo-app-config \
  -n gitops-demo-dev \
  --type merge \
  -p '{"data":{"APP_MESSAGE":"manual drift"}}'
```

Observe correction.

## 5. Pruning Exercise

Add a temporary resource to the base:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: temporary-config
data:
  purpose: pruning-demo
```

Reference it in `base/kustomization.yaml`, commit, push, and wait for sync.

Verify:

```bash
kubectl get configmap temporary-config -n gitops-demo-dev
```

Now remove the file and its Kustomize reference. Commit and push.

Expected: Argo CD prunes the live ConfigMap.

## 6. Synced but Degraded

Change the image tag to a deliberately invalid value:

```yaml
images:
  - name: nginx
    newTag: does-not-exist
```

Commit and push.

Observe:

```bash
argocd app get demo-app-dev
kubectl get pods -n gitops-demo-dev
kubectl describe pods -n gitops-demo-dev
```

Expected:

- Application may become Synced
- Health becomes Degraded or Progressing
- Pods show image pull errors

## 7. Fix Through Git

Revert the image change:

```bash
git revert HEAD
git push
```

Wait for health:

```bash
argocd app wait demo-app-dev --health --sync --timeout 300
```

## Reflection

- Which changes were corrected by self-healing?
- What did pruning delete?
- Why was the invalid image still Synced?
- What controls should protect automated production pruning?
- What would happen during a break-glass incident?
