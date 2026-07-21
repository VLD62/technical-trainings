# Helm and Kustomize in GitOps

## Plain YAML

Plain YAML is transparent and easy to inspect.

Use it when:

- The resource set is small
- Variations are limited
- Duplication is acceptable
- Learners need direct visibility

Trade-off: duplication grows as environments diverge.

## Kustomize

Kustomize composes a reusable base with overlays.

```text
app/
├── base/
│   ├── deployment.yaml
│   ├── service.yaml
│   └── kustomization.yaml
└── overlays/
    ├── dev/
    ├── staging/
    └── prod/
```

A base should represent common intent. Overlays should contain only meaningful environment differences.

Example overlay:

```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: gitops-demo-dev
resources:
  - ../../base
patches:
  - path: replica-patch.yaml
images:
  - name: nginx
    newTag: 1.27.5-alpine
```

Render locally:

```bash
kubectl kustomize examples/app/overlays/dev
```

Advantages:

- Native Kubernetes-object model
- Minimal templating
- Clear patches
- Good fit for environment overlays

Trade-offs:

- Deep overlay trees become difficult to reason about
- Patch behavior requires care
- Cross-cutting changes can become repetitive

## Helm

Helm packages Kubernetes resources as charts and renders templates from values.

Advantages:

- Reusable packaging
- Rich ecosystem
- Conditional resources
- Versioned chart releases
- Familiar application-distribution model

Trade-offs:

- Templates can hide generated complexity
- Values schemas may be weak
- Excessive logic reduces readability
- Chart and application versioning can be confused

Lint and render:

```bash
helm lint examples/helm/demo-app
helm template demo-app examples/helm/demo-app \
  --namespace gitops-helm-demo
```

## Argo CD and Helm

Argo CD commonly uses Helm as a manifest generator. Argo CD, not Helm, owns the deployment operation in this model.

The application should specify:

- Repository
- Revision
- Chart path or chart name
- Values files
- Parameters only when justified
- Destination cluster and namespace

Prefer values in Git over ad hoc parameter overrides because Git should retain the complete approved desired state.

## Selection Guide

| Need | Plain YAML | Kustomize | Helm |
|---|---:|---:|---:|
| Maximum transparency | Excellent | Good | Moderate |
| Small application | Excellent | Good | Good |
| Environment overlays | Limited | Excellent | Good |
| Reusable distributable package | Limited | Moderate | Excellent |
| Conditional rendering | Limited | Moderate | Excellent |
| Minimal template logic | Excellent | Excellent | Depends on chart |
| Third-party software | Moderate | Moderate | Excellent |

## Versioning Guidance

Keep these separate:

- Application version
- Container image tag or digest
- Helm chart version
- Git commit
- Environment promotion record

Production deployments should be reproducible from a known Git revision and immutable artifact references.

## Render Before Merge

A GitOps pull request should validate generated output:

```bash
kubectl kustomize apps/demo-app/overlays/prod > rendered.yaml
helm template demo-app charts/demo-app -f values-prod.yaml > rendered.yaml
```

Useful validation layers:

- YAML parsing
- Kubernetes schema validation
- Policy checks
- Security scanning
- Diff against the current environment
- Dry-run against a compatible API server
- Human review of critical changes
