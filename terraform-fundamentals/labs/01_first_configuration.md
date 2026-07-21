# Lab 1 — First Terraform Configuration

## Goal

Practice the complete Terraform workflow with a provider-free configuration.

## Directory

```bash
cd examples/01-local-basics
```

## Tasks

1. Inspect `versions.tf`, `variables.tf`, `main.tf`, and `outputs.tf`.
2. Identify the resource address.
3. Predict the output values.
4. Initialize the directory:

   ```bash
   terraform init
   ```

5. Format and validate:

   ```bash
   terraform fmt -check
   terraform validate
   ```

6. Create a plan:

   ```bash
   terraform plan
   ```

7. Explain every proposed action.
8. Apply the configuration:

   ```bash
   terraform apply
   ```

9. Inspect results:

   ```bash
   terraform output
   terraform state list
   terraform state show terraform_data.training
   ```

10. Change `environment` with a CLI variable:

    ```bash
    terraform plan -var='environment=test'
    ```

11. Explain why the object updates or replaces based on the configuration.
12. Destroy the lab state:

    ```bash
    terraform destroy
    ```

## Reflection

- Which command downloaded dependencies?
- Which command checked internal consistency?
- Where was the resource ID stored?
- Why is a plan safer than applying immediately?
