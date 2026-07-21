run "development_defaults" {
  command = plan

  assert {
    condition     = output.prefix == "catalog-development"
    error_message = "Default prefix is incorrect."
  }

  assert {
    condition     = output.service_name == "catalog-development-api"
    error_message = "Default service name is incorrect."
  }

  assert {
    condition     = output.is_high_availability == false
    error_message = "One replica should not be considered highly available."
  }
}

run "production_high_availability" {
  command = plan

  variables {
    project     = "payments"
    environment = "production"
    replicas    = 3
  }

  assert {
    condition     = output.prefix == "payments-production"
    error_message = "Production prefix is incorrect."
  }

  assert {
    condition     = output.is_high_availability
    error_message = "Three replicas should be considered highly available."
  }
}

run "production_requires_two_replicas" {
  command = plan

  variables {
    environment = "production"
    replicas    = 1
  }

  expect_failures = [terraform_data.service]
}
