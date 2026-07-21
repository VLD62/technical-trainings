variable "project" {
  description = "Project identifier."
  type        = string
  default     = "catalog"
}

variable "environment" {
  description = "Deployment environment."
  type        = string
  default     = "development"

  validation {
    condition     = contains(["development", "test", "production"], var.environment)
    error_message = "Environment must be development, test, or production."
  }
}

variable "services" {
  description = "Service configuration keyed by stable service name."
  type = map(object({
    port    = number
    enabled = optional(bool, true)
    owner   = optional(string, "platform")
  }))

  default = {
    api = {
      port  = 8080
      owner = "backend"
    }
    web = {
      port  = 8081
      owner = "frontend"
    }
    worker = {
      port    = 9090
      enabled = false
    }
  }

  validation {
    condition = alltrue([
      for service in values(var.services) :
      service.port >= 1 && service.port <= 65535
    ])
    error_message = "Every service port must be between 1 and 65535."
  }
}
