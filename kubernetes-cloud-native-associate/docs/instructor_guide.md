# Instructor Guide

## Audience

This course is suitable for:

- Developers entering Kubernetes
- System administrators and DevOps engineers moving into cloud native platforms
- Technical leads who need a common conceptual vocabulary
- Learners preparing for KCNA before progressing to CKA, CKAD, or KCSA

## Delivery Options

### Compact Awareness Session — 3 Hours

- 20 min: cloud native and containers
- 40 min: architecture and core resources
- 35 min: scheduling and configuration
- 40 min: networking, security, and storage
- 25 min: delivery and observability
- 20 min: exam review

Use only short demonstrations.

### Two Half-Day Workshops

**Workshop 1**

- Sessions 0–3
- Labs 01–03
- Quiz 01

**Workshop 2**

- Sessions 4–7
- Labs 04–05
- Quizzes 02–03

## Demonstration Sequence

1. Show contexts, nodes, namespaces, and API resources
2. Apply the Namespace, Deployment, and Service
3. Show labels, selectors, Pods, ReplicaSet, and rollout status
4. Demonstrate Service port-forwarding
5. Break the Service selector and inspect EndpointSlices
6. Show ConfigMap and Secret injection
7. Review resource requests and scheduling output
8. Inspect events and logs
9. Show PVC state and StorageClass discovery
10. Connect each practical object to its KCNA domain

## Teaching Principles

- Begin with the problem before naming the Kubernetes resource
- Ask learners to predict state before running commands
- Use diagrams to show relationships between objects
- Revisit similar terms through explicit comparisons
- Avoid memorization of the whole CNCF landscape
- Focus on the purpose and layer of each ecosystem project
- Keep examples generic and safe for public reuse

## Assessment

Recommended completion criteria:

- All five labs completed
- At least 75% on both domain quizzes
- At least 80% on the mock exam
- Learner can explain the architecture and traffic-flow diagrams without notes

## Maintenance

Before each delivery:

- Verify the current KCNA domain weights
- Review the official curriculum repository history
- Check the current Kubernetes documentation
- Validate all manifests against a supported local cluster
- Confirm external links
- Update exam logistics without embedding volatile prices unless necessary
