# HCL, Providers, Resources, and Data Sources

## Learning Outcomes

- Recognize Terraform block syntax
- Explain providers, resources, and data sources
- Understand references and implicit dependencies

---

## HCL Building Blocks

Terraform configuration contains blocks, arguments, expressions, and values.

```hcl
resource "terraform_data" "application" {
  input = {
    name        = var.application_name
    environment = local.environment
  }
}
```

- `resource` is the block type
- `terraform_data` is the resource type
- `application` is the local resource name
- `input` is an argument
- `var.application_name` is an expression

---

## Common File Organization

Terraform reads all `.tf` files in a directory as one module.

Common conventions:

```text
versions.tf
providers.tf
main.tf
variables.tf
locals.tf
outputs.tf
```

File names help humans; they do not define execution order.

---

## Terraform and Provider Requirements

```hcl
terraform {
  required_version = ">= 1.6, < 2.0"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}
```

Version constraints make upgrades deliberate and reproducible.

---

## Provider Configuration

```hcl
provider "docker" {
  host = "unix:///var/run/docker.sock"
}
```

Prefer environment variables, workload identity, or external credential helpers over hard-coded secrets.

---

## Managed Resources

A resource block declares an object Terraform should manage:

```hcl
resource "terraform_data" "database" {
  input = {
    engine = "postgresql"
    tier   = "development"
  }
}
```

Resource address:

```text
terraform_data.database
```

---

## Data Sources

A data source reads information but does not manage the object's lifecycle:

```hcl
data "some_provider_object" "current" {
  name = "shared-network"
}
```

Use data sources for externally managed information. Avoid excessive hidden coupling between states and teams.

---

## References and Dependencies

```hcl
resource "terraform_data" "application" {
  input = {
    database_id = terraform_data.database.id
  }
}
```

The reference creates an implicit dependency. Terraform can now order operations correctly.

Use `depends_on` only when a real dependency exists but cannot be expressed through a value reference.

---

## Resource Meta-Arguments

Common meta-arguments:

- `count`
- `for_each`
- `depends_on`
- `provider`
- `lifecycle`

Prefer `for_each` when instances have stable business keys.
