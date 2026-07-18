# Deployment with Kolla-Ansible

## Session 6

---

## What Kolla-Ansible Does

Kolla builds and publishes container images for OpenStack services.

Kolla-Ansible uses Ansible to:

- Prepare hosts
- Generate configuration
- Pull images
- Deploy containers
- Configure service dependencies
- Perform lifecycle operations

---

## Deployment Host

The deployment host typically contains:

- Python virtual environment
- Kolla-Ansible
- Ansible dependencies
- Inventory
- `/etc/kolla/globals.yml`
- `/etc/kolla/passwords.yml`
- Configuration overrides
- Secure access to target hosts

Treat this host and its configuration as sensitive infrastructure.

---

## Inventory

Inventory groups map hosts to roles.

Examples:

- `control`
- `network`
- `compute`
- `monitoring`
- `storage`
- `deployment`

A host can belong to multiple groups.

---

## `globals.yml`

Common decisions include:

- Base distribution
- OpenStack release and image source
- Management interface
- External Neutron interface
- Internal virtual IP
- Network backend
- Enabled services
- TLS
- Storage backends
- Logging and monitoring

Use separate files or overrides to keep configuration manageable.

---

## Secrets

`passwords.yml` contains generated service secrets.

Rules:

- Generate securely
- Back up securely
- Restrict permissions
- Never commit
- Rotate through supported procedures
- Understand dependencies before replacing values

---

## Generic Deployment Flow

```bash
kolla-ansible install-deps
kolla-genpwd
kolla-ansible bootstrap-servers -i multinode
kolla-ansible prechecks -i multinode
kolla-ansible deploy -i multinode
kolla-ansible post-deploy
```

Use commands and options that match the installed Kolla-Ansible release.

---

## Prechecks Matter

Prechecks validate assumptions such as:

- Host reachability
- Network interfaces
- Virtual IP availability
- Supported package and Ansible versions
- Container runtime
- Required directories and permissions
- Service-specific requirements

Fix failed assumptions instead of bypassing checks blindly.

---

## All-in-One vs Multinode

**All-in-one**

- Fast learning and development
- Small failure domain
- Limited realism and capacity

**Multinode**

- Role separation
- HA and scale testing
- More networking and operational complexity

---

## Lifecycle Operations

Common operations include:

- `reconfigure`
- `deploy` with tags or limits
- `pull`
- `upgrade`
- `stop`
- `destroy`
- Database backup and restore procedures
- Adding or removing compute hosts

Read release-specific documentation before lifecycle changes.

---

## Configuration Overrides

Place service overrides under `/etc/kolla/config`.

Use cases:

- Policy
- TLS
- Service-specific tuning
- Backend integration
- Logging
- Scheduler configuration

Document why an override exists and who owns it.

---

## Scale-Out Pattern

Adding a compute node usually requires:

1. Prepare host and networking
2. Add inventory membership
3. Validate reachability and prerequisites
4. Run targeted bootstrap and prechecks
5. Deploy or reconfigure the relevant services
6. Verify compute registration and Placement inventory
7. Test workload scheduling

---

## Deployment Is Not Completion

A production cloud also needs:

- Monitoring
- Backups
- Capacity planning
- Upgrade testing
- Certificate lifecycle
- Security review
- Runbooks
- Failure testing
- Ownership and support model
