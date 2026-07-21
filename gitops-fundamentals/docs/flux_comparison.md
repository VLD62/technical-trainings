# Argo CD and Flux Comparison

## Shared GitOps Foundations

Both Argo CD and Flux can:

- Reconcile Kubernetes resources
- Use Git as a desired-state source
- Work with Kustomize and Helm
- Detect drift
- Automate delivery
- Operate through Kubernetes custom resources
- Manage multiple applications and clusters
- Emit operational signals

Tool selection should follow organizational needs rather than popularity alone.

## Architectural Style

### Argo CD

Argo CD provides:

- A prominent web UI
- A centralized Application abstraction
- AppProjects for boundaries
- CLI and API
- ApplicationSet for generation
- Rich application tree and health visualization

### Flux

Flux is built from specialized controllers and APIs, commonly including:

- Source Controller
- Kustomize Controller
- Helm Controller
- Notification Controller
- Image automation controllers when installed

Flux emphasizes a toolkit of composable Kubernetes-native controllers.

## Concept Mapping

| Concern | Argo CD | Flux |
|---|---|---|
| Git source | `Application.spec.source` or repository configuration | `GitRepository` |
| Kustomize reconciliation | `Application` with Kustomize source | `Kustomization` |
| Helm reconciliation | `Application` with Helm source | `HelmRelease` plus source |
| App grouping and policy | `AppProject` | Kubernetes RBAC, namespaces, controller configuration, and conventions |
| App generation | ApplicationSet | Kustomization composition and automation patterns |
| UI | Built-in web UI | Controller-first; ecosystem UIs vary |
| Notifications | Argo CD Notifications | Notification Controller |
| Image updates | External automation or integrations | Flux image automation controllers |

## Flux Example

```yaml
apiVersion: source.toolkit.fluxcd.io/v1
kind: GitRepository
metadata:
  name: gitops-lab
  namespace: flux-system
spec:
  interval: 1m
  url: https://github.com/REPLACE_ME/gitops-lab.git
  ref:
    branch: main
---
apiVersion: kustomize.toolkit.fluxcd.io/v1
kind: Kustomization
metadata:
  name: demo-app-dev
  namespace: flux-system
spec:
  interval: 5m
  path: ./apps/demo-app/overlays/dev
  prune: true
  sourceRef:
    kind: GitRepository
    name: gitops-lab
  targetNamespace: gitops-demo-dev
  wait: true
  timeout: 3m
```

## Selection Questions

Choose based on:

- User-interface requirements
- Multi-tenancy model
- Existing Kubernetes expertise
- Controller customization needs
- Fleet topology
- Source types
- Helm lifecycle requirements
- Image automation requirements
- Operational ownership
- Security boundaries
- Existing ecosystem integrations
- Team preference for centralized application views versus composable APIs

## Avoid False Comparisons

Neither tool is universally better.

A fair proof of concept should test:

- Repository authentication
- Environment promotion
- Drift correction
- Multi-cluster management
- Secret integration
- Failure recovery
- Controller upgrade
- Metrics and alerts
- RBAC
- Rendering performance
- Developer experience
- Operational troubleshooting

## Migration Considerations

Moving tools does not automatically require changing the application manifests, but it does require translating controller resources, credentials, policies, and operating procedures.

Plan for:

- Ownership handoff
- Avoiding simultaneous reconciliation
- Finalizers and deletion behavior
- Health semantics
- Diff customization
- Hooks and waves
- Notifications
- Audit continuity
- Rollback
