variable "project" {
  type        = string
  description = "Project identifier."

  validation {
    condition     = can(regex("^[a-z][a-z0-9-]+$", var.project))
    error_message = "Project must start with a lowercase letter and contain lowercase letters, numbers, or hyphens."
  }
}

variable "environment" {
  type        = string
  description = "Environment identifier."

  validation {
    condition     = contains(["development", "test", "production"], var.environment)
    error_message = "Environment must be development, test, or production."
  }
}

variable "services" {
  type        = set(string)
  description = "Logical service names."
}
