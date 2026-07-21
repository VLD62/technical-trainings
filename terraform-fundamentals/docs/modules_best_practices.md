# Module Best Practices

## Start with a Clear Contract

A module should solve one coherent problem and expose a stable interface.

Document:

- Purpose
- Supported use cases
- Required Terraform and provider versions
- Inputs and validation
- Outputs
- Security assumptions
- Examples
- Upgrade notes
- Ownership

## Type Inputs Precisely

Prefer:

```hcl
variable "service" {
  type = object({
    name     = string
    port     = number
    replicas = optional(number, 1)
  })
}
```

Over loosely typed maps that defer errors until runtime.

## Validate Domain Rules

```hcl
validation {
  condition     = var.service.port > 0 && var.service.port <= 65535
  error_message = "The service port must be between 1 and 65535."
}
```

Validation should explain how to fix the input.

## Keep Provider Configuration in Root Modules

Child modules should declare provider requirements, but root modules should normally own provider configuration and authentication.

Avoid passing secrets or provider credentials as ordinary module variables.

## Prefer Composition

Build root configurations by composing focused modules.

Example:

```text
root environment
├── network module
├── identity module
├── database module
├── application module
└── observability module
```

Composition keeps ownership and dependencies understandable.

## Avoid Excessive Flags

Many flags such as `create_x`, `enable_y`, `manage_z`, and `use_legacy_mode` can make a module difficult to test and reason about.

When behavior differs fundamentally, separate modules or higher-level compositions may be clearer.

## Outputs Are an API

Expose only values consumers need. Avoid returning entire provider resource objects because this creates accidental coupling to implementation details.

Good:

```hcl
output "service_endpoint" {
  value = local.endpoint
}
```

Risky:

```hcl
output "everything" {
  value = provider_resource.service
}
```

## Versioning and Upgrades

- Use semantic versioning where appropriate
- Document breaking changes
- Add `moved` blocks for address refactoring
- Test upgrade paths from supported prior versions
- Pin remote module versions in consumers
- Avoid mutable branch references for production

## Module Tests

Test:

- Default behavior
- Important variants
- Invalid input rejection
- Output contracts
- Resource counts and addresses
- Security-sensitive settings
- Upgrade and refactoring behavior

## Directory Pattern

```text
module/
├── README.md
├── versions.tf
├── variables.tf
├── main.tf
├── outputs.tf
├── tests/
│   └── module.tftest.hcl
└── examples/
    └── basic/
```

## Review Checklist

- Does the module have one clear responsibility?
- Are inputs typed and validated?
- Are names and descriptions understandable?
- Are provider versions constrained?
- Are credentials external?
- Are outputs intentionally minimal?
- Is the module testable without production access?
- Is destructive behavior documented?
