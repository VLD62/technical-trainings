locals {
  prefix               = "${var.project}-${var.environment}"
  is_high_availability = var.replicas >= 2
}

resource "terraform_data" "service" {
  input = {
    name     = "${local.prefix}-api"
    replicas = var.replicas
  }

  lifecycle {
    precondition {
      condition     = var.environment != "production" || var.replicas >= 2
      error_message = "Production requires at least two replicas."
    }
  }
}
