# Optional Docker Provider Example

Requirements:

- Docker Engine available to the current user
- Network access to download the provider and container image
- Host port 8080 available, or override `external_port`

```bash
terraform init
terraform validate
terraform plan
terraform apply
terraform output -raw url
terraform destroy
```

This example creates a real local container. Review the plan and destroy it after the lab.
