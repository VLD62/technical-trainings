# Multi-Environment Management and Promotion

## Goals

A promotion process should answer:

- What is deployed?
- Where is it deployed?
- Who approved it?
- Which tests passed?
- Is the artifact identical to the tested artifact?
- How can the change be reverted?
- What happens to stateful data?
- How is health verified?

## Course Layout

```text
examples/app/
├── base/
└── overlays/
    ├── dev/
    ├── staging/
    └── prod/
```

The base contains common resources. Each overlay defines:

- Namespace
- Replica count
- Environment labels
- Environment configuration
- Image version when different
- Resource changes where required

## Promotion by Pull Request

Example sequence:

1. `dev` receives image version `1.4.3`.
2. Automated tests and health checks pass.
3. A pull request updates `staging` to `1.4.3`.
4. Staging verification passes.
5. A separate pull request updates `prod`.
6. Production reconciliation occurs during an allowed window.
7. Health and business metrics are monitored.

## Why Not Merge Environment Branches Blindly

Environment configuration is rarely identical. Branch merges can introduce unrelated differences and long-lived divergence.

Folder-based promotion makes the exact environment change visible in one pull request.

## Rollback

A Git revert changes desired state back to a previous declaration.

This can restore:

- Image version
- Resource configuration
- Replica count
- Feature flags stored in configuration

It may not restore:

- Database schema
- External service state
- Data mutations
- Deleted persistent data
- Third-party side effects

Production rollback design must include data compatibility and application behavior.

## Progressive Delivery

GitOps can coordinate with progressive-delivery controllers.

Patterns include:

- Canary
- Blue/green
- Traffic shifting
- Metric-based analysis
- Manual promotion gates

The GitOps controller applies the rollout resource. A specialized rollout controller manages traffic and analysis.

Do not confuse configuration reconciliation with workload rollout strategy.

## Promotion Policy

A production promotion policy may require:

- Successful lower-environment deployment
- Immutable artifact reference
- Security scan results
- Change record
- Approved maintenance window
- Two-person review
- Automated policy checks
- Verified backup for risky stateful changes
- Defined rollback or fix-forward plan

## Environment Independence

Avoid hidden dependencies such as:

- Production reading development ConfigMaps
- Shared mutable Helm values
- Cross-environment namespace references
- Reusing credentials
- Shared writable storage
- A single branch mutation changing all environments unintentionally

Common components can be reused, but environment intent should remain explicit.
