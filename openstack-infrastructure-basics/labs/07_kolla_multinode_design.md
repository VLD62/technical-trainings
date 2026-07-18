# Lab 07 - Kolla-Ansible Multinode Design

## Goal

Design a generic multinode OpenStack environment without deploying it.

## Scenario

Available hosts:

```text
controller01  8 vCPU  32 GiB RAM  2 NICs
controller02  8 vCPU  32 GiB RAM  2 NICs
controller03  8 vCPU  32 GiB RAM  2 NICs
compute01    16 vCPU  64 GiB RAM  2 NICs
compute02    16 vCPU  64 GiB RAM  2 NICs
storage01     8 vCPU  32 GiB RAM  data disks
storage02     8 vCPU  32 GiB RAM  data disks
storage03     8 vCPU  32 GiB RAM  data disks
```

Networks:

- Management/API network
- Overlay tunnel network
- External provider network
- Storage client network
- Storage replication network

## Tasks

### 1. Assign Roles

Create an inventory mapping for:

- Control
- Network
- Compute
- Monitoring
- Storage integration

Compare your answer with `examples/kolla/multinode.example`.

### 2. Choose Interfaces

Document:

```text
network_interface:
neutron_external_interface:
tunnel_interface:
storage_interface:
cluster_interface:
```

Interface names depend on the actual hosts.

### 3. Select a Virtual IP

Choose an unused documentation address in the management subnet and explain how you would prove it is unused before deployment.

### 4. Decide Networking Backend

Compare:

- ML2/OVS
- OVN

Consider distributed routing, operational experience, migration, and troubleshooting tooling.

### 5. Decide Storage

- Local ephemeral or Ceph RBD for Nova?
- Ceph RBD for Glance and Cinder?
- Separate pools and CRUSH rules?
- Recovery headroom?

### 6. Failure Domains

Explain what remains available after losing:

- One controller
- One compute node
- One storage node
- One top-of-rack switch

### 7. Validation Plan

Write acceptance tests for:

- Token issuance
- API VIP failover
- Instance build
- Tenant networking
- Floating IP
- Volume create and attach
- Controller loss
- Compute loss
- Storage degradation

## Deliverable

Produce:

- Inventory draft
- Network table
- Storage decision
- Failure-domain diagram
- Validation checklist
