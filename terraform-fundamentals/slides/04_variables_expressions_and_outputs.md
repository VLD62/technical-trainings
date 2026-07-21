# Variables, Expressions, Locals, and Outputs

## Learning Outcomes

- Define typed input variables
- Use local values and outputs
- Work with collections, conditionals, and iteration

---

## Input Variables

```hcl
variable "environment" {
  description = "Deployment environment name"
  type        = string
  default     = "development"

  validation {
    condition     = contains(["development", "test", "production"], var.environment)
    error_message = "Environment must be development, test, or production."
  }
}
```

Good variables have:

- Clear descriptions
- Specific types
- Safe defaults only when appropriate
- Validation for domain constraints
- `sensitive = true` when output redaction is needed

---

## Variable Precedence

Common input sources include:

- Defaults in variable blocks
- Environment variables named `TF_VAR_name`
- Automatically loaded variable files
- `-var-file`
- `-var`

Avoid relying on complicated precedence in team workflows. Make environment inputs explicit.

---

## Local Values

```hcl
locals {
  name_prefix = "${var.project}-${var.environment}"
  common_tags = merge(var.tags, {
    managed_by = "terraform"
  })
}
```

Use locals to name expressions and remove duplication. Do not hide important external inputs in locals.

---

## Outputs

```hcl
output "service_names" {
  description = "Generated service names"
  value       = [for item in terraform_data.service : item.output.name]
}
```

Outputs form part of a module's public interface.

---

## Types

Primitive types:

- `string`
- `number`
- `bool`

Collection and structural types:

- `list(T)`
- `set(T)`
- `map(T)`
- `tuple([...])`
- `object({...})`

Use precise object types for module contracts.

---

## `count` and `for_each`

```hcl
resource "terraform_data" "service" {
  for_each = var.services

  input = {
    name = each.key
    port = each.value.port
  }
}
```

Stable keys make refactoring safer than positional list indexes.

---

## Conditional Expressions

```hcl
local_retention_days = var.environment == "production" ? 30 : 7
```

Keep conditionals readable. Complex branching may indicate that separate modules or compositions are clearer.

---

## Useful Functions

- `merge`
- `lookup`
- `try`
- `can`
- `coalesce`
- `flatten`
- `toset`
- `tomap`
- `jsonencode`
- `templatefile`
- `fileset`

Use `terraform console` to experiment with expressions safely.
