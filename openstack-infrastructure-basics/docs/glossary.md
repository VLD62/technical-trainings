# OpenStack Glossary

**API endpoint** - Network location where a service exposes its API.

**Application credential** - Keystone credential designed for an application or automation workflow without exposing a user's primary password.

**Availability zone** - User-visible grouping used to influence resource placement.

**Cell** - Nova scale and failure domain containing compute services and cell databases.

**Cinder** - OpenStack Block Storage service.

**Cloud-init** - Guest initialization framework commonly used by cloud images.

**Clouds.yaml** - OpenStackClient configuration file describing one or more clouds.

**Compute host** - Server running the hypervisor and Nova compute service.

**Control plane** - APIs, schedulers, databases, message bus, and services that manage desired state.

**Data plane** - Workload execution, traffic forwarding, and storage I/O.

**Domain** - Keystone identity namespace and administrative boundary.

**Endpoint interface** - Public, internal, or admin classification for a service endpoint.

**Ephemeral disk** - Instance disk whose lifecycle is normally tied to the instance.

**Flavor** - Compute shape defining vCPU, RAM, disk, and extra specifications.

**Floating IP** - Externally reachable address mapped to a fixed IP on a Neutron port.

**Glance** - OpenStack Image service.

**HAProxy** - Load balancer commonly used in OpenStack deployments.

**Heat** - OpenStack Orchestration service.

**Host aggregate** - Administrator-defined group of compute hosts used by scheduling and metadata.

**Horizon** - OpenStack web dashboard.

**Instance** - Virtual machine managed by Nova.

**Keystone** - OpenStack Identity service.

**Kolla** - OpenStack project that builds container images for OpenStack services.

**Kolla-Ansible** - Ansible-based deployment and lifecycle tooling for containerized OpenStack services.

**Manila** - OpenStack Shared Filesystems service.

**Neutron** - OpenStack Networking service.

**Nova** - OpenStack Compute service.

**Octavia** - OpenStack Load Balancing service.

**OpenRC** - Shell file exporting OpenStack authentication variables.

**OVN** - Open Virtual Network, a distributed logical networking control plane using Open vSwitch.

**Open vSwitch** - Programmable virtual switch used by several cloud networking architectures.

**Placement** - OpenStack service tracking resource providers, inventories, traits, allocations, and candidates.

**Port** - Neutron attachment point representing a virtual network interface.

**Project** - Keystone resource ownership, authorization, and quota boundary.

**Provider network** - Neutron network mapped to physical network connectivity.

**Quota** - Limit on resource consumption within a scope.

**Region** - Separate OpenStack service deployment exposed through a catalog.

**Request ID** - Identifier used to correlate an API request across service logs.

**Role** - Named set used by policy to grant permissions in a scope.

**Security group** - Stateful firewall policy attached to Neutron ports.

**Server group** - Nova grouping used for affinity or anti-affinity scheduling policies.

**Service catalog** - Keystone-provided list of service endpoints.

**Swift** - OpenStack Object Storage service.

**Tenant network** - Project-oriented virtual network, often implemented as an overlay.

**Token** - Time-limited credential issued by Keystone after authentication.

**Volume** - Persistent block device managed by Cinder.
