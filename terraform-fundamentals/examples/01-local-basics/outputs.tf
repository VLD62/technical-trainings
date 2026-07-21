output "training_id" {
  description = "Terraform-generated identifier for the training resource."
  value       = terraform_data.training.id
}

output "training_metadata" {
  description = "Metadata stored by the terraform_data resource."
  value       = terraform_data.training.output
}
