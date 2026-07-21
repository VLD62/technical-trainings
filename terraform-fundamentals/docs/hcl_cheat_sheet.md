# HCL Cheat Sheet

## Terraform Requirements

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

## Provider

```hcl
provider "docker" {
  host = "unix:///var/run/docker.sock"
}
```

## Resource

```hcl
resource "terraform_data" "service" {
  input = {
    name = "catalog"
    port = 8080
  }
}
```

## Data Source

```hcl
data "provider_type" "example" {
  name = "existing-object"
}
```

## Variable

```hcl
variable "services" {
  description = "Service configuration keyed by name"
  type = map(object({
    port    = number
    enabled = optional(bool, true)
  }))

  validation {
    condition     = alltrue([for service in values(var.services) : service.port > 0 && service.port <= 65535])
    error_message = "Ports must be between 1 and 65535."
  }
}
```

## Locals

```hcl
locals {
  enabled_services = {
    for name, service in var.services : name => service
    if service.enabled
  }
}
```

## Output

```hcl
output "service_ids" {
  description = "Managed service IDs"
  value       = { for name, service in terraform_data.service : name => service.id }
}
```

## Module

```hcl
module "naming" {
  source = "./modules/naming"

  project     = var.project
  environment = var.environment
  services    = keys(var.services)
}
```

## Iteration

```hcl
resource "terraform_data" "service" {
  for_each = local.enabled_services

  input = {
    name = each.key
    port = each.value.port
  }
}
```

## Conditional

```hcl
retention_days = var.environment == "production" ? 30 : 7
```

## Splat and `for` Expressions

```hcl
terraform_data.service[*].id
[for service in terraform_data.service : service.id]
{ for name, service in terraform_data.service : name => service.id }
```

## Dynamic Blocks

Use dynamic blocks only when the provider schema requires repeated nested blocks and a normal expression cannot be assigned directly.

```hcl
dynamic "setting" {
  for_each = var.settings
  content {
    name  = setting.key
    value = setting.value
  }
}
```

## Lifecycle and Conditions

```hcl
lifecycle {
  create_before_destroy = true

  precondition {
    condition     = var.environment != "production" || var.replicas >= 2
    error_message = "Production requires at least two replicas."
  }
}
```

## Moved Block

```hcl
moved {
  from = terraform_data.application
  to   = terraform_data.service
}
```

## Import Block

```hcl
import {
  to = provider_resource.example
  id = "remote-object-id"
}
```

## Common Functions

```hcl
merge(map1, map2)
lookup(map, key, default)
try(expression, fallback)
can(expression)
coalesce(value1, value2)
flatten(nested_list)
toset(list)
jsonencode(value)
templatefile(path, vars)
```
