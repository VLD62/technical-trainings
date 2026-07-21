project     = "store"
environment = "test"

services = {
  api = {
    port  = 8000
    owner = "backend"
  }
  web = {
    port  = 8080
    owner = "frontend"
  }
  jobs = {
    port    = 9000
    enabled = true
    owner   = "platform"
  }
}
