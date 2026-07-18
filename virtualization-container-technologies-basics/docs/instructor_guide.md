# Instructor Guide

## Intended Audience

The course is suitable for:

- Developers
- Test and QA engineers
- DevOps and platform engineers
- System administrators
- Cloud engineers
- Technical leads who need architectural context

## Delivery Formats

### Compact Awareness Session - 45 to 60 Minutes

| Time | Topic |
|---:|---|
| 5 min | Introduction and learning goals |
| 10 min | Virtualization fundamentals |
| 10 min | Containerization fundamentals |
| 10 min | VM vs container comparison |
| 10 min | Use cases and hybrid architecture |
| 10 min | Demonstration and Q&A |

Recommended demonstration:

1. Run an Alpine container
2. Show the container as a host process
3. Inspect its network and resource settings
4. Compare the flow with a VM architecture diagram

### Two-Session Format

**Session A:** Concepts and architecture

- Slides 00-04
- Knowledge check 01

**Session B:** Practice and operations

- Slides 05-06
- Labs 02-05
- Knowledge check 02

### Half-Day Workshop

1. Course introduction
2. Virtualization host inspection
3. First container
4. Custom image build
5. Compose stack
6. Isolation and limits
7. Scenario review

## Demonstration Preparation

Before the session:

```bash
make validate
make check-virtualization
make build
make compose-up
make compose-down
```

Pre-pull images when network access may be slow:

```bash
docker pull alpine:3.22
docker pull python:3.13-alpine
docker pull nginx:stable-alpine
```

## Discussion Prompts

- Which workloads in your environment require a full guest OS?
- Which workloads benefit from disposable execution?
- Where is state stored?
- Who patches the host, guest, image, and application layers?
- What changes when containers run inside VMs?
- What would make a container boundary insufficient?

## Common Misconceptions to Correct

- A container is not a small virtual machine.
- An image is not a running container.
- Containers do not eliminate operating-system dependencies.
- A tag is not an immutable version identifier.
- Snapshots are not automatically backups.
- Root inside a container is not equivalent to a separate VM boundary.
- Kubernetes is not a container runtime or image builder.

## Evaluation Suggestions

Participants should be able to:

- Draw both architecture stacks
- Explain one use case for VMs and one for containers
- Identify image, engine, runtime, and registry roles
- Complete the labs without using production access
- Defend a technology choice for a scenario
