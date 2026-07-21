# Safe Resource Address Refactoring

The current resource address is `terraform_data.service`. The `moved` block records that it was previously named `terraform_data.application`.

To demonstrate the migration safely:

1. Copy this directory to a disposable temporary directory.
2. In the copy, remove the `moved` block and rename the resource to `application`.
3. Run `terraform init` and `terraform apply`.
4. Rename the resource to `service` and run `terraform plan`; observe create/destroy actions.
5. Add the `moved` block and run `terraform plan` again.
6. Destroy the temporary example.

Never use an important state for training experiments.
