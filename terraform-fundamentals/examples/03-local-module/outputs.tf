output "service_names" {
  description = "Generated service names from the child module."
  value       = module.naming.service_names
}

output "service_ids" {
  description = "Terraform-generated service IDs."
  value       = { for name, service in terraform_data.service : name => service.id }
}
