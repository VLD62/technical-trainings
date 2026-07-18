# OpenStack Service Catalog

## Core and Common Services

| Service | Project name | Responsibility | Common dependencies |
|---|---|---|---|
| Identity | Keystone | Authentication, tokens, service catalog, domains, projects, roles | Database, memcached, federation or directory integration |
| Compute | Nova | Instance lifecycle and compute orchestration | Keystone, Placement, Glance, Neutron, database, message bus, hypervisor |
| Placement | Placement | Resource-provider inventory, traits, allocations, and candidates | Keystone, database |
| Networking | Neutron | Networks, subnets, ports, routers, security groups, IP addressing | Keystone, database, message bus, OVS or OVN, physical networking |
| Image | Glance | Image metadata and image-data access | Keystone, database, file, object, or RBD backend |
| Block Storage | Cinder | Volumes, snapshots, backups, attachments, and backends | Keystone, database, message bus, storage drivers |
| Dashboard | Horizon | Web interface for OpenStack APIs | Keystone and enabled service APIs |
| Orchestration | Heat | Template-driven resource orchestration | Keystone and target service APIs |
| Object Storage | Swift | Distributed object storage | Keystone integration, proxy and storage nodes |
| Shared Filesystems | Manila | Shared filesystem provisioning and access rules | Keystone, database, message bus, network and storage drivers |
| Load Balancing | Octavia | Load balancers, listeners, pools, members, and health monitors | Neutron, Nova or provider driver, Keystone, database, message bus |
| Container Infrastructure | Magnum | Cluster lifecycle for container-orchestration engines | Heat or Cluster API integrations, Nova, Neutron, Glance, Cinder |
| Key Management | Barbican | Secrets, keys, and certificates | Keystone, database, HSM or secret-store backend |
| Telemetry | Ceilometer | Collection of metrics and events | Message bus, publishers, metric backends |

## Important Supporting Components

| Component | Responsibility |
|---|---|
| MariaDB or another supported SQL database | Persistent control-plane state |
| RabbitMQ | RPC and notification transport |
| Memcached | Token and application caching |
| HAProxy | API and service load balancing |
| Keepalived | Virtual IP failover in common deployments |
| libvirt and QEMU/KVM | Virtual-machine runtime on compute hosts |
| Open vSwitch | Virtual switching and datapath for several Neutron backends |
| OVN | Distributed logical networking control plane |
| Ceph | Distributed block, file, and object storage backend |

## Dependency Thinking

A user-visible Nova failure may be caused by:

- Keystone token validation
- Placement capacity
- Glance image access
- Neutron port binding
- Cinder volume attachment
- RabbitMQ RPC
- Database state
- Hypervisor or host failure

Always investigate the complete request path.
