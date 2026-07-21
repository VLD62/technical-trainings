output "prefix" {
  description = "Common naming prefix."
  value       = local.prefix
}

output "service_names" {
  description = "Full service names keyed by logical name."
  value       = local.service_names
}
