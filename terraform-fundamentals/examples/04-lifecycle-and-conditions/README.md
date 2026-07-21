# Lifecycle and Conditions

Change `release_version` to observe replacement caused by `triggers_replace`.

Test the precondition:

```bash
terraform plan -var='environment=production' -var='replicas=1'
```
