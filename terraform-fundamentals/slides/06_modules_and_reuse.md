# Modules and Reusable Terraform Design

## Learning Outcomes

- Explain root and child modules
- Design clear module inputs and outputs
- Apply composition and versioning practices

---

## What Is a Module?

Every Terraform configuration directory is a module.

- **Root module** — the directory where Terraform is executed
- **Child module** — a module called by another module

```hcl
module "service_naming" {
  source = "./modules/naming"

  project     = var.project
  environment = var.environment
  services    = keys(var.services)
}
```

---

## Module Interface

A module's public contract includes:

- Input variables
- Output values
- Required Terraform version
- Required providers
- Expected behavior and constraints

Implementation details should remain internal where possible.

---

## Good Module Characteristics

- Solves one coherent problem
- Has clear ownership
- Uses typed, validated inputs
- Exposes useful outputs
- Avoids embedding credentials
- Documents assumptions and examples
- Supports common use cases without excessive toggles
- Can be tested independently

---

## Composition Over Mega-Modules

Prefer composing small modules in a root configuration over creating one module with dozens of unrelated switches.

Example layers:

- Network foundation
- Identity and access
- Data service
- Application platform
- Observability

Keep dependency direction clear.

---

## Module Sources

Modules can come from:

- Local directories
- Registries
- Git repositories
- Version-control archives
- Object storage or HTTP endpoints supported by Terraform

Use immutable versions or commit references for remote modules.

---

## Versioning

For registry modules:

```hcl
module "network" {
  source  = "example/network/provider"
  version = "~> 3.2"
}
```

For Git sources:

```hcl
source = "git::https://example.com/network.git?ref=v3.2.1"
```

Treat module upgrades like dependency upgrades: review changelogs, plan carefully, and test in lower environments.

---

## Module Anti-Patterns

- Passing provider credentials as variables
- Hiding environment selection inside modules
- Exposing every internal resource attribute
- Hard-coding organization-specific names without inputs
- Excessive boolean flags
- Using one state and module for unrelated systems
- Calling modules only to wrap a single resource without adding a meaningful contract

---

## Documentation Checklist

- Purpose
- Requirements
- Providers
- Inputs
- Outputs
- Examples
- Upgrade notes
- Security assumptions
- Operational ownership
