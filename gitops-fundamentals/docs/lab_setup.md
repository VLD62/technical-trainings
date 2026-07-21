# Lab Setup

## Purpose

The labs use a disposable Kubernetes cluster and a learner-controlled Git repository. The recommended local path uses `kind`, but any non-production cluster can be used.

## Required Tools

| Tool | Purpose |
|---|---|
| Git | Version control and GitOps source of truth |
| Docker or compatible runtime | Runs the local Kubernetes nodes |
| `kind` | Creates a disposable Kubernetes cluster |
| `kubectl` | Interacts with Kubernetes and renders Kustomize |
| Helm 3 | Lints and renders the example chart |
| Python 3 | Runs content validation |
| Browser | Accesses the Argo CD UI |

Optional:

- Argo CD CLI
- Flux CLI
- `jq`
- `yq`
- `shellcheck`
- Visual Studio Code with YAML and Kubernetes extensions

## Verify the Environment

From the module directory:

```bash
make check-environment
```

Manual checks:

```bash
git --version
docker version
kind version
kubectl version --client
helm version
python3 --version
```

## Create the Disposable Cluster

```bash
make cluster-create
kubectl cluster-info
kubectl get nodes
```

The script creates a cluster named `gitops-lab` unless it already exists.

## Install Argo CD

```bash
make argocd-install
kubectl get pods -n argocd
```

The installer uses the official stable installation manifest. Production installations should pin and verify a specific release rather than follow a moving branch.

## Access the UI

In one terminal:

```bash
make argocd-port-forward
```

Open:

```text
https://localhost:8080
```

Username:

```text
admin
```

Retrieve the initial password:

```bash
make argocd-password
```

The local certificate is self-signed. A browser warning is expected in this disposable lab.

## Install the Argo CD CLI

Follow the official platform-specific installation instructions, then verify:

```bash
argocd version --client
```

Login through the port forward:

```bash
argocd login localhost:8080 --username admin --insecure
```

## Prepare a Git Repository

Create a separate repository for the hands-on labs. A simple structure is:

```text
gitops-lab-repository/
├── apps/
│   └── demo-app/
│       ├── base/
│       └── overlays/
│           ├── dev/
│           ├── staging/
│           └── prod/
├── argocd/
│   ├── applications/
│   ├── projects/
│   └── applicationsets/
└── README.md
```

Copy the relevant files from `examples/` and replace placeholder repository URLs.

## Private Repository Guidance

For a private repository, configure Argo CD credentials through a controlled mechanism. Do not place personal access tokens in application manifests.

For a short-lived lab, use the UI or CLI. For production, prefer:

- Dedicated machine identity
- Read-only repository access where possible
- Short-lived credentials
- SSH deploy keys or workload identity where supported
- Central secret management
- Credential rotation
- Audit logging

## Optional Flux CLI

Install the Flux CLI only for Lab 9, then verify:

```bash
flux version
flux check --pre
```

The Flux bootstrap workflow writes controller manifests and synchronization configuration to a Git repository. Use a repository created specifically for the lab.

## Cleanup

```bash
make clean-lab
```

Review the script before running it. It removes course namespaces and deletes the local `kind` cluster named `gitops-lab`.
