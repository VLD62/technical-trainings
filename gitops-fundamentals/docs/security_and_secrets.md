# Security and Secrets

## Security Model

GitOps security spans:

1. Source repository
2. Change review
3. Artifact supply chain
4. GitOps controller
5. Target cluster
6. Secrets
7. Observability and audit
8. Emergency access

A secure controller cannot compensate for unrestricted production Git writes.

## Repository Controls

Recommended controls:

- Strong authentication and multi-factor authentication
- Protected default and production branches
- Required pull-request reviews
- `CODEOWNERS`
- Signed commits or verified identities where appropriate
- Required CI status checks
- Secret scanning
- Dependency and policy checks
- Restricted force pushes
- Audit logging
- Separate automation identities
- Short-lived tokens

## Controller Permissions

Argo CD needs sufficient permissions to manage its assigned resources. Avoid a single unrestricted controller when organizational boundaries require isolation.

Use:

- AppProjects
- Destination restrictions
- Source repository restrictions
- Resource allow and deny lists
- Kubernetes RBAC
- Separate Argo CD instances where security boundaries justify them
- Namespace-scoped application management where appropriate
- Network policies
- Pod security controls
- Workload identity

## AppProject Example

```yaml
apiVersion: argoproj.io/v1alpha1
kind: AppProject
metadata:
  name: training
  namespace: argocd
spec:
  sourceRepos:
    - https://github.com/REPLACE_ME/gitops-lab.git
  destinations:
    - namespace: gitops-demo-*
      server: https://kubernetes.default.svc
  clusterResourceWhitelist:
    - group: ""
      kind: Namespace
  namespaceResourceWhitelist:
    - group: apps
      kind: Deployment
    - group: ""
      kind: Service
    - group: ""
      kind: ConfigMap
```

Production allow-lists should reflect actual requirements and avoid broad wildcards where practical.

## Argo CD RBAC

Argo CD RBAC controls Argo CD actions such as:

- Get application
- Sync application
- Update project
- Access logs
- Manage repositories
- Manage clusters

It does not replace Kubernetes RBAC. Both layers matter.

Example conceptual policy:

```csv
p, role:developer, applications, get, training/*, allow
p, role:developer, applications, sync, training/*, allow
p, role:developer, logs, get, training/*, allow
g, team-platform-developers, role:developer
```

## Secrets Must Not Be Plaintext

A Kubernetes Secret manifest is base64-encoded, not encrypted.

Unsafe:

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: database
stringData:
  password: real-production-password
```

## Common Secret Patterns

### External Secrets

Store secrets in an external manager and reconcile references into Kubernetes.

Benefits:

- Central lifecycle
- Rotation
- Audit controls
- No encrypted secret payload in application Git

Trade-offs:

- External dependency
- Additional controller
- Access-policy design

### Sealed Secrets

Encrypt a secret so only a controller in the target cluster can decrypt it.

Benefits:

- Encrypted object can be stored in Git
- Git-native workflow

Trade-offs:

- Key backup and rotation are critical
- Encrypted payload still requires lifecycle management
- Cluster migration requires planning

### SOPS

Encrypt selected YAML fields with keys managed through supported providers.

Benefits:

- Human-readable structure
- Multiple key-management options
- Works with several GitOps workflows

Trade-offs:

- Decryption integration
- Key-policy design
- Avoid leaking decrypted output into logs or caches

### Secrets Store CSI Driver

Mount secrets from an external provider into Pods.

Benefits:

- Secrets may avoid persistent Kubernetes Secret objects
- Provider-driven rotation options

Trade-offs:

- Application consumption model changes
- Provider availability affects workloads

## Repository Credentials

Argo CD repository credentials are secrets. Use:

- Dedicated read-only deploy keys
- Narrow token scope
- Rotation
- Central secret management
- Separate credentials per boundary
- TLS and SSH host verification
- No credentials embedded in `repoURL`

## Supply-Chain Controls

- Pin image digests for high assurance
- Sign artifacts
- Verify provenance
- Scan images and manifests
- Restrict registries
- Enforce admission policies
- Pin Helm chart and Git revisions
- Review config-management plugins
- Avoid executing untrusted repository code in privileged renderers

## Sync Windows and Change Control

Sync windows can permit or deny synchronization during defined periods. They support operational governance but do not replace review, testing, or incident procedures.

Use them for:

- Production change windows
- Freeze periods
- Coordinated maintenance
- Temporary deployment restrictions

Document who may override them and how overrides are audited.

## Break-Glass Access

A break-glass procedure should define:

- Trigger criteria
- Authorized roles
- Time-limited access
- Audit trail
- Scope limits
- Communication
- Git reconciliation
- Post-incident review

Manual production changes that remain outside Git create hidden desired state and future reconciliation risk.
