output "url" {
  description = "Local URL for the NGINX container."
  value       = "http://localhost:${var.external_port}"
}
