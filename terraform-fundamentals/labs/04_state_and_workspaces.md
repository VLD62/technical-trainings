# Lab 4 — State and Workspaces

## Goal

Inspect local state and understand how CLI workspaces separate state instances.

## Directory

```bash
cd examples/01-local-basics
```

## Tasks

1. Initialize and apply the default configuration.
2. Inspect:

   ```bash
   terraform workspace show
   terraform state list
   terraform state show terraform_data.training
   terraform output -json
   ```

3. Create a second workspace:

   ```bash
   terraform workspace new test
   ```

4. Apply with `environment=test`.
5. Compare state and outputs between `default` and `test`:

   ```bash
   terraform workspace select default
   terraform output

   terraform workspace select test
   terraform output
   ```

6. Locate the local workspace state directories without editing them.
7. Destroy resources in both workspaces.
8. Delete the `test` workspace after selecting `default`.

## Discussion

- What did the workspace change?
- What did it not isolate?
- Would workspaces be sufficient for production and development accounts with different access controls?
- Which backend features would a team require?
