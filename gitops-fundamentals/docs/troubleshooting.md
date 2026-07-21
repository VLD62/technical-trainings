# Troubleshooting

## Diagnostic Model

Classify the failure:

1. Source
2. Authentication
3. Manifest generation
4. Comparison
5. Authorization
6. Synchronization
7. Kubernetes rollout
8. Health assessment
9. Competing ownership
10. Observability

## Source Problems

Symptoms:

- Repository not found
- Revision not found
- Path does not exist
- TLS or SSH error
- Authentication failed

Checks:

```bash
git ls-remote https://github.com/REPLACE_ME/gitops-lab.git
argocd repo list
kubectl logs -n argocd deployment/argocd-repo-server
```

Confirm:

- URL
- Revision
- Path
- Credentials
- Certificate trust
- SSH host keys
- Network egress

## Manifest-Generation Problems

Render locally:

```bash
kubectl kustomize examples/app/overlays/dev
helm template demo-app examples/helm/demo-app
```

Common causes:

- Invalid YAML
- Missing file
- Wrong relative path
- Helm template error
- Unsupported API version
- Missing plugin
- Dependency fetch failure
- Different tool version

Pin tool versions and reproduce generation in CI.

## Application Is OutOfSync

Inspect:

```bash
argocd app diff demo-app
argocd app manifests demo-app
kubectl get all -n gitops-demo-dev -o yaml
```

Possible causes:

- Direct cluster change
- Defaulted fields
- Mutating admission webhook
- Horizontal Pod Autoscaler changes replicas
- Another controller owns a field
- Non-deterministic rendering
- Secret or timestamp generation
- Resource tracking conflict

Do not globally ignore differences just to make the dashboard green.

## Sync Fails

Check:

```bash
argocd app get demo-app
kubectl describe application demo-app -n argocd
kubectl get events -n gitops-demo-dev --sort-by=.lastTimestamp
```

Common causes:

- Missing namespace
- RBAC denial
- Invalid resource
- Admission policy rejection
- Immutable field change
- Dependency ordering
- Hook failure
- Resource already owned elsewhere
- Finalizer blocking deletion

## Synced but Degraded

The cluster matches Git, but the workload is unhealthy.

Check:

```bash
kubectl get pods -n gitops-demo-dev
kubectl describe deployment demo-app -n gitops-demo-dev
kubectl logs -n gitops-demo-dev deployment/demo-app
kubectl get events -n gitops-demo-dev --sort-by=.lastTimestamp
```

Possible causes:

- Image pull failure
- Crash loop
- Bad readiness probe
- Missing configuration
- Resource constraints
- Scheduling failure
- Dependency unavailable

Fix the desired state or the external dependency.

## ApplicationSet Problems

Check:

```bash
kubectl get applicationset -n argocd
kubectl describe applicationset demo-app-environments -n argocd
kubectl logs -n argocd deployment/argocd-applicationset-controller
```

Common causes:

- Template field mismatch
- Invalid generator
- Repository authentication
- Unexpected directory discovery
- Name collision
- Project restriction
- Deletion behavior misunderstanding

## Permission Problems

Test Kubernetes authorization:

```bash
kubectl auth can-i create deployments \
  --as=system:serviceaccount:argocd:argocd-application-controller \
  -n gitops-demo-dev
```

Also inspect:

- Argo CD RBAC
- AppProject source and destination rules
- Kubernetes RoleBindings
- Cluster registration
- Namespace existence

## Emergency Recovery

Avoid random retries and broad permission grants.

1. Freeze unrelated changes.
2. Preserve logs and current status.
3. Identify the last known-good Git revision.
4. Determine whether data migration prevents rollback.
5. Revert or fix forward in Git.
6. Sync the narrowest affected application.
7. Verify health and business behavior.
8. Remove temporary access.
9. Document the incident.
