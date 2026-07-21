# Troubleshooting Terraform

## Diagnostic Sequence

1. Read the entire error, including the resource address and source location
2. Confirm the current directory
3. Confirm Terraform version
4. Confirm backend and workspace
5. Run formatting and validation
6. Reinitialize providers and modules
7. Check variables and credentials
8. Inspect plan and state
9. Verify the remote API independently
10. Enable debug logs only when necessary

## Initialization Problems

### Provider download fails

Check:

- Network, DNS, proxy, and TLS inspection
- Provider source address
- Version constraints
- Registry or mirror availability
- Lock-file platform checksums

Commands:

```bash
terraform init
terraform init -upgrade
terraform providers
```

### Backend changed

Terraform may require:

```bash
terraform init -reconfigure
```

or, when intentionally moving state:

```bash
terraform init -migrate-state
```

Back up state first.

## Validation Problems

`terraform validate` checks syntax and internal consistency, not remote API permissions.

Common causes:

- Wrong argument name
- Wrong type
- Missing required variable
- Invalid reference
- Provider version mismatch
- Module interface change

## Unknown Values

Some values are unknown until apply because the provider computes them after creation.

Do not force unknown values into contexts that require stable plan-time keys, such as certain `for_each` expressions.

## Unexpected Replacement

Inspect the plan details and provider schema. Common causes:

- Force-new attribute changed
- Resource address changed
- `triggers_replace` changed
- Provider behavior changed
- State does not match the intended object

Consider a `moved` block for address-only refactoring.

## Resource Already Exists

Possible causes:

- The object was created manually
- State was lost or split
- Naming is not unique
- Another state manages the object

Do not immediately delete the object. Determine ownership and consider import.

## State Lock Error

Do not disable locking casually.

- Verify whether another operation is active
- Identify the lock owner and operation
- Wait for valid operations to finish
- Use `force-unlock` only after proving the lock is stale

## Authentication Errors

Check:

- Active identity
- Token expiration
- Environment variables
- Selected account, subscription, project, or region
- Role assumption or federation
- Clock skew
- CI secret scope

Avoid printing credentials during diagnostics.

## Drift and Perpetual Diffs

Common causes:

- Provider normalizes values
- Remote service adds defaults
- Another controller changes attributes
- Ordering differs
- Time-dependent values are used
- Generated values change on every plan

Compare configuration, state, provider schema, and remote API output. Use `ignore_changes` only when ownership is deliberately shared.

## Debug Logs

```bash
TF_LOG=DEBUG terraform plan
TF_LOG_PATH=terraform-debug.log TF_LOG=TRACE terraform plan
```

Debug logs can contain credentials or sensitive resource attributes. Restrict and delete them securely.
