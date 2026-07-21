# Lab 1 — Cluster and Argo CD Setup

## Objective

Create a disposable Kubernetes cluster, install Argo CD, access its UI, and identify the main components.

## 1. Validate Tools

```bash
make check-environment
```

Resolve all required-tool failures before continuing.

## 2. Create Cluster

```bash
make cluster-create
kubectl cluster-info
kubectl get nodes -o wide
```

Expected result:

- Context points to `kind-gitops-lab`
- At least one Ready node exists

## 3. Install Argo CD

```bash
make argocd-install
kubectl get all -n argocd
```

Wait until the main workloads are ready:

```bash
kubectl wait --for=condition=Available deployment/argocd-server \
  -n argocd --timeout=300s
kubectl wait --for=condition=Available deployment/argocd-repo-server \
  -n argocd --timeout=300s
```

## 4. Identify Components

```bash
kubectl get deployment,statefulset,service -n argocd
```

Record which workload corresponds to:

- API server
- Repository server
- Application controller
- ApplicationSet controller

## 5. Retrieve Initial Password

```bash
make argocd-password
```

Do not commit it.

## 6. Port Forward

```bash
make argocd-port-forward
```

Open `https://localhost:8080`.

Login with:

```text
username: admin
password: value from previous step
```

## 7. Optional CLI Login

```bash
argocd login localhost:8080 --username admin --insecure
argocd version
```

## 8. Inspect CRDs

```bash
kubectl get crd | grep argoproj
```

Identify:

- Applications
- AppProjects
- ApplicationSets

## 9. Inspect Logs

```bash
kubectl logs -n argocd deployment/argocd-repo-server --tail=20
kubectl logs -n argocd statefulset/argocd-application-controller --tail=20
```

## Verification

```bash
kubectl get pods -n argocd
kubectl get applications -n argocd
```

All main Pods should be Running or Ready. No Applications are expected yet.

## Reflection

- Why is the application controller a StatefulSet in the standard installation?
- Which component renders Helm or Kustomize?
- Which component talks to the target Kubernetes API?
- Why should production use a pinned and verified Argo CD release?
