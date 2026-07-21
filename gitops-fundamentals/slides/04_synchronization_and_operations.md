# Synchronization and Operations

## Session 4

---

## Reconciliation Loop

Argo CD repeatedly:

- Resolves revision
- Generates manifests
- Reads live state
- Calculates diff
- Reports sync and health
- Applies policy

---

## Automated Sync

```yaml
syncPolicy:
  automated:
    enabled: true
    prune: true
    selfHeal: true
    allowEmpty: false
```

Each option changes risk.

---

## Pruning

Pruning deletes live resources removed from desired state.

Questions before enabling:

- Is ownership clear?
- Are generated manifests validated?
- Can an empty render occur?
- Are backups available?
- Is production protected?

---

## Self-Healing

Self-healing corrects eligible live drift.

Demonstration:

```bash
kubectl scale deployment demo-app \
  -n gitops-demo-dev --replicas=7
```

Observe reconciliation.

---

## Allow Empty

`allowEmpty` permits automated sync when the source generates no resources.

Useful in deliberate cases.

Dangerous when:

- Path is wrong
- Generation fails unexpectedly
- Repository restructure is incomplete

---

## Sync Options

Examples:

- `CreateNamespace=true`
- `PruneLast=true`
- `ServerSideApply=true`
- `ApplyOutOfSyncOnly=true`
- `FailOnSharedResource=true`

Use only when their behavior is understood.

---

## Sync Phases

- PreSync
- Sync
- PostSync
- SyncFail
- PostDelete

Hooks can run migrations, checks, or notifications.

---

## Sync Waves

```yaml
metadata:
  annotations:
    argocd.argoproj.io/sync-wave: "10"
```

Lower waves run first.

Use for ordering, not as a replacement for robust application readiness.

---

## Sync Windows

Allow or deny sync during selected periods.

Use for:

- Production windows
- Freeze periods
- Maintenance

Define override governance.

---

## Rollback

Git revert is the clearest desired-state rollback.

Argo CD history helps visibility, but Git should remain authoritative.

Remember:

```text
Configuration rollback ≠ Data rollback
```

---

## Drift Sources

- Manual `kubectl`
- Admission mutation
- HPA
- Operators
- Defaulted fields
- Non-deterministic templates
- Shared ownership
- External secret rotation

---

## Diff Customization

Ignore only fields that are:

- Expected to change
- Owned elsewhere
- Safe to ignore
- Narrowly selected
- Documented

Do not hide unexplained drift globally.

---

## Operational States

```text
OutOfSync → inspect diff
Degraded  → inspect workload
Unknown   → inspect controller/source access
Progressing too long → inspect rollout
Repeated sync failure → inspect conditions and events
```

---

## Break Glass

1. Declare incident
2. Limit reconciliation only where needed
3. Make minimum change
4. Update Git
5. Restore reconciliation
6. Review

---

## Lab Focus

- Enable automated sync
- Create drift
- Observe self-healing
- Remove a resource
- Observe pruning
- Create a broken image
- Distinguish sync from health
