# State and Backends

## State Responsibilities

Terraform state is the operational mapping between configuration addresses and managed remote objects. It is not merely a cache.

State can contain:

- Resource IDs and attributes
- Dependencies
- Output values
- Provider metadata
- Sensitive values returned by providers

Treat state as confidential and availability-critical.

## Local State

Local state is useful for:

- Disposable learning examples
- Experiments that do not involve shared infrastructure
- Testing isolated modules

It is usually unsuitable for team production use because it lacks centralized access control, reliable coordination, and shared recovery.

## Backend Selection Questions

Evaluate:

- Does the backend support locking or equivalent operation coordination?
- Is data encrypted in transit and at rest?
- Can access be scoped by state boundary?
- Is state versioned and recoverable?
- Are operations audited?
- How are credentials provided?
- What are the consistency characteristics?
- How is disaster recovery tested?

## Example Backend Block

Backend configuration is environment-specific. Keep real bucket names, account IDs, endpoints, and credentials out of reusable public examples.

```hcl
terraform {
  backend "BACKEND_TYPE" {
    # Environment-specific settings
  }
}
```

Some backend values can be supplied during `terraform init` through a backend configuration file or command arguments. Do not commit secret backend credentials.

## Migrating State

When changing backend configuration:

1. Stop concurrent Terraform operations
2. Back up current state
3. Confirm the target backend exists and is protected
4. Change the backend configuration
5. Run `terraform init -migrate-state`
6. Review the prompts carefully
7. Verify the new state location and lineage
8. Test plan behavior
9. Retain a protected backup until migration is confirmed

Use `-reconfigure` when Terraform should disregard previous backend settings without automatically migrating state.

## Locking

Do not disable locking as a routine workaround. If a lock appears stale:

1. Confirm no apply or state operation is active
2. Identify the operation and owner
3. Preserve logs and state backups
4. Use `terraform force-unlock LOCK_ID` only when safe
5. Investigate why the lock was abandoned

## State Boundaries

A state boundary is also a blast-radius and access-control boundary.

Good reasons to split state:

- Different teams own different components
- Environments require different credentials
- Components have independent lifecycles
- Apply frequency differs significantly
- A single plan becomes too broad or slow
- Recovery requirements differ

Avoid splitting state only to mirror every individual resource. Excessive fragmentation creates cross-state dependency complexity.

## Cross-State Data

Remote-state data can create tight coupling and expose more outputs than intended.

Prefer stable, explicit interfaces where possible:

- DNS records
- Service discovery
- Configuration stores
- Provider data sources
- Published artifacts or metadata
- Narrow outputs with clear ownership

## Backups and Recovery

Practice recovery before an incident:

- Restore a previous state version in a non-production environment
- Verify state lineage and serial behavior
- Confirm how locks are cleared
- Document the authority and approval process
- Test what happens after partial apply failure

Never manually edit state as the first response. Use Terraform's state commands or backend recovery features whenever possible.
