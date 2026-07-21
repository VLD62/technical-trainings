variable "project" {
  type        = string
  description = "Project identifier."
  default     = "catalog"

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]+$", var.project))
    error_message = "Project must use lowercase letters, numbers, and hyphens."
  }
}

variable "environment" {
  type        = string
  description = "Environment identifier."
  default     = "development"

  validation {
    condition     = contains(["development", "test", "production"], var.environment)
    error_message = "Environment must be development, test, or production."
  }
}

variable "replicas" {
  type        = number
  description = "Requested replica count."
  default     = 1

  validation {
    condition     = var.replicas >= 1 && var.replicas <= 10
    error_message = "Replicas must be between 1 and 10."
  }
}
