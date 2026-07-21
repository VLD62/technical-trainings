# Testing and Validation

## Layered Quality Model

Use several layers because each catches a different class of issue.

| Layer | Finds |
|---|---|
| `terraform fmt -check` | Non-canonical formatting |
| `terraform validate` | Syntax and internal consistency problems |
| Variable validation | Invalid caller inputs |
| Preconditions/postconditions | Domain and runtime assumptions |
| `terraform test` | Module behavior and assertions |
| Linting | Suspicious or non-idiomatic patterns |
| Security scanning | Common insecure configuration |
| Plan review | Real proposed changes for an environment |
| Policy checks | Organization rules |
| Disposable apply | Provider/API integration issues |

## Formatting

```bash
terraform fmt -check -recursive
```

Use canonical formatting locally and in CI.

## Validation

```bash
terraform init -backend=false
terraform validate
```

`validate` requires providers and modules to be initialized. It does not validate remote service availability or credentials.

## Native Tests

Tests are stored in `.tftest.hcl` files.

```hcl
run "valid_production_configuration" {
  command = plan

  variables {
    environment = "production"
    replicas    = 3
  }

  assert {
    condition     = output.is_high_availability
    error_message = "Production should be highly available."
  }
}
```

Run:

```bash
terraform test
terraform test -verbose
```

## Plan Tests vs Apply Tests

Use `command = plan` when assertions can be evaluated from planned values. This is faster and safer.

Use apply-based tests only when provider behavior or computed values require real creation. Run them in isolated accounts or projects with automated cleanup.

## Expected Failures

Native tests can assert that invalid configurations fail at known checks. This is useful for variable validation and preconditions.

## Static Analysis

Common optional tools:

- TFLint
- Trivy configuration scanning
- Checkov
- Conftest with Open Policy Agent
- Custom scripts against `terraform show -json`

Keep tool versions pinned in CI and review rule updates.

## Testing Modules in CI

A practical module pipeline:

```text
fmt-check
  -> init -backend=false
  -> validate
  -> terraform test
  -> lint
  -> security scan
  -> example plans
```

For provider modules, add controlled integration tests in a disposable environment.

## Test Data Safety

- Never use production credentials
- Use dedicated test subscriptions or accounts
- Apply quotas and budget alerts
- Use unique names
- Tag resources for cleanup
- Enforce maximum test duration
- Run cleanup even after failures
- Detect leaked resources periodically
