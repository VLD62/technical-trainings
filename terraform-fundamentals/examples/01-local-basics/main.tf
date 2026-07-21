locals {
  training_name = "${var.project}-${var.environment}"
}

resource "terraform_data" "training" {
  input = {
    name        = local.training_name
    project     = var.project
    environment = var.environment
    managed_by  = "terraform"
  }
}
