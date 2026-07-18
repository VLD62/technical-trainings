# Kolla-Ansible Notes

## 1. Version Discipline

Kolla-Ansible, Ansible, Python, container images, host operating systems, and OpenStack releases have compatibility requirements.

Before installation or upgrade:

- Select a supported OpenStack release
- Read its Kolla-Ansible documentation
- Use release-matched constraints
- Confirm supported host operating systems
- Confirm supported Ansible versions
- Test with the same network and storage backends

## 2. Example Layout

```text
/etc/kolla/
├── globals.yml
├── passwords.yml
├── globals.d/
└── config/
    ├── nova/
    ├── neutron/
    ├── glance/
    └── cinder/

~/openstack-deployment/
├── multinode
└── documentation/
```

Do not store real `passwords.yml` or credential-bearing inventory data in a public repository.

## 3. Inventory Principles

- Use resolvable hostnames or explicit Ansible addresses
- Separate role intent from host-specific variables
- Keep management access stable
- Document network-interface purpose
- Use groups for target selection
- Review which services run on each group

## 4. Generic Preparation

Typical preparation includes:

- Supported Linux installation
- Stable hostname and DNS
- Time synchronization
- SSH access
- Passwordless privilege escalation for the deployment account
- Network interfaces and MTU
- Container runtime prerequisites
- Empty or prepared storage devices where required

## 5. Deployment Sequence

Version-matched example:

```bash
kolla-ansible install-deps
kolla-genpwd
kolla-ansible bootstrap-servers -i multinode
kolla-ansible prechecks -i multinode
kolla-ansible deploy -i multinode
kolla-ansible post-deploy
```

The generated `clouds.yaml` must be protected like a credential file.

## 6. Validation After Deployment

- Token issue
- Service catalog and endpoints
- API health
- Compute-service registration
- Hypervisor capacity
- Network-agent or OVN chassis health
- Image upload and download
- Network, router, and floating-IP path
- Volume create and attach
- Dashboard access
- High-availability behavior

## 7. Reconfiguration

Use reconfiguration for managed configuration changes rather than editing running containers.

Workflow:

1. Change source configuration
2. Review diff
3. Run prechecks where applicable
4. Apply the narrowest supported operation
5. Validate service and workload behavior
6. Record the change

## 8. Upgrade Preparation

- Verify supported source and target releases
- Back up databases, `/etc/kolla`, inventory, certificates, and external dependencies
- Confirm image availability
- Test in staging
- Review deprecated configuration
- Plan service and workload impact
- Define rollback and recovery steps

## 9. Scaling Compute

- Add host to inventory
- Prepare interfaces and virtualization
- Bootstrap target host
- Run targeted prechecks
- Deploy target services
- Verify Nova service and Placement inventory
- Test scheduling, networking, storage, migration, and evacuation

## 10. Destructive Operations

Commands such as `destroy`, database recovery, RabbitMQ reset, forced detach, and service-state reset can cause data loss or widespread interruption.

They are intentionally not automated by this training package.
