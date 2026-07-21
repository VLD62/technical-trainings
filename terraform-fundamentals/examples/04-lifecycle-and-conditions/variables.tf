variable "environment" {
  type        = string
  description = "Deployment environment."
  default     = "development"
}

variable "replicas" {
  type        = number
  description = "Requested replica count."
  default     = 1
}

variable "release_version" {
  type        = string
  description = "Application release version."
  default     = "1.0.0"
}
