# Repository Strategies

## Repository Roles

A practical GitOps implementation often separates at least two concerns.

### Application Source Repository

Contains:

- Application source code
- Unit and integration tests
- Dockerfile
- Build configuration
- Optional Helm chart owned with the application

### GitOps or Environment Repository

Contains:

- Deployable versions
- Environment-specific configuration
- Kubernetes manifests
- Helm values
- Kustomize overlays
- Argo CD Applications and Projects
- Promotion history

This separation prevents the build pipeline from treating a source-code merge as an automatic production deployment without an explicit desired-state change.

## Common Models

### Single Repository

```text
repository/
├── src/
├── Dockerfile
├── chart/
└── environments/
    ├── dev/
    ├── staging/
    └── prod/
```

Advantages:

- Simple discovery
- Atomic application and deployment changes
- Easy for small teams

Trade-offs:

- Application and platform permissions are harder to separate
- Repository grows quickly
- Production history is mixed with application development

### Application Repository Plus Environment Repository

```text
demo-app/
├── src/
├── Dockerfile
└── chart/

platform-environments/
├── apps/demo-app/
└── clusters/
```

Advantages:

- Clear separation of build and deployment
- Different access controls
- Dedicated audit history
- Easier centralized governance

Trade-offs:

- Cross-repository automation
- Version coordination
- More repository administration

### Repository Per Environment

```text
environment-dev/
environment-staging/
environment-prod/
```

Advantages:

- Strong permission boundaries
- Independent lifecycle

Trade-offs:

- Duplication
- Promotion requires cross-repository updates
- Global changes are harder

### Repository Per Cluster

Useful when clusters have independent ownership, lifecycle, or regulatory boundaries. Fleet-wide changes require automation or generation.

## Environment Layout

### Folder-Based Environments

```text
apps/demo-app/
├── base/
└── overlays/
    ├── dev/
    ├── staging/
    └── prod/
```

This is the primary pattern used in the course.

### Branch-Based Environments

```text
dev
staging
production
```

Branch-based environments look simple but can create long-lived divergence and difficult merges. Use only when branch-level access controls or external constraints justify it.

### Tag or Commit Pinning

An environment can track a specific commit or tag. This increases determinism but requires an explicit update process.

## Promotion Models

### Pull Request Promotion

1. CI publishes an immutable artifact.
2. Automation or a person proposes a GitOps change.
3. Tests render and validate the desired state.
4. Reviewers approve.
5. Merge changes the environment's desired state.
6. The controller reconciles.

### Copy Forward

A tested version is copied from one environment overlay to the next. This creates clear promotion commits.

### Central Version File

A file maps applications to versions:

```yaml
applications:
  demo-app:
    dev: 1.4.3
    staging: 1.4.2
    prod: 1.4.1
```

Generation then produces environment manifests. This can simplify fleets but introduces tooling that must be maintained.

## Naming and Ownership

Recommended conventions:

- Use predictable directory names.
- Encode environment and application identity in metadata.
- Add ownership labels or annotations.
- Document who may approve each path.
- Use `CODEOWNERS` for critical directories.
- Separate platform resources from tenant application resources.
- Avoid hidden mutations outside reviewed configuration.

## Source Revision Strategy

Argo CD can track:

- Branches
- Tags
- Semantic version ranges in supported source types
- Specific commits

For production:

- Prefer explicit and auditable promotion.
- Avoid tracking uncontrolled moving branches from third parties.
- Pin dependencies.
- Verify signatures or provenance where appropriate.
- Treat rendered output as a security boundary.

## Anti-Patterns

- One repository with unrestricted write access for every team
- Direct production tracking of an application development branch
- Plaintext secrets
- Mutable `latest` image tags
- Environment branches with months of divergence
- Manual changes that are never reconciled into Git
- CI directly changing the cluster and GitOps also managing the same resources
- Multiple controllers claiming ownership of the same fields
- Repository generators that cannot be reproduced locally
- A single unreviewed commit changing every cluster simultaneously
