# Quiz 01 — Kubernetes Fundamentals

Choose the best answer. Answers are at the end.

## Questions

1. Which component is the primary entry point to the Kubernetes control plane?
   - A. kubelet
   - B. kube-apiserver
   - C. kube-proxy
   - D. containerd

2. Which object is normally preferred for managing a replicated stateless application?
   - A. Deployment
   - B. Standalone Pod
   - C. PersistentVolume
   - D. Node

3. What does the Kubernetes scheduler primarily do?
   - A. Pull container images
   - B. Store cluster state
   - C. Select a node for an unscheduled Pod
   - D. Expose Services externally

4. Which metadata is normally used by a Service to identify backend Pods?
   - A. Annotations
   - B. Labels and selectors
   - C. Finalizers
   - D. Owner references only

5. Which workload is designed to run a finite task to completion?
   - A. DaemonSet
   - B. Service
   - C. Job
   - D. ReplicaSet

6. Which statement about resource requests is correct?
   - A. They are used by the scheduler for placement decisions
   - B. They always equal current resource usage
   - C. They expose a workload to the network
   - D. They encrypt Secret data

7. What does a toleration do?
   - A. Guarantees placement on a specific node
   - B. Permits consideration of a matching tainted node
   - C. Creates a node label
   - D. Reserves a PersistentVolume

8. Which resource is designed for non-sensitive configuration data?
   - A. ConfigMap
   - B. Secret
   - C. ServiceAccount
   - D. StorageClass

9. Which statement about Kubernetes Secrets is correct?
   - A. Base64 encoding provides strong encryption
   - B. Secrets require no access control
   - C. Base64 is encoding, and safe use requires additional controls
   - D. Secrets can only be mounted as files

10. What is the main role of the kubelet?
    - A. Run assigned Pods on a node
    - B. Store all cluster state
    - C. Provide the GitOps source of truth
    - D. Create external load balancers

11. Which object is appropriate for one copy of an agent on every selected node?
    - A. Deployment
    - B. DaemonSet
    - C. CronJob
    - D. Service

12. What is the relationship between `spec` and `status`?
    - A. Both always contain user credentials
    - B. `spec` expresses desired state and `status` reports observed state
    - C. `status` selects Pods and `spec` stores logs
    - D. They are interchangeable

## Answers

1. B
2. A
3. C
4. B
5. C
6. A
7. B
8. A
9. C
10. A
11. B
12. B
