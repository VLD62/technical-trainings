# Lab 10 — Final Project

## Scenario

Design a GitOps delivery platform for:

- 30 applications
- Development, staging, and production
- Four Kubernetes clusters
- Six product teams
- Jenkins for CI
- Central container registry
- External secret manager
- Required production approvals
- Production deployment windows
- Platform team on call
- Security team policy requirements

## Deliverables

### 1. Repository Design

Provide a tree showing:

- Application repositories
- GitOps repository or repositories
- Environment structure
- Cluster structure
- Platform resources
- Application resources
- Ownership files

Explain the chosen boundaries.

### 2. Application Configuration

Create one example application using:

- Kustomize overlays or Helm values
- Immutable image reference
- Namespace
- ConfigMap
- Deployment
- Service
- Resource requests
- Health-compatible workload

### 3. AppProject

Create a project that restricts:

- Allowed repositories
- Allowed destinations
- Resource types
- Project roles
- Production sync rules

### 4. Applications or ApplicationSet

Manage:

- Development
- Staging
- Production

Use ApplicationSet when justified. Explain deletion behavior.

### 5. Promotion Workflow

Document:

1. Build
2. Test
3. Scan
4. Sign
5. Publish
6. GitOps pull request
7. Review
8. Merge
9. Reconciliation
10. Health verification
11. Promotion

### 6. Secret Strategy

Define:

- Secret source
- Controller
- Authentication
- Rotation
- Backup
- Recovery
- Developer workflow
- Audit

### 7. CI Integration

Provide a Jenkins stage or pseudocode that:

- Receives immutable artifact metadata
- Updates the development desired state
- Validates output
- Opens a pull request
- Does not deploy directly

### 8. Observability

Define:

- Controller metrics
- Application metrics
- Alerts
- Dashboards
- Notification routes
- SLOs

### 9. Failure Scenarios

Explain response to:

- Repository unavailable
- Invalid Helm template
- Argo CD controller outage
- Production drift
- Bad image
- Failed database migration
- Secret manager outage
- Accidental Application deletion
- Compromised automation token

### 10. Recovery

Document:

- Argo CD reinstall
- Configuration restoration
- Credential restoration
- Cluster re-registration
- Workload ownership verification
- Safe resumption of reconciliation

## Acceptance Criteria

The project must demonstrate:

- Declarative desired state
- Version history
- Automatic pull
- Continuous reconciliation
- Least privilege
- No plaintext secrets
- Immutable artifact promotion
- Reproducible rendering
- Controlled production changes
- Observability
- Tested recovery
- Clear ownership

## Presentation

Present the design in 10–15 minutes.

Include:

- Architecture diagram
- Repository tree
- Promotion sequence
- Security boundaries
- One failure scenario
- One important trade-off

## Review Questions

- What is the largest possible blast radius?
- Who can change production?
- How quickly is drift detected?
- What happens if Git is unavailable?
- Can the system continue running if Argo CD is unavailable?
- How are data migrations coordinated?
- How are manual emergency changes reconciled?
- How is controller compromise contained?
