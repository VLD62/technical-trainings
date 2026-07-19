# Quiz 02 — Orchestration, Delivery, and Architecture

Choose the best answer. Answers are at the end.

## Questions

1. Which Service type is the default internal-only Service type?
   - A. ClusterIP
   - B. NodePort
   - C. LoadBalancer
   - D. ExternalName

2. A Service has no endpoints. What is the most likely first check?
   - A. The Service selector and Pod labels
   - B. The cluster certificate expiry
   - C. The Helm repository index
   - D. The PV reclaim policy

3. What is required for NetworkPolicy rules to be enforced?
   - A. A compatible network plugin
   - B. A StorageClass
   - C. A CronJob
   - D. A Helm release

4. Which resource represents a namespaced request for persistent storage?
   - A. PersistentVolumeClaim
   - B. PersistentVolume
   - C. StorageClass
   - D. DaemonSet

5. What can dynamically provision storage in response to a claim?
   - A. A configured StorageClass and provisioner
   - B. A ServiceAccount alone
   - C. kube-proxy
   - D. An Ingress resource

6. Which probe controls whether a Pod should receive Service traffic?
   - A. Readiness probe
   - B. Liveness probe
   - C. Startup probe only
   - D. Audit probe

7. Which statement best describes GitOps?
   - A. Manual changes directly in production are the source of truth
   - B. Reviewed Git state drives automated reconciliation
   - C. Git replaces the Kubernetes API
   - D. GitOps is only a container registry

8. What is a Helm chart?
   - A. A package of related Kubernetes resource templates and metadata
   - B. A Kubernetes node health signal
   - C. A CNI implementation requirement
   - D. A type of PersistentVolume

9. Which signal follows a request across multiple distributed services?
   - A. Trace
   - B. Namespace
   - C. StorageClass
   - D. ReplicaSet

10. What is Prometheus primarily associated with?
    - A. Labeled time-series metrics and alerting
    - B. Container image building
    - C. Kubernetes authorization
    - D. Storage provisioning

11. Which interface standard is associated with Kubernetes storage plugins?
    - A. CSI
    - B. CNI
    - C. CRI
    - D. OCI runtime only

12. What does CNCF project graduation indicate?
    - A. A maturity level reached through the CNCF project process
    - B. The project is no longer open source
    - C. The project can only run in a public cloud
    - D. The project replaces Kubernetes

## Answers

1. A
2. A
3. A
4. A
5. A
6. A
7. B
8. A
9. A
10. A
11. A
12. A
