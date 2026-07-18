# OpenStack Architecture Notes

## 1. High-Level Architecture

```text
Users and automation
        |
CLI, SDK, Horizon, Terraform, Heat
        |
Public or internal API endpoints
        |
+---------------- OpenStack control plane ----------------+
| Keystone | Nova API | Neutron API | Glance | Cinder API |
| Placement | Heat | Octavia | Horizon | optional services |
|                    |                                  |
|         SQL databases and message bus                 |
+--------------------|----------------------------------+
                     |
        agents, conductors, schedulers, drivers
                     |
+-------------------- data plane -------------------------+
| Compute hosts | Virtual networking | Storage backends  |
| Instances     | Routers and ports  | Volumes and data  |
+---------------------------------------------------------+
```

## 2. Authentication and API Flow

```text
Client
  |  credentials or federation
  v
Keystone
  |  token and service catalog
  v
Selected service API
  |  policy, quota, database, message bus
  v
Scheduler, conductor, agent, or backend driver
```

A token proves an authenticated identity and scope. Each service still evaluates its own policy.

## 3. Server-Creation Flow

```text
openstack server create
          |
        Nova API
          |
     quota and policy
          |
 Placement candidate search
          |
      Nova Scheduler
          |
      Nova Conductor
          |
       Nova Compute
       /    |     \
  Glance  Neutron  Cinder
       \    |     /
      Hypervisor and storage
```

Potential failure domains include identity, scheduling, image access, port binding, volume attachment, hypervisor capacity, and guest boot.

## 4. Network Flow

```text
External client
      |
Provider network and gateway
      |
Floating IP translation
      |
Neutron router
      |
Tenant network
      |
Security group and port
      |
Instance interface
```

The path may be centralized, distributed, or implemented by OVN. Confirm the backend before selecting commands.

## 5. Kolla-Ansible Deployment Model

```text
Deployment host
  |
  +-- inventory
  +-- globals and passwords
  +-- config overrides
  +-- Ansible and Kolla-Ansible
  |
SSH and Ansible
  |
Target nodes
  +-- container runtime
  +-- generated service configuration
  +-- OpenStack service containers
  +-- host networking and storage clients
```

## 6. High-Availability Control Plane

```text
                  Virtual IP
                     |
             HAProxy / Keepalived
              /       |       \
       Controller  Controller  Controller
          |             |          |
      API services, database members, message-bus members
```

The diagram is only one layer. Storage, DNS, certificates, physical switching, and network gateways also require redundancy.

## 7. Resource Boundaries

- **Domain** - identity and administrative boundary
- **Project** - authorization, ownership, and quota boundary
- **Region** - service-deployment boundary
- **Availability zone** - user-visible placement grouping
- **Cell** - Nova compute scale and failure boundary
- **Host aggregate** - administrator-defined grouping used by scheduling
- **Security group** - stateful port-level network policy

## 8. Responsibility Boundaries

Cloud operators own:

- Control-plane availability
- Capacity and quotas
- Network and storage integrations
- Upgrades and backups
- Security and policy
- Platform observability

Workload owners usually own:

- Guest operating systems
- Application configuration
- Data protection inside the workload
- Security-group intent
- Application availability across zones or instances
