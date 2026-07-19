---
marp: true
paginate: true
title: Observability Ecosystem and Community
---

# Cloud Native Architecture

## Observability, CNCF ecosystem, and community collaboration

---

# Monitoring and Observability

- **Monitoring** checks known system conditions
- **Observability** uses system outputs to understand internal behavior, including unexpected failure modes

Common signals:

- Metrics
- Logs
- Traces
- Events
- Profiles

Useful telemetry must be contextual, reliable, and actionable.

---

# Metrics

Metrics are numerical measurements over time.

Examples:

- Request rate
- Error rate
- Latency
- CPU and memory usage
- Queue depth
- Replica availability

Prometheus stores labeled time-series data and commonly scrapes HTTP metric endpoints.

---

# Logs, Traces, and Events

- **Logs**: timestamped records of discrete events
- **Traces**: request paths across distributed services
- **Kubernetes events**: short-lived records of cluster decisions and failures
- **Profiles**: aggregated information about code execution and resource use

Correlation across signals accelerates troubleshooting.

---

# Health and Service-Level Thinking

- Readiness answers: should this instance receive traffic?
- Liveness answers: should this container be restarted?
- Startup answers: has initialization completed?
- SLI: measured behavior
- SLO: target for an SLI
- Alert: signal that requires attention

Alert on symptoms with user impact where practical.

---

# CNCF Role

The Cloud Native Computing Foundation:

- Hosts open source cloud native projects
- Supports project governance and community development
- Maintains the cloud native landscape
- Coordinates events and education
- Promotes interoperability and open standards

Project maturity commonly progresses through Sandbox, Incubating, and Graduated stages.

---

# Ecosystem Categories

Examples learners should recognize conceptually:

- Orchestration: Kubernetes
- Observability: Prometheus, OpenTelemetry
- Service proxy and mesh: Envoy, Linkerd
- Delivery: Argo, Flux
- Runtime: containerd, CRI-O
- Networking: Cilium and other CNI implementations
- Storage: CSI drivers and storage projects
- Policy and security: OPA, Falco, SPIFFE/SPIRE

The exam focuses on purposes and relationships, not memorizing the entire landscape.

---

# Open Standards and Interfaces

Important interfaces and specifications:

- OCI for image and runtime standards
- CRI for container runtime integration
- CNI for networking
- CSI for storage
- OpenTelemetry for telemetry signals
- Kubernetes API conventions and extension mechanisms

Open interfaces enable portability and ecosystem innovation.

---

# Community and Collaboration

Cloud native projects rely on:

- Open governance
- Maintainers and contributors
- Special Interest Groups and Working Groups
- Public issues, proposals, and reviews
- Codes of conduct
- Documentation and release processes

Contribution includes code, testing, documentation, translation, support, and community work.

---

# Architecture Reasoning

When evaluating a tool, ask:

- Which problem does it solve?
- At which layer does it operate?
- Which standard interface does it use?
- Is it a control plane, dataplane, or both?
- What operational responsibility does it add?
- How is it observed and secured?
- What is the failure mode?
