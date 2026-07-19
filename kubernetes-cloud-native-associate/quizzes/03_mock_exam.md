# KCNA Mock Exam

This independent 30-question knowledge check is based on public KCNA domains. It does not contain real exam questions.

Choose one best answer for each question. Suggested time: 45 minutes. Target score: 24/30 or higher.

## Questions

1. Which Kubernetes component stores cluster state?
   - A. kubelet
   - B. etcd
   - C. CNI
   - D. Ingress

2. Which control-plane component assigns unscheduled Pods to nodes?
   - A. kube-proxy
   - B. CSI driver
   - C. Scheduler
   - D. CoreDNS

3. Which resource is the smallest deployable unit in Kubernetes?
   - A. Pod
   - B. Container image
   - C. Namespace
   - D. Service

4. Why is a Deployment preferred over a standalone Pod for a web application?
   - A. It automatically creates persistent storage
   - B. It replaces the container runtime
   - C. It provides cluster DNS
   - D. It provides declarative replicas and rollout management

5. Which workload provides stable identity and storage behavior for replicas?
   - A. DaemonSet
   - B. StatefulSet
   - C. Job
   - D. Ingress

6. Which controller creates Jobs on a repeating schedule?
   - A. Deployment
   - B. ReplicaSet
   - C. CronJob
   - D. EndpointSlice

7. What is a container image digest?
   - A. A mutable node label
   - B. A Service IP
   - C. A Pod restart policy
   - D. A content-addressed immutable reference

8. What is the purpose of a registry?
   - A. Store and distribute container images
   - B. Schedule Pods
   - C. Store Kubernetes events only
   - D. Enforce NetworkPolicy

9. What does the CRI connect conceptually?
   - A. Services and DNS
   - B. Kubernetes and container runtimes
   - C. PVCs and application logs
   - D. Git and Helm repositories

10. Which field is most important for the scheduler when evaluating requested capacity?
    - A. Annotations
    - B. Service ports
    - C. Resource requests
    - D. Image digest only

11. Which statement about taints and tolerations is correct?
    - A. A taint always attracts Pods
    - B. A toleration creates a new node
    - C. They configure persistent storage
    - D. A toleration permits, but does not guarantee, placement on a tainted node

12. Which resource should hold non-sensitive application settings?
    - A. ConfigMap
    - B. PersistentVolume
    - C. ClusterRoleBinding
    - D. IngressClass

13. Which statement about Secret data is correct?
    - A. Every Secret is automatically encrypted with a user-managed key
    - B. Base64 alone is not encryption
    - C. Secrets cannot be mounted into Pods
    - D. Secrets do not require RBAC

14. Which Service type normally exposes a service only inside the cluster?
    - A. NodePort
    - B. LoadBalancer
    - C. ClusterIP
    - D. ExternalName to a public hostname

15. A Service exists but has no endpoints. Which issue is most likely?
    - A. etcd is used by the control plane
    - B. The container image has a digest
    - C. The namespace has a name
    - D. Selector does not match ready Pods

16. What implements Pod networking in a typical Kubernetes cluster?
    - A. A CNI plugin
    - B. A CSI driver
    - C. A Helm values file
    - D. A PersistentVolumeClaim

17. What is the purpose of an Ingress resource?
    - A. Store container images
    - B. Describe HTTP and HTTPS routing rules
    - C. Schedule Jobs
    - D. Define node CPU capacity

18. What additional component is required for an Ingress resource to affect traffic?
    - A. A CronJob controller
    - B. A PVC
    - C. An Ingress controller
    - D. A ConfigMap in every namespace

19. Which object requests persistent storage for a namespaced workload?
    - A. PersistentVolume
    - B. StorageClass only
    - C. EndpointSlice
    - D. PersistentVolumeClaim

20. Which standard interface is associated with storage plugins?
    - A. CSI
    - B. CNI
    - C. CRI
    - D. OCI image layout only

21. A Pod is in `ImagePullBackOff`. What should be checked first?
    - A. Service selector only
    - B. Image reference, registry access, and pull credentials
    - C. PVC reclaim policy only
    - D. Prometheus alert rules

22. Which probe determines whether a container should be restarted?
    - A. Readiness probe
    - B. Service probe
    - C. Liveness probe
    - D. Scheduling probe

23. Which probe should protect a slow-starting application from premature liveness failures?
    - A. Readiness probe only
    - B. NetworkPolicy probe
    - C. Storage probe
    - D. Startup probe

24. Which statement best describes continuous delivery?
    - A. Changes are kept deployable through an automated process
    - B. Every source commit must automatically reach production
    - C. Operators manually rebuild each server
    - D. Git is replaced by the Kubernetes API

25. Which statement best describes GitOps?
    - A. A container registry schedules Pods
    - B. A controller reconciles reviewed Git state with the target environment
    - C. Git stores live memory metrics
    - D. Kubernetes no longer uses desired state

26. What does Helm package?
    - A. Kubernetes node operating systems
    - B. Raw etcd backups only
    - C. Related Kubernetes resource templates and metadata
    - D. CNI binaries only

27. Which telemetry signal is best for understanding one request across several services?
    - A. Namespace label
    - B. PersistentVolume
    - C. Replica count
    - D. Distributed trace

28. What is Prometheus primarily designed to collect and query?
    - A. Labeled time-series metrics
    - B. Container image layers
    - C. Git commit signatures
    - D. Kubernetes RBAC bindings only

29. What is the CNCF Landscape?
    - A. A Kubernetes scheduler plugin
    - B. A categorized map of cloud native projects and products
    - C. A mandatory cluster runtime
    - D. A type of Service

30. Which approach best reflects cloud native operational principles?
    - A. Manual server changes with no version history
    - B. One large annual release and no telemetry
    - C. Declarative state, automation, observability, and replaceable workloads
    - D. Shared administrator credentials for all workloads

## Answer Key

1. B
2. C
3. A
4. D
5. B
6. C
7. D
8. A
9. B
10. C
11. D
12. A
13. B
14. C
15. D
16. A
17. B
18. C
19. D
20. A
21. B
22. C
23. D
24. A
25. B
26. C
27. D
28. A
29. B
30. C

## Scoring

- **27–30**: Strong readiness; review logistics and weak details
- **24–26**: Ready after targeted review
- **20–23**: Revisit weak domains before scheduling
- **Below 20**: Repeat the course materials and labs
