# OpenStack Fundamentals and Architecture

## Session 1

---

## Infrastructure as a Service

OpenStack provides self-service infrastructure primitives:

- Virtual machines
- Virtual networks and routers
- Images
- Volumes and snapshots
- Public addresses
- Security policy
- Load balancers
- Orchestration templates

Users request resources through APIs instead of opening manual infrastructure tickets.

---

## Control Plane and Data Plane

**Control plane**

- API endpoints
- Authentication and authorization
- Schedulers
- Databases
- Message queue
- Controllers and agents

**Data plane**

- Running instances
- Virtual switching and routing
- Storage I/O
- North-south and east-west traffic

---

## Common Node Roles

```text
Deployment host
    |
    +-- Controller nodes
    |      APIs, schedulers, databases, message queue, dashboard
    |
    +-- Network nodes or distributed network services
    |      Routing, DHCP, metadata, gateways
    |
    +-- Compute nodes
    |      Hypervisor and virtual networking agents
    |
    +-- Storage systems
           Block, object, and shared-file backends
```

Role distribution varies by deployment method and scale.

---

## Major Services

- Keystone - Identity
- Nova - Compute lifecycle
- Placement - Resource inventory and allocation
- Neutron - Networking
- Glance - Images
- Cinder - Block storage
- Swift - Object storage
- Manila - Shared filesystems
- Horizon - Web dashboard
- Heat - Orchestration
- Octavia - Load balancing
- Magnum - Container infrastructure management

---

## Request Flow Example

Create a server:

1. Client authenticates with Keystone
2. Client calls Nova API with a token
3. Nova checks policy and quota
4. Nova requests candidate resources from Placement
5. Scheduler selects a compute host
6. Nova coordinates image, network, and volume preparation
7. Compute service starts the instance
8. Status is returned through the API

---

## Regions

A region is a separate service deployment exposed through one identity system or catalog.

Regions can represent:

- Different datacenters
- Different geographic sites
- Separate failure domains
- Separate operational ownership

Resources usually do not move transparently between regions.

---

## Availability Zones

Availability zones are user-visible placement groupings.

Examples:

- Compute zones
- Block-storage zones
- Network zones in selected designs

A zone is an operational label, not automatically a guarantee of physical independence.

---

## Nova Cells

Cells divide compute infrastructure into smaller failure and database domains.

Benefits:

- Scale
- Failure isolation
- Smaller operational blast radius

API-level services remain above the cells while compute hosts are grouped below them.

---

## Projects and Quotas

A project is a resource and authorization boundary.

Quotas limit consumption such as:

- Instances
- vCPUs
- RAM
- Volumes and gigabytes
- Networks, ports, routers, and floating IPs

Quotas protect shared capacity but do not replace monitoring and capacity planning.

---

## Shared Dependencies

Many services depend on:

- SQL databases
- RabbitMQ or another supported message bus
- Memcached
- Time synchronization
- DNS and certificate infrastructure
- Load balancing and virtual IPs
- Container runtime when using Kolla-Ansible

---

## Architecture Questions

Before deployment, decide:

- Failure domains
- Network segmentation
- Storage backends
- Hypervisor and CPU policy
- Authentication integration
- High-availability targets
- Backup and recovery objectives
- Upgrade strategy
- Observability and support boundaries
