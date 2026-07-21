# Security and Secret Handling

## Threat Model

Terraform interacts with privileged infrastructure APIs and maintains a detailed state record. Protect:

- Source code
- Variables
- Environment credentials
- CLI configuration
- Provider plugins
- Modules
- Saved plans
- State
- Logs
- CI artifacts

## Credentials

Prefer, in order:

1. Workload identity or federated identity
2. Short-lived role credentials
3. Managed identity attached to the execution environment
4. Secret manager injection at runtime
5. Long-lived static credentials only when unavoidable and tightly controlled

Never hard-code credentials in Terraform configuration.

## Sensitive Variables

```hcl
variable "api_token" {
  type      = string
  sensitive = true
}
```

`sensitive = true` redacts normal CLI display. It does not encrypt the value and does not guarantee it is absent from state or plans.

## Ephemeral Values

Use current Terraform features for ephemeral values where supported and appropriate, but verify provider and resource behavior. Do not assume every secret can be excluded from state.

## State Protection

State may contain sensitive data returned by providers.

Required controls:

- Encryption in transit and at rest
- Fine-grained access control
- State locking or equivalent operation serialization
- Audit logs
- Versioning and backup
- Restricted break-glass recovery
- Tested restoration
- Secure deletion and retention rules

## Plan Files

Binary plans may contain sensitive values. Treat them as protected build artifacts:

- Restrict readers
- Use short retention
- Do not post them publicly
- Avoid copying them into chat or tickets
- Ensure the apply job uses the reviewed plan and commit

## Provider and Module Supply Chain

- Declare provider source addresses
- Constrain versions
- Commit and review `.terraform.lock.hcl` in root modules
- Pin remote module versions
- Verify trusted publishers and repositories
- Review release notes before upgrades
- Use controlled registries or mirrors where required
- Scan downloaded code and configuration

## Least Privilege

Separate permissions when possible:

- Read-only planning identity
- Controlled apply identity
- State backend access
- Secret retrieval access
- Break-glass state recovery

Terraform should manage only the resources in its intended scope.

## CI Log Hygiene

- Disable shell tracing around secrets
- Avoid printing environment variables
- Mark CI secrets as masked
- Restrict debug logs
- Delete temporary credentials and plan files
- Review third-party actions and plugins

## Code Review Questions

- Does this change expose or persist a secret?
- Are new providers or modules trusted and pinned?
- Does the plan broaden network or identity access?
- Are destructive changes protected by backup or migration steps?
- Is the state boundary appropriate?
- Can the apply identity do more than required?
