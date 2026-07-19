---
marp: true
paginate: true
title: Workloads Scheduling and Configuration
---

# Workloads, Scheduling, and Configuration

## How Kubernetes places and configures applications

---

# Scheduler Responsibilities

The scheduler selects a feasible and preferred node for each unscheduled Pod.

It considers:

- Resource requests and available capacity
- Node selectors and node affinity
- Pod affinity and anti-affinity
- Taints and tolerations
- Topology constraints
- Existing placements and policies

The scheduler chooses placement; the kubelet runs the Pod.

---

# Resource Requests and Limits

- **Request**: amount used for scheduling and guaranteed capacity decisions
- **Limit**: maximum resource boundary enforced by the runtime or kernel

```yaml
resources:
  requests:
    cpu: 100m
    memory: 64Mi
  limits:
    cpu: 500m
    memory: 128Mi
```

Incorrect values can cause poor placement, throttling, or eviction.

---

# Labels and Node Selection

Simple selection:

```yaml
nodeSelector:
  workload: training
```

More expressive selection uses node affinity.

Anti-affinity and topology spread constraints can reduce correlated failure by distributing replicas.

---

# Taints and Tolerations

A taint repels Pods from a node unless they have a matching toleration.

Typical uses:

- Dedicated nodes
- Specialized hardware
- Isolating system workloads
- Protecting nodes with temporary conditions

A toleration permits scheduling consideration; it does not guarantee placement.

---

# Configuration Resources

- **ConfigMap**: non-sensitive configuration
- **Secret**: sensitive data object requiring careful access control
- **Environment variable**: inject individual values
- **Mounted volume**: expose files to containers

Configuration should be separated from the image when practical.

---

# Secrets Are Not Automatically Safe

Important distinctions:

- Base64 is encoding, not encryption
- Access should be restricted with RBAC
- Encryption at rest must be configured by cluster administrators
- Applications should avoid logging secret values
- External secret-management systems may be used

---

# Service Accounts and RBAC

RBAC connects:

- **Role / ClusterRole**: allowed actions
- **RoleBinding / ClusterRoleBinding**: subjects receiving permissions
- **ServiceAccount**: workload identity inside the cluster

Apply least privilege and prefer namespace-scoped permissions where possible.

---

# Health Probes

- **Startup probe**: protects slow-starting applications
- **Readiness probe**: controls whether traffic should reach a container
- **Liveness probe**: detects a container that should be restarted

A failed readiness probe removes the Pod from Service endpoints without necessarily restarting it.

---

# Administration Concepts

KCNA-level understanding includes:

- Contexts and kubeconfig
- Namespaces and resource organization
- Rollouts and scaling
- Events and object status
- API versions and deprecation awareness
- Resource quotas and limit ranges
- Safe use of `kubectl`
