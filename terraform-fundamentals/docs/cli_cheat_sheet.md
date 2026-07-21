# Terraform CLI Cheat Sheet

## Initialization and Dependencies

```bash
terraform init
terraform init -upgrade
terraform init -reconfigure
terraform init -migrate-state
terraform init -backend=false
terraform providers
terraform providers lock
```

## Formatting and Validation

```bash
terraform fmt
terraform fmt -recursive
terraform fmt -check -recursive
terraform validate
terraform test
```

## Planning

```bash
terraform plan
terraform plan -out=change.tfplan
terraform plan -destroy
terraform plan -refresh-only
terraform plan -replace=RESOURCE_ADDRESS
terraform show change.tfplan
terraform show -json change.tfplan > change.json
```

## Applying and Destroying

```bash
terraform apply
terraform apply change.tfplan
terraform destroy
```

Use `-auto-approve` only inside a controlled automation design.

## Variables

```bash
terraform plan -var='environment=test'
terraform plan -var-file=test.tfvars
TF_VAR_environment=test terraform plan
```

## Outputs and Inspection

```bash
terraform output
terraform output -raw output_name
terraform output -json
terraform show
terraform graph
terraform console
```

## State Inspection

```bash
terraform state list
terraform state show RESOURCE_ADDRESS
terraform state pull > state-backup.json
```

## State Modification

```bash
terraform state mv SOURCE DESTINATION
terraform state rm RESOURCE_ADDRESS
terraform import RESOURCE_ADDRESS REMOTE_ID
terraform force-unlock LOCK_ID
```

State-modifying commands require extra caution, backups, and exclusive access.

## Workspaces

```bash
terraform workspace list
terraform workspace show
terraform workspace new development
terraform workspace select development
terraform workspace delete development
```

## Command Context

Run Terraform in another directory:

```bash
terraform -chdir=examples/01-local-basics plan
```

Disable interactive input in automation:

```bash
terraform plan -input=false
```

## Debugging

```bash
TF_LOG=INFO terraform plan
TF_LOG=DEBUG terraform plan
TF_LOG_PATH=terraform-debug.log TF_LOG=TRACE terraform plan
```

Debug logs may expose secrets.

## Exit Codes for Automation

```bash
terraform plan -detailed-exitcode
```

Typical meanings:

- `0` — success, no changes
- `1` — error
- `2` — success, changes present
