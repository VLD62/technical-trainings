# Observability and Operations

## What to Observe

### Controller Health

- Pod availability
- Restarts
- CPU and memory
- Work queue depth
- Reconciliation duration
- API errors
- Repository fetch errors
- Manifest-generation errors
- Cache behavior
- Leader election where applicable

### Application State

- Sync status
- Health status
- Last successful reconciliation
- Desired revision
- Operation duration
- Failed sync count
- Resource-level conditions
- Orphaned resources
- Drift duration

### Delivery Outcomes

- Time from merge to reconciliation
- Time from reconciliation to healthy
- Change failure rate
- Mean time to restore
- Rollback frequency
- Promotion lead time
- Manual intervention rate
- Drift incidents

## Logs

Useful Argo CD logs:

```bash
kubectl logs -n argocd statefulset/argocd-application-controller
kubectl logs -n argocd deployment/argocd-repo-server
kubectl logs -n argocd deployment/argocd-server
kubectl logs -n argocd deployment/argocd-applicationset-controller
```

Use label selectors in real installations because pod names and topology may vary.

## Events and Conditions

```bash
kubectl describe application demo-app -n argocd
kubectl get events -n argocd --sort-by=.lastTimestamp
kubectl get application demo-app -n argocd -o yaml
```

Conditions often reveal:

- Invalid source
- Authentication failure
- Manifest-generation failure
- Comparison failure
- Sync failure
- Shared-resource conflict

## Metrics

Argo CD exposes Prometheus metrics from its components. Build dashboards around:

- Availability
- Reconciliation errors
- Application sync and health
- Repository request failures
- Controller queue behavior
- API latency
- Notification failures

Alert on sustained conditions, not every brief transition.

## Notifications

Useful triggers include:

- Sync failed
- Health degraded
- Unknown status persists
- Production application became OutOfSync
- Sync succeeded for production
- Repeated repository errors

Notifications should identify:

- Application
- Environment
- Revision
- Failure reason
- Link to operational context
- Owner
- Recommended first action

## Operational Runbook

1. Confirm whether the issue is source, controller, target, or workload related.
2. Check application conditions.
3. Resolve the desired revision.
4. Render manifests locally.
5. Check repository access.
6. Check controller logs.
7. Check target-cluster connectivity and RBAC.
8. Inspect workload events and health.
9. Compare with recent changes.
10. Fix Git, reconcile, and verify.
11. Record incident learning.

## Backup and Recovery

Argo CD's desired configuration should itself be declarative where practical:

- Applications
- AppProjects
- ApplicationSets
- RBAC configuration
- Repository templates
- Notification configuration
- Instance configuration

Credentials require a secure backup and restoration strategy.

Practice:

- Reinstalling the controller
- Restoring configuration
- Reconnecting repositories
- Re-registering clusters
- Verifying application ownership
- Recovering without deleting workloads unintentionally

## Service-Level Objectives

Example internal objectives:

- Controller API available 99.9% monthly
- Production desired-state changes detected within five minutes
- 95% of healthy configuration changes converge within ten minutes
- Critical reconciliation failures page the platform team within five minutes
- No unresolved production drift older than an agreed threshold

Choose objectives based on real business needs and measured behavior.
