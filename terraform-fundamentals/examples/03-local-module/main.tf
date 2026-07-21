module "naming" {
  source = "./modules/naming"

  project     = var.project
  environment = var.environment
  services    = var.services
}

resource "terraform_data" "service" {
  for_each = module.naming.service_names

  input = {
    logical_name = each.key
    full_name    = each.value
  }
}
