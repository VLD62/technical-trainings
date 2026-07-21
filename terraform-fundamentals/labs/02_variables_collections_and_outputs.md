# Lab 2 — Variables, Collections, and Outputs

## Goal

Use typed variables, validation, locals, `for_each`, and output expressions.

## Directory

```bash
cd examples/02-variables-and-collections
```

## Tasks

1. Inspect the `services` variable type.
2. Identify which services are enabled by default.
3. Predict the resource instance addresses.
4. Run:

   ```bash
   terraform init
   terraform validate
   terraform plan
   ```

5. Apply and list state:

   ```bash
   terraform apply
   terraform state list
   terraform output
   ```

6. Create `custom.example.tfvars` from the documented example or use CLI variables.
7. Add a service with a stable key.
8. Disable one existing service.
9. Compare the plan with what positional `count` might have produced.
10. Try an invalid port and observe the validation error.
11. Use `terraform console` to evaluate:

    ```hcl
    keys(var.services)
    [for name, service in var.services : name if service.enabled]
    merge({ a = 1 }, { b = 2 })
    ```

12. Destroy the lab resources.

## Reflection

- Why are stable `for_each` keys valuable?
- What belongs in variables versus locals?
- Which outputs form a useful interface?
