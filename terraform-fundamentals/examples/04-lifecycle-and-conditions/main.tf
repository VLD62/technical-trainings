resource "terraform_data" "foundation" {
  input = {
    environment = var.environment
    owner       = "platform"
  }
}

resource "terraform_data" "release" {
  input = {
    version     = var.release_version
    environment = var.environment
  }

  triggers_replace = [var.release_version]

  lifecycle {
    precondition {
      condition     = var.environment != "production" || var.replicas >= 2
      error_message = "Production requires at least two replicas."
    }

    postcondition {
      condition     = self.output.version != ""
      error_message = "Release version must not be empty."
    }
  }
}

resource "terraform_data" "application" {
  input = {
    foundation_id = terraform_data.foundation.id
    release_id    = terraform_data.release.id
    replicas      = var.replicas
  }

  depends_on = [terraform_data.foundation]
}
