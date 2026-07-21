# Lab Setup

## Supported Environments

The course can be completed on:

- Ubuntu or another Linux distribution
- macOS
- Windows with WSL2

Terraform is distributed as a single CLI executable. Use the official HashiCorp package repository or official binary distribution for your platform.

## Minimum Version

The core examples require Terraform 1.5 or newer. The native test lab requires Terraform **1.6 or newer**.

Verify the installation:

```bash
terraform version
terraform -help
```

## Ubuntu and Debian

Follow the current official HashiCorp Linux installation instructions. A typical package-manager installation uses the signed HashiCorp APT repository and then:

```bash
sudo apt update
sudo apt install terraform
```

Do not copy repository keys or installation commands from untrusted sources. Verify the current official instructions before installation.

## Manual Binary Installation

1. Download the correct archive for your operating system and CPU architecture from the official Terraform downloads page.
2. Verify the checksum and signature according to the official release instructions.
3. Extract the `terraform` executable.
4. Move it to a directory in `PATH`, such as `/usr/local/bin`.
5. Run `terraform version`.

## Editor Support

Recommended editor features:

- HCL syntax highlighting
- Terraform language server support
- Formatting on save
- File and symbol navigation
- Validation diagnostics

For Visual Studio Code, use the official HashiCorp Terraform extension.

## Optional Tools

Useful but not required:

- `tflint` for Terraform linting
- `trivy` or another IaC security scanner
- `checkov` for policy and security checks
- `pre-commit` for local quality hooks
- `jq` for JSON output inspection
- Graphviz for rendering `terraform graph`
- Docker Engine or Podman for the optional Docker example

## Clone and Verify

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/terraform-fundamentals
make check-environment
make content-check
```

## First Example

```bash
cd examples/01-local-basics
terraform init
terraform fmt -check
terraform validate
terraform plan
terraform apply
terraform output
terraform state list
terraform destroy
```

## Provider Cache for Classrooms

External providers require network access during initialization unless they are already cached or mirrored.

For classroom delivery:

- Prefer the provider-free examples first
- Pre-test network and proxy access
- Consider a controlled provider mirror or plugin cache
- Do not distribute private CLI credentials
- Confirm provider checksums and lock files

## Clean Up

From the course root:

```bash
make clean
```

This removes local `.terraform` directories, state files, and saved plans under `examples/`. Review the script target before running it outside the training module.
