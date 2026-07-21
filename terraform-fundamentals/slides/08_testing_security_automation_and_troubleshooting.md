# Testing, Security, Automation, and Troubleshooting

## Learning Outcomes

- Build layered Terraform quality checks
- Protect credentials, plans, and state
- Design a safe automation workflow
- Troubleshoot systematically

---

## Validation Layers

From fastest to most realistic:

1. `terraform fmt -check`
2. `terraform validate`
3. Variable validation and conditions
4. `terraform test`
5. Linting and static security checks
6. Plan review
7. Policy checks
8. Apply in a disposable environment
9. Post-apply verification

No single check replaces the others.

---

## Native Terraform Tests

A `.tftest.hcl` file can define runs and assertions:

```hcl
run "development_name" {
  command = plan

  variables {
    project     = "catalog"
    environment = "development"
  }

  assert {
    condition     = output.prefix == "catalog-development"
    error_message = "Unexpected naming prefix."
  }
}
```

Tests can validate outputs, planned values, module contracts, and selected apply behavior.

---

## Credential Security

Prefer:

- Workload identity or federation
- Short-lived credentials
- Secret managers
- Environment injection at runtime
- Least-privilege roles
- Separate identities for plan and apply where appropriate

Avoid hard-coded credentials in `.tf`, `.tfvars`, shell history, CI logs, and state.

---

## State and Plan Security

State and binary plan files may contain sensitive values even when output is redacted in the terminal.

Protect them with:

- Encryption at rest and in transit
- Strict access controls
- Audit logging
- Versioning and backup
- Retention rules
- Secure artifact handling

---

## Dependency and Supply-Chain Controls

- Pin Terraform versions
- Constrain provider versions
- Commit `.terraform.lock.hcl` for root configurations
- Review lock-file changes
- Pin module versions
- Use trusted registries and repositories
- Scan code and dependencies
- Schedule controlled upgrades

---

## Pull-Request Workflow

A safe baseline:

1. Format check
2. Initialization without changing the production backend where appropriate
3. Validation
4. Native tests
5. Lint and security scans
6. Plan for the target environment
7. Human and policy review
8. Protected apply of the reviewed commit
9. Post-apply verification

Serialize applies per state boundary.

---

## Troubleshooting Workflow

1. Read the complete error
2. Confirm directory, backend, workspace, and Terraform version
3. Run `terraform fmt` and `terraform validate`
4. Check provider and module constraints
5. Re-run `terraform init`
6. Inspect variables and environment credentials
7. Inspect the plan and state addresses
8. Verify the remote API independently
9. Increase logs only when needed
10. Record the root cause and prevention

---

## Debug Logging

```bash
TF_LOG=DEBUG terraform plan
TF_LOG_PATH=terraform-debug.log TF_LOG=TRACE terraform plan
```

Logs may contain sensitive information. Store and delete them securely.

---

## Final Principle

Terraform safety comes from the whole operating model:

- Small changes
- Clear state boundaries
- Reproducible dependencies
- Automated checks
- Reviewed plans
- Protected applies
- Secure credentials
- Tested recovery
