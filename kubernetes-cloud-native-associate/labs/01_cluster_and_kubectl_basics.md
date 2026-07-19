# Lab 01 — Cluster and kubectl Basics

## Objectives

- Confirm cluster access
- Identify the control plane and worker nodes
- Explore API resources
- Create a dedicated namespace
- Connect observed resources to architecture components

## 1. Verify Context

```bash
kubectl config current-context
kubectl cluster-info
kubectl get nodes -o wide
```

Questions:

1. Which context is active?
2. How many nodes exist?
3. Which node roles and Kubernetes versions are reported?

## 2. Explore the API

```bash
kubectl api-resources
kubectl api-versions
kubectl explain pod
kubectl explain deployment.spec
```

Identify:

- A namespaced resource
- A cluster-scoped resource
- The API group for Deployments
- The field that controls Deployment replicas

## 3. Create the Training Namespace

```bash
kubectl apply -f examples/manifests/namespace.yaml
kubectl get namespace kcna-lab
```

## 4. Inspect System Components

```bash
kubectl get pods -n kube-system -o wide
kubectl get deployments,daemonsets -n kube-system
```

Do not modify system resources.

## 5. Run the Inventory Script

```bash
./scripts/cluster_inventory.sh
```

## Review

- Why is the API server central to the architecture?
- Which component assigns a Pod to a node?
- Which component starts the containers after placement?
- Why are namespaces useful but not equivalent to separate clusters?
