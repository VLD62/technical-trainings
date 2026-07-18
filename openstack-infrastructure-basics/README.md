# OpenStack Infrastructure: Basics

Welcome to the **OpenStack Infrastructure: Basics** course.

This training provides reusable slides, reference documentation, practical labs, generic configuration examples, and operational scripts for learning how OpenStack private clouds are designed, deployed, used, and maintained.

The course focuses on the concepts and workflows that are common across OpenStack environments. The deployment examples use Kolla-Ansible because it provides a clear containerized model for control-plane services, but the architectural lessons also apply to other OpenStack deployment methods.

---

## Course Objectives

By the end of this course participants will:

- Explain the purpose and architecture of an OpenStack private cloud
- Identify the responsibilities of Keystone, Nova, Placement, Neutron, Glance, Cinder, Swift, Manila, Horizon, Heat, Octavia, and Magnum
- Understand regions, availability zones, projects, users, roles, quotas, and the service catalog
- Configure the OpenStack CLI with `clouds.yaml` without exposing credentials
- Manage images, flavors, key pairs, instances, server groups, and basic scheduling choices
- Build tenant and provider networks with subnets, routers, floating IPs, and security groups
- Compare ephemeral, block, object, and shared-file storage models
- Understand common Ceph integration patterns for Glance, Nova, Cinder, Manila, and object storage
- Describe a Kolla-Ansible all-in-one and multinode deployment workflow
- Perform read-only platform health checks and follow a structured troubleshooting process
- Explain high-availability patterns involving virtual IPs, HAProxy, Keepalived, Galera, RabbitMQ, and redundant network services
- Recognize security, capacity, lifecycle, upgrade, backup, and disaster-recovery responsibilities

---

## Course Structure

### Session 0 - Course Introduction

- Course scope, prerequisites, and lab safety
- Public-cloud and private-cloud context
- Recommended learning flow
- How the materials are organized

### Session 1 - OpenStack Fundamentals and Architecture

- Infrastructure as a Service
- Control plane and data plane
- APIs, service catalog, message bus, database, and schedulers
- Regions, availability zones, cells, projects, and quotas
- Typical controller, network, compute, storage, and deployment roles

### Session 2 - Identity, Projects, and the OpenStack CLI

- Keystone authentication and authorization
- Domains, projects, users, groups, roles, and application credentials
- Service catalog and endpoints
- `clouds.yaml`, OpenRC, and CLI discovery
- Secret-handling and least-privilege practices

### Session 3 - Compute, Placement, and Images

- Nova architecture and request flow
- Placement resource providers and inventories
- Glance images and image formats
- Flavors, key pairs, metadata, cloud-init, and server groups
- Instance lifecycle, scheduling, evacuation, and migration concepts

### Session 4 - Networking with Neutron

- Tenant and provider networks
- Flat, VLAN, VXLAN, and routed designs
- Subnets, ports, DHCP, routers, SNAT, DNAT, and floating IPs
- Security groups and allowed-address pairs
- Open vSwitch and OVN concepts
- Troubleshooting the path from instance to external network

### Session 5 - Storage Services and Ceph Integration

- Ephemeral disks and block volumes
- Cinder volume types and backends
- Swift-compatible object storage
- Manila shared filesystems
- Ceph RBD, CephFS, RGW, pools, replication, and failure domains
- Capacity, performance, recovery, and backup considerations

### Session 6 - Deployment with Kolla-Ansible

- Containerized OpenStack services
- Inventory groups and node roles
- `globals.yml`, `passwords.yml`, and configuration overrides
- Host preparation, bootstrap, prechecks, deployment, and post-deployment
- Reconfigure, upgrade, backup, restore, and scale-out concepts
- All-in-one versus multinode trade-offs

### Session 7 - Operations, Troubleshooting, and Observability

- API and service health checks
- Compute, network, storage, and database status
- Logs, containers, systemd, message queues, and database signals
- Read-only evidence collection
- Incident triage and escalation packages
- Capacity, quotas, telemetry, and alerting

### Session 8 - High Availability, Security, and Production Readiness

- Internal and external virtual IPs
- HAProxy and Keepalived
- MariaDB Galera and RabbitMQ clustering
- L3 high availability and distributed routing
- Failure testing and recovery validation
- Patching, upgrades, backups, secrets, TLS, policy, and audit

### Session 9 - Labs and Knowledge Check

- Configure CLI access to a training cloud
- Inspect identity and quotas
- Create an image-based instance
- Build networking and attach a floating IP
- Create and attach a block volume
- Collect a health report
- Review a generic Kolla-Ansible multinode design
- Work through high-availability failure scenarios

---

## Repository Structure

```text
openstack-infrastructure-basics/
├── README.md
├── MANIFEST.md
├── LICENSE.md
├── Makefile
├── slides/
│   ├── 00_course_introduction.md
│   ├── 01_fundamentals_and_architecture.md
│   ├── 02_identity_projects_and_cli.md
│   ├── 03_compute_placement_and_images.md
│   ├── 04_networking_with_neutron.md
│   ├── 05_storage_and_ceph.md
│   ├── 06_deployment_with_kolla_ansible.md
│   ├── 07_operations_and_troubleshooting.md
│   └── 08_high_availability_and_security.md
├── docs/
│   ├── architecture_notes.md
│   ├── service_catalog.md
│   ├── networking_notes.md
│   ├── storage_notes.md
│   ├── kolla_ansible_notes.md
│   ├── operations_runbook.md
│   ├── security_and_publication_notes.md
│   ├── glossary.md
│   ├── instructor_guide.md
│   └── useful_links.md
├── labs/
│   ├── README.md
│   ├── 01_cli_and_authentication.md
│   ├── 02_projects_roles_and_quotas.md
│   ├── 03_images_flavors_and_instances.md
│   ├── 04_network_router_and_floating_ip.md
│   ├── 05_volumes_and_snapshots.md
│   ├── 06_troubleshooting_workflow.md
│   ├── 07_kolla_multinode_design.md
│   ├── 08_ha_validation_scenarios.md
│   └── 09_optional_kolla_all_in_one.md
├── examples/
│   ├── clouds.yaml.example
│   ├── openrc.example
│   ├── kolla/
│   │   ├── globals.yml.example
│   │   └── multinode.example
│   └── heat/
│       └── simple_web_server.yaml
├── scripts/
│   ├── check_prerequisites.sh
│   ├── openstack_health_report.sh
│   └── validate_content.py
└── quizzes/
    ├── 01_fundamentals.md
    └── 02_operations_and_architecture.md
```

---

## Prerequisites

Recommended knowledge:

- Linux command-line fundamentals
- TCP/IP, routing, VLAN, DNS, and basic firewall concepts
- Virtual machines, hypervisors, and storage basics
- YAML and SSH
- Git and a text editor

For the CLI labs:

- Access to an authorized non-production OpenStack project
- Python 3.10 or later
- `python-openstackclient`
- A personal `clouds.yaml` stored outside source control

For the optional Kolla-Ansible lab:

- Clean disposable Linux virtual machines
- Hardware virtualization or nested virtualization when testing Nova compute
- At least two network interfaces for realistic external-network exercises
- Sufficient CPU, memory, and disk for the selected OpenStack services
- A version-matched Kolla-Ansible installation and upstream documentation

No corporate or production infrastructure is required by the course package.

---

## Getting Started

Clone the repository and enter the course directory:

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/openstack-infrastructure-basics
```

List the available materials:

```bash
make list
```

Validate the public training package:

```bash
make validate
```

Inspect local prerequisites:

```bash
make check
```

Copy the example cloud configuration outside the repository:

```bash
mkdir -p ~/.config/openstack
cp examples/clouds.yaml.example ~/.config/openstack/clouds.yaml
chmod 600 ~/.config/openstack/clouds.yaml
```

Edit the copied file with credentials for an authorized training cloud, then test access:

```bash
openstack --os-cloud training token issue
openstack --os-cloud training catalog list
```

Generate a read-only health report:

```bash
make health CLOUD=training
```

---

## Recommended Learning Approach

For each session:

1. Review the corresponding slide deck
2. Read the related reference notes
3. Run the associated lab in a non-production project
4. Capture command output and explain the resource relationships
5. Modify one safe setting and observe the result
6. Complete the relevant knowledge-check questions

The course can be delivered as:

- Three 60-minute conceptual sessions
- A full-day workshop with CLI labs
- A two-day workshop including architecture, Kolla-Ansible, troubleshooting, and HA exercises

---

## Safety and Security Notes

- Use only environments where you are explicitly authorized to create or modify resources.
- Keep `clouds.yaml`, OpenRC files, application credentials, private keys, and generated Kolla passwords out of source control.
- Use a dedicated training project with quotas and a documented cleanup window.
- Review commands before running them. Several labs create billable or capacity-consuming resources.
- Do not run deployment or failure-testing exercises against production systems.
- Prefer documentation address ranges such as `192.0.2.0/24`, `198.51.100.0/24`, and `203.0.113.0/24` in examples.
- Validate image provenance and checksums before uploading images.
- Apply least privilege, short-lived credentials, TLS, and explicit security-group rules.
- Collect read-only evidence before restarting, reconfiguring, or deleting services.

---

## Notes

This course uses generic examples only. It does not include internal hostnames, company-specific processes, proprietary architecture, internal URLs, credentials, screenshots, inventory identifiers, or production addressing from the source material.

The source document was used only to identify useful training themes such as architecture, networking, Kolla-Ansible deployment, Ceph integration, operations, and high availability. All public course text, diagrams, examples, labs, and scripts in this directory were recreated in a vendor-neutral form.

Kubernetes-on-OpenStack concepts such as Magnum and Cluster API are introduced briefly, but detailed Kubernetes operations belong in a dedicated Kubernetes course.

---

## License

The educational content in this course, including presentations, documentation, diagrams, exercises, and quizzes, is licensed under the **Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License**.

Source code, scripts, and executable examples are licensed separately under the **MIT License**.

Third-party products, project names, trademarks, and documentation remain subject to their respective owners and licenses.

## Author

**Vladislav Iliev**

[LinkedIn](https://www.linkedin.com/in/vld62/)
