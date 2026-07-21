# Lab 6 — AppProjects, RBAC, and Sync Windows

## Objective

Create a restricted AppProject, assign an Application to it, test denied configuration, and discuss RBAC and change windows.

## 1. Prepare the Project

Copy:

```bash
cp examples/argocd/projects/training-project.yaml \
  argocd/projects/training-project.yaml
```

Replace the repository URL.

Apply:

```bash
kubectl apply -f argocd/projects/training-project.yaml
kubectl get appproject training -n argocd -o yaml
```

## 2. Assign the Application

Change:

```yaml
spec:
  project: training
```

Apply and verify.

## 3. Test Destination Restriction

Create a copy of the Application with:

```yaml
destination:
  server: https://kubernetes.default.svc
  namespace: forbidden-namespace
```

Apply it.

Inspect:

```bash
kubectl describe application denied-demo -n argocd
```

Expected: the project rejects the destination.

Delete the denied Application afterward.

## 4. Test Source Restriction

Point another temporary Application to an unapproved repository URL.

Observe the project condition.

## 5. Review Resource Allow-Lists

Ask whether the application requires:

- Namespace
- Deployment
- Service
- ConfigMap
- Secret
- ClusterRole
- CustomResourceDefinition

Remove unnecessary cluster-scoped permissions.

## 6. Add a Sync Window

Use a lab-friendly deny window of a few minutes or review the included commented example.

Conceptual example:

```yaml
syncWindows:
  - kind: deny
    schedule: "0 22 * * *"
    duration: 8h
    applications:
      - "*-prod"
    manualSync: false
```

Do not accidentally block the remaining class unless you understand the schedule.

## 7. RBAC Design Exercise

Design roles:

### Developer

- View training applications
- View logs
- Sync development
- Cannot change projects
- Cannot sync production

### Operator

- View all applications
- Sync staging and production
- Override window only through approved process

### Administrator

- Manage repositories, clusters, projects, and RBAC
- Restricted to platform administrators

Write conceptual `policy.csv` lines.

## 8. Secret Strategy

Choose one:

- External Secrets
- SOPS
- Sealed Secrets
- CSI Driver

Document:

- Source of secret value
- Authentication
- Rotation
- Backup
- Recovery
- Audit
- Developer access

## Reflection

- What did AppProject prevent?
- Which restrictions belong in Git, Argo CD RBAC, Kubernetes RBAC, or admission policy?
- Who can override a production sync window?
- Does encrypted secret material in Git eliminate all risk?
