# Lab Setup

## Core Lab Mode — No Cloud Account Required

The six core labs are architecture, security, service-mapping, and cost exercises. They can be completed using only the files in this repository.

Required tools:

```bash
git --version
python3 --version
bash --version
```

Run the local checks:

```bash
make check-environment
make validate
```

## Optional Provider CLI Mode

The training can detect these optional CLIs:

- AWS CLI: `aws`
- Azure CLI: `az`
- Google Cloud CLI: `gcloud`
- OCI CLI: `oci`

The included inventory and example scripts use read-only commands. Authentication may still expose account names or identifiers in your terminal, so do not paste output into public issues or documents without review.

## Account Safety Checklist

Before using a cloud account:

1. Confirm that the account is approved for training
2. Use a separate sandbox account, subscription, project, or compartment
3. Enable multi-factor authentication
4. Configure a restrictive budget and alerts
5. Confirm who receives billing notifications
6. Use least-privilege roles
7. Select a region intentionally
8. Avoid public IP addresses unless required
9. Add owner, environment, purpose, expiry, and cost-center metadata
10. Define the cleanup command before creation

## Free Tier Warning

Free-tier programs, promotional credits, quotas, and eligibility can change. A service labeled free may still generate charges through storage, networking, logs, public IPs, backups, or usage beyond limits.

Verify current terms in the official provider pricing documentation before creating any resource.

## Credential Rules

Never commit:

- AWS access keys
- Azure client secrets
- Google service-account key files
- OCI API private keys
- CLI credential directories
- Terraform state containing secrets
- Kubeconfig files from real environments
- Tokens, passwords, certificates, or private keys

Use provider-native workload identities and short-lived credentials where possible.

## Optional CLI Context

```bash
./scripts/cloud_cli_inventory.sh all
```

Run a provider-specific read-only example only after reviewing it:

```bash
./examples/cli/aws-read-only.sh
./examples/cli/azure-read-only.sh
./examples/cli/gcp-read-only.sh
./examples/cli/oci-read-only.sh
```

## Cleanup

The default course creates no cloud resources. If an instructor adds provider labs, every lab must include:

- Estimated cost drivers
- Required permissions
- Creation commands
- Validation commands
- Explicit cleanup commands
- A final resource inventory check
