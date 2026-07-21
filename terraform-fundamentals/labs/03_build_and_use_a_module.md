# Lab 3 — Build and Use a Local Module

## Goal

Understand root modules, child modules, inputs, outputs, and composition.

## Directory

```bash
cd examples/03-local-module
```

## Tasks

1. Inspect the root module and `modules/naming`.
2. Write down the child module's public contract.
3. Predict the generated service names.
4. Run:

   ```bash
   terraform init
   terraform validate
   terraform plan
   terraform apply
   ```

5. Inspect module outputs:

   ```bash
   terraform output
   terraform state list
   ```

6. Add a new service key to the root module input.
7. Add input validation for allowed environment names in the child module.
8. Add an output returning the uppercase project identifier.
9. Run format, validation, and plan again.
10. Explain which implementation details should remain hidden.
11. Destroy the lab resources.

## Extension

Create a second local module that produces metadata tags from project, environment, owner, and cost-center inputs. Compose both modules in the root configuration.
