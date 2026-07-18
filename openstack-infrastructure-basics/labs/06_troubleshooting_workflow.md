# Lab 06 - Troubleshooting Workflow

## Goal

Practice evidence-first diagnosis using a controlled failure in a training project.

## Scenario A - Security Group Blocks SSH

1. Create an instance with a floating IP.
2. Remove or omit the SSH rule.
3. Confirm that the instance is `ACTIVE`.
4. Collect:

```bash
openstack --os-cloud training server show <server>
openstack --os-cloud training port list --server <server>
openstack --os-cloud training floating ip list
openstack --os-cloud training security group rule list <security-group>
```

5. Explain why compute health does not prove application reachability.
6. Add a restricted SSH rule and retest.

## Scenario B - Exhausted Project Quota

With instructor approval, reduce or consume a small quota and attempt another resource creation.

Collect:

```bash
openstack --os-cloud training quota show
openstack --os-cloud training limits show --absolute
```

Compare quota failure with physical-capacity failure.

## Scenario C - Invalid Image or Flavor Choice

Attempt a build with an image or flavor that violates cloud policy or scheduling requirements.

Capture:

- CLI error
- Server fault
- Request ID
- Flavor extra specifications
- Image properties

## Health Report

```bash
make health CLOUD=training
```

Review which sections are available to a project user and which require administrative policy.

## Incident Summary Template

```text
Impact:
Start time:
Cloud and region:
Project:
Resource IDs:
Request ID:
Observed state:
Expected state:
Evidence:
Likely layer:
Corrective action:
Validation:
```

## Cleanup

Remove all resources created for the scenarios.
