# Session 4 — Core Cloud Service Categories

## Learning Objectives

- Compare virtual machines, containers, PaaS, and serverless compute
- Select block, file, and object storage
- Explain virtual networking and traffic flow
- Compare relational, document, key-value, analytical, and caching services

## Compute Choices

### Virtual Machines

Best when the team needs OS-level control, legacy compatibility, custom software, or predictable long-running capacity.

Responsibilities include image maintenance, patching, host configuration, scaling logic, and availability design unless managed by additional services.

### Managed Application Platforms

Best when the team wants to deploy applications without operating most runtime infrastructure.

Trade-offs include runtime constraints, platform conventions, and provider-specific behavior.

### Containers

Containers provide portable packaging, but orchestration, networking, storage, security, and upgrades still require an operating model.

Managed Kubernetes reduces some infrastructure work but remains a complex distributed platform.

### Serverless

Best for event-driven, bursty, or operationally simple workloads that fit service limits.

Consider cold starts, execution limits, observability, state management, event semantics, and cost at sustained scale.

## Storage Models

| Storage | Characteristics | Typical use |
|---|---|---|
| Block | Low-level volumes attached to compute | OS disks, databases, transactional workloads |
| File | Shared hierarchical filesystem | Shared content, legacy applications, user directories |
| Object | API-accessed objects in buckets or containers | Images, backups, logs, data lakes, static assets |
| Archive | Low-cost long-term retention with slower access | Compliance archives, historical backups |

Durability, availability, performance, consistency, lifecycle, encryption, and egress cost must all be evaluated.

## Networking Foundations

A cloud virtual network typically includes:

- Address ranges
- Subnets
- Route tables
- Internet and NAT gateways
- Private service endpoints
- Security groups or firewall rules
- Load balancers
- DNS
- VPN or dedicated private connectivity
- Network flow logs

## Public and Private Traffic

A resource may be:

- Publicly addressed
- Privately addressed with controlled outbound internet access
- Private with provider-service endpoints
- Connected to on-premises networks
- Exposed through a load balancer, API gateway, or content-delivery network

Minimize direct public exposure and document every trust boundary.

## Load Balancing and DNS

Load balancers distribute traffic and perform health checks. Different layers support TCP/UDP, TLS, HTTP routing, or global traffic management.

DNS can route by health, geography, latency, weight, or failover policy, but DNS caching affects recovery behavior.

## Database Models

### Relational

Strong schemas, transactions, joins, and mature query capabilities. Suitable for orders, payments, and systems of record.

### Key-Value

Simple access by key with high scale and predictable performance.

### Document

Flexible JSON-like records for evolving application data.

### Wide-Column

Distributed storage optimized for large-scale sparse datasets.

### Graph

Relationships are first-class and traversed efficiently.

### Analytical Warehouse

Optimized for large analytical queries rather than transactional updates.

### Cache

Low-latency temporary data that reduces backend load. A cache usually requires explicit consistency and failure behavior.

## Messaging and Integration

Queues, topics, event buses, and streams decouple components.

Design for:

- At-least-once delivery
- Duplicate messages
- Ordering requirements
- Dead-letter handling
- Retry and backoff
- Idempotent consumers

## Selection Heuristics

Choose the highest-level managed service that meets requirements and that the team can responsibly operate.

Do not choose a managed service only because it exists. Consider exit strategy, observability, skills, limits, and cost.
