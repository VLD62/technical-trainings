# High Availability, Security, and Production Readiness

## Session 8

---

## High Availability Is End-to-End

A virtual IP alone does not make a cloud highly available.

Consider:

- API endpoints
- Databases
- Message bus
- Schedulers
- Network services
- Storage
- DNS and certificates
- Physical network
- Compute capacity
- Operational procedures

---

## Virtual IP Pattern

```text
Clients
   |
Virtual IP
   |
HAProxy on controller nodes
   |
OpenStack API containers
```

Keepalived or another mechanism moves the virtual IP between healthy load-balancer nodes.

---

## Internal and External Endpoints

Separate endpoint interfaces can support:

- External user traffic
- Internal service-to-service traffic
- Administrative access

Design routing, DNS, TLS, firewall policy, and failure behavior for each path.

---

## MariaDB Galera

Galera provides synchronous multi-primary replication for supported OpenStack database deployments.

Operational concerns:

- Quorum
- State transfer
- Desynchronization
- Backup consistency
- Schema changes
- Recovery from total cluster outage

A running container is not enough; verify cluster readiness.

---

## RabbitMQ Clustering

RabbitMQ carries RPC and notifications.

Validate:

- Running cluster members
- Queue health
- Partitions
- Disk and memory alarms
- Listener availability
- Authentication
- Message growth

Message-bus failure can produce timeouts and stuck tasks across multiple services.

---

## Neutron High Availability

Possible patterns include:

- HA routers with VRRP
- Distributed virtual routing
- Multiple DHCP and metadata agents
- Redundant gateways
- OVN distributed routing

The correct validation depends on the networking backend.

---

## Failure Testing

Test intentionally in a lab:

- Stop one API container
- Move a virtual IP
- Restart one database member
- Stop one message-bus member
- Disable one network agent
- Put a compute host into maintenance
- Simulate storage-path loss

Define expected behavior, success criteria, and rollback before the test.

---

## Security Layers

- Identity and policy
- Network segmentation
- Security groups and firewalls
- TLS and certificate lifecycle
- Host hardening
- Container and image provenance
- Secret management
- Audit logging
- Patch and vulnerability management
- Backup protection

---

## Least Privilege

Separate:

- Cloud administrators
- Project administrators
- Operators
- Auditors
- Service users
- Automation credentials

Avoid using a global administrator account for routine automation.

---

## Upgrade Strategy

- Read release notes
- Validate supported upgrade paths
- Test in a representative environment
- Back up databases and configuration
- Confirm capacity for rolling operations
- Track schema and message compatibility
- Define rollback and recovery points
- Validate APIs and workloads after each stage

---

## Production Readiness Checklist

- Documented architecture and ownership
- Tested backups and restores
- Capacity thresholds and alerts
- Patch and upgrade calendar
- Credential and certificate rotation
- Failure tests
- Runbooks and escalation paths
- Change control
- Security review
- Recovery objectives

---

## Final Principle

Production readiness is demonstrated by repeatable operations and tested recovery, not only by successful installation.
