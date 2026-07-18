# Knowledge Check 2 - Operations and Architecture

## Scenario 1 - Instance Stuck in BUILD

A server remains in `BUILD` and eventually enters `ERROR`.

Explain the order in which you would inspect:

- Server fault information
- Nova API, scheduler, conductor, and compute services
- Placement inventory and allocations
- Image availability
- Network port creation
- Compute capacity and hypervisor logs

State what evidence should be attached before escalation.

## Scenario 2 - Floating IP Is Unreachable

The instance responds on its fixed IP from another workload, but its floating IP is unreachable.

Describe how you would validate:

- Security-group rules
- Neutron port status and binding
- Router interfaces and external gateway
- Floating-IP association
- L3 or OVN control-plane state
- Provider bridge or physical-network mapping
- Upstream routing and return path

## Scenario 3 - Volume Attach Failure

A Cinder volume is `available`, but attachment fails.

Identify checks involving:

- Volume type and backend
- Cinder scheduler and volume services
- Nova-compute connector support
- Multipath or RBD client configuration
- Secret or keyring access
- Stale attachment records

## Scenario 4 - Controller Failure

One controller becomes unavailable in a three-controller deployment.

Explain the expected behavior of:

- Keepalived and the virtual IP
- HAProxy backends
- Galera quorum
- RabbitMQ quorum or mirrored queues
- API clients
- Workloads already running on compute nodes

List the conditions under which the failure would become an outage.

## Scenario 5 - Capacity Planning

A cloud has enough total vCPU and RAM but repeated scheduling failures.

Discuss:

- Per-host fragmentation
- Reserved resources
- Allocation ratios
- Placement traits and aggregates
- Server-group policies
- Availability-zone constraints
- Disk and network bottlenecks

## Scenario 6 - Upgrade Design

Create a safe high-level plan for an OpenStack upgrade deployed with Kolla-Ansible.

Include:

- Release compatibility and documentation review
- Backups and restore validation
- Staging rehearsal
- Container image preparation
- Database and message-bus health
- Prechecks
- Rolling or service-aware execution
- API and workload validation
- Rollback or recovery decision points

## Review Rubric

A strong answer:

- Starts with user-visible symptoms and follows dependencies systematically
- Uses read-only inspection before mutation
- Distinguishes control-plane state from data-plane behavior
- Captures timestamps, request IDs, resource IDs, service status, and relevant logs
- Avoids guessing and documents both positive and negative findings
- Considers security and data-protection impact before recovery actions
