# Flux, Observability, and Final Design

## Session 8

---

## Why Compare Tools

GitOps principles are vendor-neutral.

Understanding two implementations helps separate:

- Principle
- Architecture
- Product feature
- Team preference

---

## Argo CD Style

- Application-centric
- Built-in UI
- AppProjects
- ApplicationSet
- Central visual operations

---

## Flux Style

- Composable controllers
- Kubernetes-native APIs
- Source resources
- Kustomization and HelmRelease
- Optional image automation

---

## Concept Mapping

| Argo CD | Flux |
|---|---|
| Application source | GitRepository |
| Kustomize Application | Kustomization |
| Helm Application | HelmRelease |
| ApplicationSet | Composition and automation patterns |
| Built-in UI | Controller-first ecosystem |

---

## Observe Controllers

Monitor:

- Availability
- Reconciliation errors
- Queue depth
- Duration
- Repository failures
- API failures
- Application sync
- Application health

---

## Delivery Metrics

- Merge-to-detect time
- Detect-to-sync time
- Sync-to-healthy time
- Change failure rate
- Drift duration
- Manual intervention rate
- Promotion lead time

---

## Alert Quality

Alert on:

- Sustained production degradation
- Repeated reconciliation failure
- Unknown status
- Repository access failure
- Controller outage

Avoid paging on every brief OutOfSync transition.

---

## Troubleshooting Layers

1. Source
2. Authentication
3. Rendering
4. Diff
5. Authorization
6. Sync
7. Rollout
8. Health
9. Competing ownership

---

## Recovery

Desired configuration should be reproducible:

- Applications
- Projects
- ApplicationSets
- RBAC
- Notifications
- Repository configuration templates

Credentials require protected recovery.

---

## Operating Model

Define:

- Owners
- Repository controls
- Environment boundaries
- Promotion
- Emergency process
- SLOs
- Upgrade process
- Incident response
- Audit and compliance

---

## Final Architecture Exercise

Design for:

- 30 applications
- 3 environments
- 4 clusters
- 6 teams
- Central security requirements
- Production change windows
- External secret manager
- Jenkins CI

---

## Final Project Deliverables

- Repository structure
- Kustomize or Helm configuration
- AppProject
- Applications or ApplicationSet
- Promotion workflow
- Secret strategy
- CI handoff
- Observability plan
- Recovery plan

---

## Success Criteria

The solution must be:

- Declarative
- Versioned
- Pulled
- Reconciled
- Least privilege
- Reproducible
- Observable
- Recoverable

---

## Final Reflection

GitOps is successful when teams trust the operating model, not merely when a dashboard says "Synced".
