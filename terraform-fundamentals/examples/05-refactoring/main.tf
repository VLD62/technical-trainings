resource "terraform_data" "service" {
  input = {
    name  = "catalog-api"
    owner = "platform"
  }
}

moved {
  from = terraform_data.application
  to   = terraform_data.service
}
