# The Core Terraform Workflow

## Learning Outcomes

- Use the main Terraform CLI commands
- Explain what each workflow stage verifies
- Separate planning from applying

---

## Workflow Overview

```text
write -> fmt -> init -> validate -> plan -> review -> apply -> inspect
```

Cleanup:

```text
destroy -> verify -> remove local generated files
```

---

## `terraform fmt`

Formats configuration into Terraform's canonical style.

```bash
terraform fmt -recursive
terraform fmt -check -recursive
```

Use `-check` in CI to fail without modifying files.

---

## `terraform init`

Initializes a working directory:

- Installs providers
- Downloads modules
- Initializes the backend
- Creates or updates the dependency lock file

```bash
terraform init
terraform init -upgrade
terraform init -reconfigure
terraform init -backend=false
```

Run `init` after changing providers, modules, or backend configuration.

---

## `terraform validate`

Checks whether configuration is syntactically valid and internally consistent.

```bash
terraform validate
```

Validation does not prove that remote credentials are valid or that an apply will succeed.

---

## `terraform plan`

Calculates proposed changes:

```bash
terraform plan
terraform plan -out=change.tfplan
terraform show change.tfplan
```

Plan symbols:

- `+` create
- `~` update in place
- `-/+` replace
- `-` destroy
- `<=` read data

---

## Plan Review Questions

- Is the correct workspace and backend selected?
- Are unexpected destroys or replacements present?
- Are sensitive values exposed?
- Are the expected number of objects changing?
- Did a provider or module upgrade alter behavior?
- Is the plan based on the intended commit and variables?

---

## `terraform apply`

Applies proposed changes:

```bash
terraform apply
terraform apply change.tfplan
```

Applying a saved plan ensures the reviewed plan is the one executed, provided the environment and plan remain valid.

---

## Inspecting Results

```bash
terraform output
terraform state list
terraform state show terraform_data.example
terraform show
```

Use state commands to inspect Terraform's view. Use provider-native tools to verify the real system.

---

## `terraform destroy`

Creates and applies a destroy plan:

```bash
terraform plan -destroy
terraform destroy
```

Destroy is not rollback. Data loss may be permanent.

---

## Avoid Routine Targeting

`-target` is intended for exceptional recovery or focused troubleshooting, not normal workflow design. Routine targeting may produce incomplete changes and hidden dependencies.
