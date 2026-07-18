# Operations and Troubleshooting

## Session 7

---

## Operational Layers

Troubleshoot from the outside inward:

1. Client and authentication
2. API and endpoint
3. Scheduler or controller service
4. Message bus and database
5. Agent or compute service
6. Virtualization, networking, or storage backend
7. Physical infrastructure

---

## Start with Scope

Identify:

- One user or all users?
- One project or all projects?
- One region or all regions?
- One service or several services?
- New resources or existing resources?
- One host, one zone, or whole cloud?
- When did the behavior start?

---

## Request IDs

OpenStack services include request identifiers in logs and API responses.

Use them to correlate:

- Client output
- API logs
- Scheduler logs
- Conductor logs
- Compute or agent logs
- Backend service logs

Capture request IDs before retrying repeatedly.

---

## Read-Only Health Checks

```bash
openstack service list
openstack endpoint list
openstack compute service list
openstack hypervisor list
openstack network agent list
openstack volume service list
openstack resource provider list
```

Availability depends on roles and installed plugins.

---

## Containerized Service Checks

In a Kolla-Ansible environment:

- Container state
- Recent container logs
- Generated configuration
- Host networking
- System time
- Disk usage
- Database and message-bus connectivity

Avoid modifying files inside running containers as a permanent fix.

---

## Compute Failure Triage

- Server fault and task state
- Scheduler capacity
- Placement allocations
- Image download
- Neutron port binding
- Cinder attachment
- libvirt and hypervisor state
- Host CPU, memory, disk, and kernel messages

---

## Network Failure Triage

- Port status and binding
- Security groups
- DHCP lease and route
- Metadata access
- Overlay or VLAN transport
- Router and NAT state
- External bridge
- Physical switch and upstream routing
- Return path

---

## Storage Failure Triage

- Volume status
- Attachment records
- Backend service state
- Pool health and capacity
- Client authentication
- Network connectivity
- Multipath and connector state
- Snapshot or clone dependency

---

## Database and Message Bus

Symptoms of shared dependency failure can appear across many services.

Check:

- Cluster membership
- Quorum
- Replication state
- Connection counts
- Disk and memory pressure
- Queue growth
- Network partitions
- Time synchronization

---

## Evidence Before Action

Collect:

- Timestamp and timezone
- User-visible error
- Request ID
- Resource IDs
- Service states
- Relevant logs
- Recent changes
- Capacity and quota information
- Network and storage health

Then choose the smallest reversible action.

---

## Observability

Useful signals:

- API latency and error rate
- Scheduler failures
- Queue depth
- Database health
- Hypervisor capacity
- Network-agent state
- Storage latency and capacity
- Certificate expiry
- Container restart count
- Host CPU, memory, disk, and network

---

## Escalation Package

A good escalation includes:

- Clear impact
- Reproduction steps
- Timeline
- Request IDs
- Resource IDs
- Sanitized logs
- Architecture context
- Actions already attempted
- Current risk and rollback status
