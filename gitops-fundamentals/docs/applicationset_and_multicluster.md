# ApplicationSet and Multi-Cluster Patterns

## Why ApplicationSet

Creating many similar Argo CD `Application` resources manually creates duplication.

ApplicationSet combines:

- A generator
- An Application template
- Optional selectors and combinations

It can generate applications for:

- A list of environments
- Registered clusters
- Git directories
- Git files
- Pull requests
- Source-control organizations or repositories
- Combined matrix or merge inputs

## List Generator Example

```yaml
apiVersion: argoproj.io/v1alpha1
kind: ApplicationSet
metadata:
  name: demo-app-environments
  namespace: argocd
spec:
  generators:
    - list:
        elements:
          - environment: dev
            namespace: gitops-demo-dev
          - environment: staging
            namespace: gitops-demo-staging
          - environment: prod
            namespace: gitops-demo-prod
  template:
    metadata:
      name: "demo-app-{{environment}}"
    spec:
      project: training
      source:
        repoURL: https://github.com/REPLACE_ME/gitops-lab.git
        targetRevision: main
        path: "apps/demo-app/overlays/{{environment}}"
      destination:
        server: https://kubernetes.default.svc
        namespace: "{{namespace}}"
```

## Git Directory Generator

A Git directory generator can discover folders such as:

```text
apps/*/overlays/*
```

This reduces manual registration, but repository naming becomes an API. A mistaken directory can generate an application.

Use:

- Strict paths
- Pull-request validation
- Project restrictions
- Preview before merge
- Clear deletion behavior

## Cluster Generator

The cluster generator creates Applications from clusters registered with Argo CD.

Useful metadata includes:

- Cluster name
- Server address
- Labels
- Annotations

Label clusters by stable intent:

```text
environment=prod
region=eu-central
tenant=payments
compliance=pci
```

Avoid labels that expose secrets or rapidly changing operational data.

## Multi-Cluster Models

### Central Argo CD

One control plane manages multiple clusters.

Advantages:

- Central visibility
- Shared policy and configuration
- Easier operations

Trade-offs:

- Larger blast radius
- Cross-cluster credentials
- Network dependency
- Scaling and tenancy complexity

### Argo CD Per Cluster

Each cluster runs its own controller.

Advantages:

- Strong isolation
- Local reconciliation
- Smaller blast radius

Trade-offs:

- More instances to upgrade and observe
- Fleet-wide visibility requires aggregation
- Repeated configuration

### Hub-and-Spoke

A central management layer bootstraps or configures local Argo CD instances. This combines fleet policy with local reconciliation but increases design complexity.

## Application Deletion

Understand how deletion propagates.

Questions:

- Does deleting the Application delete workloads?
- Does deleting an ApplicationSet delete generated Applications?
- Are finalizers configured?
- Should production workloads remain when the control-plane object is removed?
- Who may remove a cluster from the generator?

Test deletion behavior in a disposable environment.

## Progressive Syncs

ApplicationSet can coordinate ordered or grouped synchronization in supported configurations. Use this only after defining dependency and failure behavior.

Avoid building a fragile distributed transaction across many clusters. Prefer independently recoverable components.

## Fleet Safety

- Stage changes through representative clusters
- Limit concurrency
- Use sync windows
- Separate critical clusters
- Apply project restrictions
- Observe controller queues and API limits
- Define partial-failure handling
- Keep cluster registration credentials narrow
- Practice control-plane recovery
- Avoid one unreviewed commit affecting the entire fleet
