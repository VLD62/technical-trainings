output "prefix" {
  value = local.prefix
}

output "is_high_availability" {
  value = local.is_high_availability
}

output "service_name" {
  value = terraform_data.service.output.name
}
