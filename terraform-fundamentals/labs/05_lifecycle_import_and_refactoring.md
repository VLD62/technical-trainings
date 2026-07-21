# Lab 5 — Lifecycle, Import Concepts, and Refactoring

## Part A — Conditions and Replacement

```bash
cd examples/04-lifecycle-and-conditions
terraform init
terraform plan
terraform apply
```

Tasks:

1. Identify the implicit and explicit dependencies.
2. Change `release_version` and review which object is replaced.
3. Trigger the production precondition with an invalid replica count.
4. Explain when `create_before_destroy` would or would not be safe for a real provider resource.
5. Destroy the lab resources.

## Part B — Resource Address Refactoring

```bash
cd ../05-refactoring
```

1. Temporarily comment out the `moved` block.
2. Run `terraform init` and `terraform apply` using the documented initial resource name from the README in the example.
3. Rename the resource address as instructed.
4. Run a plan without the moved block and observe the proposed destroy/create behavior.
5. Restore the moved block.
6. Run the plan again and explain the state-address migration.

## Part C — Import Reasoning Exercise

No cloud object is required.

Write the steps you would follow to import an existing resource safely:

- Identify ownership
- Write configuration
- Back up state
- Determine provider import ID
- Run import or define an import block
- Plan and reconcile
- Confirm no unintended changes
- Document the new ownership boundary

## Reflection

- Why does import not equal configuration generation?
- Why should moved blocks remain for a migration period?
- When can `ignore_changes` create long-term risk?
