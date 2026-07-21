# Lifecycle, Import, and Safe Refactoring

## Learning Outcomes

- Control replacement and dependency behavior
- Import existing objects into state
- Refactor addresses without unnecessary recreation

---

## Lifecycle Rules

```hcl
resource "terraform_data" "service" {
  input = var.service

  lifecycle {
    create_before_destroy = true
    prevent_destroy       = false
    ignore_changes        = []
  }
}
```

Lifecycle rules change Terraform's normal behavior. Use them deliberately and document why they are required.

---

## `create_before_destroy`

Useful when a replacement can temporarily coexist with the old object.

Risks:

- Unique naming constraints
- Temporary double cost
- Quotas
- Dependency propagation

---

## `prevent_destroy`

Can protect critical resources from accidental destruction while the resource remains in configuration.

It is not a complete safety system. Removing the resource block or state binding changes the situation. Combine it with access controls, policy, backups, and reviews.

---

## `ignore_changes`

Useful when another system intentionally manages a specific attribute.

Risks:

- Hidden drift
- Confusing ownership
- Permanent suppression of important changes

Ignore the smallest possible attribute set and document the external owner.

---

## Preconditions and Postconditions

```hcl
lifecycle {
  precondition {
    condition     = var.environment != "production" || var.replicas >= 2
    error_message = "Production requires at least two replicas."
  }
}
```

Conditions turn assumptions into executable checks.

---

## Importing Existing Infrastructure

Import associates an existing remote object with a Terraform resource address.

Workflow:

1. Write the intended resource configuration
2. Identify the provider-specific object ID
3. Back up state
4. Run an import command or use an `import` block
5. Run a plan
6. Reconcile configuration until the plan is expected

Import does not automatically produce perfect configuration.

---

## Refactoring Resource Addresses

Changing a resource name changes its address.

Without guidance, Terraform may plan to destroy the old address and create a new one.

Use a `moved` block:

```hcl
moved {
  from = terraform_data.application
  to   = terraform_data.service
}
```

Keep moved blocks long enough for all relevant states to pass through the migration.

---

## Forced Replacement

Prefer the explicit planning option:

```bash
terraform plan -replace=terraform_data.service
```

Review the replacement plan before applying.

---

## Recovery Mindset

Before state or refactoring operations:

- Confirm the correct backend and workspace
- Stop concurrent applies
- Back up or version state
- Record current addresses and IDs
- Test in a disposable environment
- Define rollback or restore steps
