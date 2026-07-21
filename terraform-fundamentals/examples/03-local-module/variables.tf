variable "project" {
  type        = string
  description = "Project identifier."
  default     = "payments"
}

variable "environment" {
  type        = string
  description = "Environment identifier."
  default     = "development"
}

variable "services" {
  type        = set(string)
  description = "Service names."
  default     = ["api", "worker", "scheduler"]
}
