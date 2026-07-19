# KCNA Lab Setup

The KCNA exam is multiple choice, but a small local cluster makes the concepts easier to retain.

## Default Setup: kind

### Required Tools

- `kubectl`
- Docker Engine or Podman configured for kind
- `kind`
- Git
- Python 3 for repository validation

Verify the tools:

```bash
kubectl version --client
kind version
docker version
python3 --version
```

### Create the Cluster

From the course directory:

```bash
make cluster-create
```

Confirm access:

```bash
kubectl cluster-info --context kind-kcna-lab
kubectl get nodes
```

The provided kind configuration creates one control-plane node and one worker node.

### Select the Context

```bash
kubectl config get-contexts
kubectl config use-context kind-kcna-lab
kubectl config current-context
```

### Apply the Training Resources

```bash
make demo-apply
kubectl get all -n kcna-lab
```

### Clean Up

```bash
make demo-delete
make cluster-delete
```

## Alternative: minikube

```bash
minikube start
kubectl get nodes
```

The Makefile cluster creation targets use kind, but the manifests and labs work on a normal minikube cluster.

## Alternative: Existing Cluster

Use only a non-production cluster where you are authorized to create namespaces and namespaced resources.

Before starting:

```bash
kubectl config current-context
kubectl auth can-i create namespaces
kubectl auth can-i create deployments -n default
```

Do not continue if the context points to production or a cluster you do not recognize.

## Optional Tools

- `helm` for chart exploration
- `jq` for JSON filtering
- `yq` for YAML processing
- `k9s` for interactive inspection

The labs do not require these tools.
