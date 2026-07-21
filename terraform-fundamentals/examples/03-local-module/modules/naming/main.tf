locals {
  prefix = "${var.project}-${var.environment}"

  service_names = {
    for service in var.services :
    service => "${local.prefix}-${service}"
  }
}
