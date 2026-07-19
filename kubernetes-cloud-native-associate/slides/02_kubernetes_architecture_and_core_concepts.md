---
marp: true
paginate: true
title: Kubernetes Architecture and Core Concepts
---

# Kubernetes Architecture

## Control plane, nodes, API objects, and reconciliation

---

# Cluster Model

A Kubernetes cluster contains:

- A **control plane** that manages the desired state
- One or more **nodes** that run workloads
- An API used by users, controllers, and integrations

```text
kubectl -> API server -> etcd
                    -> scheduler
                    -> controllers
                    -> kubelets -> container runtime -> Pods
```

---

# Control Plane Components

- **kube-apiserver**: front door to the Kubernetes API
- **etcd**: consistent key-value store for cluster state
- **kube-scheduler**: selects nodes for unscheduled Pods
- **kube-controller-manager**: runs core reconciliation controllers
- **cloud-controller-manager**: integrates supported cloud-provider APIs

The API server is the communication hub.

---

# Node Components

- **kubelet**: ensures assigned Pods and containers are running
- **container runtime**: pulls images and runs containers
- **kube-proxy** or an alternative dataplane: supports Service networking
- **CNI plugin**: implements Pod networking
- **CSI driver**: integrates storage systems

A node may be physical or virtual.

---

# Kubernetes API Objects

Common manifest fields:

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: web
spec:
  replicas: 3
```

Objects contain:

- Identity and metadata
- Desired specification in `spec`
- Observed information in `status`

---

# Namespaces, Labels, and Selectors

- **Namespace**: logical scope for names and policy
- **Label**: key-value metadata used for organization and selection
- **Selector**: query that matches labels
- **Annotation**: non-identifying metadata for tools and humans

Selectors connect resources such as Services and Deployments to Pods.

---

# Pods

A Pod is the smallest deployable Kubernetes unit.

Containers in one Pod share:

- Network namespace and IP address
- Port space
- Pod lifecycle
- Attached volumes

Use multiple containers in one Pod only when they form one tightly coupled unit.

---

# Controllers and Workloads

- **Deployment**: stateless applications and rolling updates
- **ReplicaSet**: maintains a number of Pod replicas
- **StatefulSet**: stable identity and storage for stateful workloads
- **DaemonSet**: one Pod per selected node
- **Job**: finite task
- **CronJob**: scheduled Jobs

Prefer controllers over unmanaged Pods.

---

# Declarative and Imperative Workflows

Imperative:

```bash
kubectl create deployment web --image=nginx
```

Declarative:

```bash
kubectl apply -f deployment.yaml
```

Declarative manifests are easier to review, version, reproduce, and automate.

---

# API Discovery

Useful commands:

```bash
kubectl api-resources
kubectl explain deployment
kubectl explain deployment.spec
kubectl get --raw /version
```

Understanding the API model is more important than memorizing every manifest field.
