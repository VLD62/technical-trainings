locals {
  name_prefix = "${var.project}-${var.environment}"

  enabled_services = {
    for name, service in var.services : name => service
    if service.enabled
  }
}

resource "terraform_data" "service" {
  for_each = local.enabled_services

  input = {
    name        = "${local.name_prefix}-${each.key}"
    port        = each.value.port
    owner       = each.value.owner
    environment = var.environment
    managed_by  = "terraform"
  }
}
