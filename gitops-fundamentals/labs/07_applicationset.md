# Lab 7 — ApplicationSet

## Objective

Generate development, staging, and production Applications from a list generator.

## 1. Prepare Environment Paths

Confirm your GitOps repository contains:

```text
apps/demo-app/overlays/dev
apps/demo-app/overlays/staging
apps/demo-app/overlays/prod
```

Render all three locally.

## 2. Prepare AppProject

Ensure the `training` AppProject allows:

```text
gitops-demo-dev
gitops-demo-staging
gitops-demo-prod
```

## 3. Prepare ApplicationSet

Copy:

```bash
cp examples/argocd/applicationsets/demo-environments.yaml \
  argocd/applicationsets/demo-environments.yaml
```

Replace repository URL and source path.

## 4. Remove Manual Duplicates

To avoid ownership conflicts, delete or rename manually created environment Applications before applying the ApplicationSet.

Do not delete workloads unless intended. Review finalizers and cascade behavior.

## 5. Apply

```bash
kubectl apply -f argocd/applicationsets/demo-environments.yaml
kubectl get applicationset -n argocd
kubectl get applications -n argocd
```

Expected generated Applications:

```text
demo-app-dev
demo-app-staging
demo-app-prod
```

## 6. Inspect Ownership

```bash
kubectl get application demo-app-dev -n argocd -o yaml
```

Find owner references and generated metadata.

## 7. Add an Environment

Add a list element:

```yaml
- environment: qa
  namespace: gitops-demo-qa
  replicas: "1"
```

First create the corresponding overlay and allow the namespace in the project.

Commit, push, and apply the updated ApplicationSet if it is not yet self-managed.

Observe generated Application creation.

## 8. Remove the Environment

Before removal, predict:

- Will the generated Application be deleted?
- Will workloads be deleted?
- Which finalizers apply?

Test only in the disposable lab.

## 9. Explore a Git Generator

Design a generator that discovers:

```text
apps/*/overlays/*
```

Discuss safeguards required before using discovery in production.

## Reflection

- What became simpler?
- What new blast-radius risk appeared?
- Which repository names became part of the generator API?
- How would you stage fleet-wide changes?
