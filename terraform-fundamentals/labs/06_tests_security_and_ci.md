# Lab 6 — Tests, Security, and CI

## Goal

Run native Terraform tests and design a safe quality pipeline.

## Directory

```bash
cd examples/06-tests
```

## Tasks

1. Inspect `main.tf` and `tests/naming.tftest.hcl`.
2. Run:

   ```bash
   terraform init -backend=false
   terraform validate
   terraform test
   ```

3. Change one expected output so a test fails.
4. Read the assertion failure and restore the correct expectation.
5. Add a test for the `test` environment.
6. Add an invalid environment case and assert the expected validation failure.
7. From the course root, run:

   ```bash
   make fmt-check
   make validate
   make test
   make content-check
   ```

## Security Review

For each item, state whether it may contain secrets:

- `.tf` files
- `.tfvars` files
- Environment variables
- `.terraform.lock.hcl`
- `terraform.tfstate`
- Saved binary plans
- Debug logs
- CI job logs

## CI Design

Create a pipeline outline containing:

1. Pinned Terraform installation
2. Formatting check
3. Initialization
4. Validation
5. Native tests
6. Lint and security scans
7. Plan
8. Human/policy approval
9. Serialized apply
10. Post-apply verification

Explain which stages can run on every pull request and which require protected credentials.
