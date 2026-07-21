output "enabled_service_names" {
  description = "Names of enabled services."
  value       = sort(keys(terraform_data.service))
}

output "service_metadata" {
  description = "Metadata for every enabled service."
  value = {
    for name, service in terraform_data.service :
    name => service.output
  }
}
