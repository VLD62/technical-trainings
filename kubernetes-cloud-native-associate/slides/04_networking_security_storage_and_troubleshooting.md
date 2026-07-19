---
marp: true
paginate: true
title: Networking Security Storage and Troubleshooting
---

# Container Orchestration

## Networking, security, storage, and troubleshooting

---

# Kubernetes Networking Model

Core expectations:

- Every Pod receives an IP address
- Pods can communicate without application-level NAT in the basic model
- Containers in one Pod communicate through `localhost`
- Services provide stable discovery over changing Pod endpoints
- A CNI plugin implements Pod networking

Implementation details vary by cluster distribution.

---

# Services

Common Service types:

- **ClusterIP**: internal virtual IP, default type
- **NodePort**: exposes a port on cluster nodes
- **LoadBalancer**: requests an external load balancer from an integration
- **ExternalName**: DNS alias to an external name
- **Headless Service**: direct DNS records for selected Pods

A Service usually selects Pods through labels.

---

# DNS, Ingress, and Gateway Concepts

- Cluster DNS resolves Service and Pod-related names
- Ingress describes HTTP and HTTPS routing rules
- An Ingress controller implements those rules
- Gateway API provides more expressive traffic-management resources
- A service mesh adds workload-to-workload traffic management and policy

A resource definition alone does not provide a dataplane implementation.

---

# Network Policies

NetworkPolicy describes allowed traffic for selected Pods.

Remember:

- It requires a network plugin that enforces the policy
- Policies are additive
- Selection and direction matter
- Default-deny behavior must be explicitly created
- NetworkPolicy is not a general-purpose external firewall

---

# Security Layers

- Image and supply-chain security
- Authentication
- Authorization through RBAC
- Admission control
- Pod Security Standards and workload configuration
- Service accounts and token handling
- Network segmentation
- Secrets management
- Runtime and kernel controls

Cloud native security is shared across the full lifecycle.

---

# Persistent Storage

- **Volume**: storage available to containers in a Pod
- **PersistentVolume (PV)**: cluster storage resource
- **PersistentVolumeClaim (PVC)**: workload request for storage
- **StorageClass**: provisioning and policy description
- **CSI**: standard storage integration interface

Dynamic provisioning creates storage in response to a PVC when supported.

---

# Storage Reasoning

Ask:

- Is the data ephemeral or persistent?
- Which access mode is required?
- What capacity is needed?
- Is dynamic provisioning available?
- What reclaim behavior is expected?
- Does the workload need stable identity?
- What backup and recovery mechanism exists?

---

# Troubleshooting Workflow

1. Confirm context and namespace
2. Inspect object state
3. Read events
4. Describe the failing resource
5. Review current and previous container logs
6. Check selectors and endpoints
7. Check configuration and mounted data
8. Check scheduling, resources, and node conditions
9. Change one variable at a time
10. Verify recovery and document the cause

---

# High-Value Failure Patterns

- `Pending`: scheduling, quota, PVC, or image constraints
- `ImagePullBackOff`: image name, tag, registry, credentials, or network
- `CrashLoopBackOff`: process exits repeatedly
- Service has no endpoints: selector mismatch or unready Pods
- PVC remains Pending: no matching PV or provisioner
- `Forbidden`: authorization failure
- OOMKilled: memory limit or application behavior
