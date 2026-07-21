# Helm and Kustomize

## Session 5

---

## Configuration Choices

- Plain YAML
- Kustomize
- Helm
- Jsonnet
- Custom plugins

Choose the simplest tool that expresses the required variation.

---

## Plain YAML

Best for:

- Small resource sets
- Maximum transparency
- Teaching Kubernetes objects

Cost:

- Duplication
- Difficult environment variation

---

## Kustomize Model

```text
base + overlay patches = rendered environment
```

---

## Base

Contains common resources:

- Deployment
- Service
- ConfigMap
- Labels

The base should not encode environment-specific assumptions.

---

## Overlay

Contains differences:

- Namespace
- Replica count
- Image version
- Environment config
- Resource settings
- Ingress host

---

## Render Kustomize

```bash
kubectl kustomize examples/app/overlays/dev
```

Always render before merge.

---

## Helm Model

```text
Chart templates + values = rendered manifests
```

---

## Chart Structure

```text
Chart.yaml
values.yaml
templates/
```

Optional:

- values schema
- dependencies
- tests
- notes

---

## Argo CD with Helm

Argo CD uses Helm to generate manifests.

Argo CD owns reconciliation.

Helm release state is not the primary control loop in this model.

---

## Values Files

Prefer:

```yaml
helm:
  valueFiles:
    - values-dev.yaml
```

Avoid hidden UI-only overrides.

---

## Template Complexity

A chart is code.

Review:

- Conditions
- Loops
- Defaults
- Required values
- Generated names
- Security context
- API versions

---

## Environment Strategy

Kustomize:

```text
base + dev/staging/prod overlays
```

Helm:

```text
chart + values-dev/staging/prod
```

Both can work.

---

## Hybrid Pattern

Use Helm to package an application, then Kustomize to compose platform-level resources only when the complexity is justified.

Avoid layers that nobody can reproduce locally.

---

## Validation

```bash
make render
make helm-lint
```

Production CI should add:

- Schema validation
- Policy checks
- Secret scanning
- Diff reporting

---

## Lab Focus

- Compare three overlays
- Change replica counts
- Update image
- Render a chart
- Deploy chart through Argo CD
- Inspect generated manifests
