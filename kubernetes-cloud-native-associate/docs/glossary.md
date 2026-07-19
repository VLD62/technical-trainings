# KCNA Glossary

## Core Platform Terms

**Admission control** — Processing that validates or mutates an API request after authentication and authorization but before persistence.

**Annotation** — Non-identifying key-value metadata attached to an object.

**API server** — Control-plane component that exposes the Kubernetes API.

**Cluster** — A Kubernetes control plane and its worker nodes.

**Controller** — Reconciliation loop that moves current state toward desired state.

**Desired state** — The requested configuration stored through the Kubernetes API.

**etcd** — Consistent key-value store used for Kubernetes cluster state.

**kubelet** — Node agent responsible for running assigned Pods.

**Label** — Identifying key-value metadata used for organization and selection.

**Namespace** — Logical scope for resource names, access, and policy.

**Node** — Physical or virtual machine that runs Pods.

**Pod** — Smallest deployable Kubernetes unit containing one or more tightly coupled containers.

**Reconciliation** — Continuous comparison and correction of current state against desired state.

**Selector** — Expression that matches labels.

## Workloads and Scheduling

**CronJob** — Controller that creates Jobs on a schedule.

**DaemonSet** — Controller that runs Pods on selected nodes, commonly one per node.

**Deployment** — Controller for declarative management of stateless replicated workloads.

**Job** — Controller for finite work that runs to completion.

**Node affinity** — Scheduling rule expressing preferred or required node characteristics.

**ReplicaSet** — Controller that maintains a specified number of Pod replicas.

**Resource limit** — Maximum CPU or memory boundary for a container.

**Resource request** — CPU or memory amount used by the scheduler for placement.

**StatefulSet** — Controller providing stable identity and storage behavior for stateful Pods.

**Taint** — Node property that repels Pods without matching tolerations.

**Toleration** — Pod scheduling property that permits consideration of a matching tainted node.

## Networking

**CNI** — Container Network Interface specification used by plugins to configure container networking.

**ClusterIP** — Default Service type exposing an internal cluster virtual IP.

**EndpointSlice** — Scalable API representation of network endpoints behind a Service.

**Gateway API** — Kubernetes API family for expressive service networking and traffic routing.

**Ingress** — API resource describing HTTP and HTTPS routes into a cluster.

**NetworkPolicy** — Resource describing allowed Pod network traffic when enforced by the network implementation.

**Service** — Stable network abstraction over a selected set of endpoints.

**Service mesh** — Infrastructure layer providing service-to-service traffic management, identity, policy, and telemetry.

## Storage

**CSI** — Container Storage Interface standard for storage integration.

**PersistentVolume** — Cluster storage resource with a lifecycle independent of a single Pod.

**PersistentVolumeClaim** — Namespaced request for persistent storage.

**StorageClass** — Description of a storage class and its provisioning parameters.

**Volume** — Storage made available to containers in a Pod.

## Security and Configuration

**ConfigMap** — Kubernetes object for non-sensitive configuration data.

**RBAC** — Role-Based Access Control authorization model.

**RoleBinding** — Assignment of Role or ClusterRole permissions to subjects within a namespace.

**Secret** — Kubernetes object for sensitive data; safe use still requires encryption and access controls.

**ServiceAccount** — Kubernetes identity intended for workloads and automation.

## Delivery and Observability

**Continuous delivery** — Automated process that keeps changes in a deployable state.

**Continuous deployment** — Automated release of validated changes to an environment.

**GitOps** — Operating model where reviewed Git state drives automated reconciliation.

**Helm chart** — Package of related Kubernetes resource templates and metadata.

**Liveness probe** — Health check used to decide whether a container should be restarted.

**Metric** — Numerical measurement recorded over time.

**Observability** — Ability to understand system behavior from outputs such as metrics, logs, traces, and events.

**Readiness probe** — Health check used to decide whether a workload should receive traffic.

**Startup probe** — Health check that protects slow-starting applications from premature liveness failures.

**Trace** — Representation of a request path through distributed components.

## Ecosystem

**CNCF** — Cloud Native Computing Foundation, home to Kubernetes and many cloud native projects.

**CRI** — Container Runtime Interface used by Kubernetes to communicate with runtimes.

**OCI** — Open Container Initiative, which defines image and runtime specifications.

**OpenTelemetry** — Vendor-neutral framework for generating and transporting telemetry.

**Prometheus** — Monitoring and alerting toolkit built around labeled time-series metrics.
