# Lab 4 — Kustomize Environments and Promotion

## Objective

Render and compare development, staging, and production overlays, then promote one immutable application version.

## 1. Render All Environments

From the course module:

```bash
make render
```

Or manually:

```bash
kubectl kustomize examples/app/overlays/dev
kubectl kustomize examples/app/overlays/staging
kubectl kustomize examples/app/overlays/prod
```

## 2. Compare Output

```bash
diff -u .rendered/dev.yaml .rendered/staging.yaml || true
diff -u .rendered/staging.yaml .rendered/prod.yaml || true
```

Identify differences in:

- Namespace
- Replicas
- Environment label
- ConfigMap values
- Resources
- Image version

## 3. Create Staging Application

Copy and modify the development Application:

```bash
cp argocd/applications/demo-app-dev.yaml \
  argocd/applications/demo-app-staging.yaml
```

Change:

- Name to `demo-app-staging`
- Path to staging
- Namespace to `gitops-demo-staging`

Commit, push, and apply.

## 4. Promote a Version

Assume dev uses `nginx:1.27.5-alpine`.

Update staging to the same version using:

```bash
cd apps/demo-app/overlays/staging
kustomize edit set image nginx=nginx:1.27.5-alpine
```

If only `kubectl` is installed, edit `kustomization.yaml` manually.

Commit:

```text
promote(demo-app): staging to nginx 1.27.5-alpine
```

Push and observe synchronization.

## 5. Production Pull Request

Create a branch:

```bash
git switch -c promote/demo-app-1.27.5-prod
```

Update only the production image version.

Render and inspect:

```bash
kubectl kustomize apps/demo-app/overlays/prod > /tmp/prod.yaml
```

Open a pull request with:

- Old version
- New version
- Staging evidence
- Risk
- Rollback plan

Do not merge automatically during the exercise unless instructed.

## 6. Rollback Design

Write the exact Git operation you would use after a failed production deployment:

- Revert the promotion commit
- Fix forward with another version
- Adjust configuration

Explain why database changes may require a separate plan.

## Reflection

- Did the same artifact move between environments?
- Which configuration differed?
- Why is folder promotion easier to review than merging long-lived environment branches?
- Which checks should be mandatory for production?
