# Lab Guide

The labs are designed for an authorized non-production OpenStack cloud.

## Lab Order

1. `01_cli_and_authentication.md`
2. `02_projects_roles_and_quotas.md`
3. `03_images_flavors_and_instances.md`
4. `04_network_router_and_floating_ip.md`
5. `05_volumes_and_snapshots.md`
6. `06_troubleshooting_workflow.md`
7. `07_kolla_multinode_design.md`
8. `08_ha_validation_scenarios.md`
9. `09_optional_kolla_all_in_one.md`

## General Requirements

- `python-openstackclient`
- Access to a training cloud
- A personal `clouds.yaml`
- Quota for the selected exercises
- A verified cloud image
- Authorization to create and delete resources

## Naming Convention

Use a unique prefix:

```bash
export LAB_PREFIX="oslab-${USER}"
```

## Cleanup Principle

Every lab includes cleanup. Before deleting a network, remove dependent ports, floating IPs, router interfaces, and routers. Before deleting a volume, detach it from servers.

## Safety

- Do not use production projects.
- Do not paste credentials into lab reports.
- Do not upload untrusted images.
- Keep resource sizes small.
- Record resource IDs.
- Stop when cloud policy or available services differ from the lab assumptions.
