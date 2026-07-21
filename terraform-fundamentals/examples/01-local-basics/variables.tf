variable "project" {
  description = "Project name used in the training metadata."
  type        = string
  default     = "terraform-fundamentals"

  validation {
    condition     = length(trimspace(var.project)) >= 3
    error_message = "Project must contain at least three non-space characters."
  }
}

variable "environment" {
  description = "Logical environment name."
  type        = string
  default     = "development"

  validation {
    condition     = contains(["development", "test", "production"], var.environment)
    error_message = "Environment must be development, test, or production."
  }
}
