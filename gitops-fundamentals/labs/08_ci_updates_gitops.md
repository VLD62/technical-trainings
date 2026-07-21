# Lab 8 — CI Updates the GitOps Repository

## Objective

Simulate a CI pipeline that publishes an immutable artifact and proposes a GitOps configuration update.

## 1. Inspect Examples

```bash
sed -n '1,240p' examples/ci/Jenkinsfile
sed -n '1,260p' examples/ci/github-actions-update-gitops.yaml
```

Identify the boundary between:

- Application build
- Artifact publication
- Desired-state update
- Deployment reconciliation

## 2. Choose a Version

Use a lab value:

```bash
export NEW_IMAGE="nginx:1.27.5-alpine"
```

## 3. Create a Promotion Branch

In the GitOps repository:

```bash
git switch -c automation/demo-app-dev-1.27.5
```

## 4. Update Kustomize

With standalone Kustomize:

```bash
cd apps/demo-app/overlays/dev
kustomize edit set image nginx="${NEW_IMAGE}"
```

Or edit the `images` block manually.

## 5. Validate

```bash
kubectl kustomize . > /tmp/demo-app-dev.yaml
grep -n "image:" /tmp/demo-app-dev.yaml
```

## 6. Commit Like Automation

```bash
git add kustomization.yaml
git commit -m "chore(dev): update demo-app image to 1.27.5-alpine"
git push -u origin HEAD
```

Open a pull request.

## 7. Pull-Request Evidence

Include:

- Source commit
- Build identifier
- Image tag and digest when available
- Scan status
- Rendered diff
- Target environment
- Rollback plan

## 8. Merge and Observe

After approval, merge.

Observe:

```bash
argocd app get demo-app-dev --refresh
argocd app wait demo-app-dev --sync --health
```

## 9. Credential Design

List credentials the CI system needs:

- Application repository read
- Registry write
- GitOps repository branch or pull-request permission

List credentials it should not need:

- Cluster-admin kubeconfig
- Argo CD administrator password
- Production secret-manager administrator

## 10. Prevent Loops

Document:

- Path filters
- Bot identity
- Branch naming
- Change detection
- Concurrency
- Pull-request requirement
- Commit-message conventions

## Reflection

- Did CI deploy?
- Which component deployed?
- Why should the same immutable artifact be promoted?
- Would direct Git push be acceptable for development? Production?
