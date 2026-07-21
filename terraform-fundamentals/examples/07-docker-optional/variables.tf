variable "container_name" {
  type        = string
  description = "Name of the local Docker container."
  default     = "terraform-fundamentals-nginx"
}

variable "external_port" {
  type        = number
  description = "Host port mapped to container port 80."
  default     = 8080

  validation {
    condition     = var.external_port >= 1024 && var.external_port <= 65535
    error_message = "Use an unprivileged host port between 1024 and 65535."
  }
}
