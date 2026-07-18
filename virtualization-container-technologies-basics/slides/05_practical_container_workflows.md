---
marp: true
paginate: true
title: Practical Container Workflows
---

# Practical Container Workflows

Examples use Docker syntax. Many single-container commands have direct Podman equivalents.

---

# Verify the Engine

```bash
docker version
docker info
```

Podman alternative:

```bash
podman version
podman info
```

Review:

- Client and server/runtime versions
- Storage driver
- cgroup version
- Rootless or rootful mode
- Available CPU and memory

---

# Pull and Inspect an Image

```bash
docker pull alpine:3.22
docker image ls
docker image inspect alpine:3.22
```

Important concepts:

- Repository
- Tag
- Digest
- Layers
- Configuration
- Architecture

---

# Run a Container

```bash
docker run --rm alpine:3.22 echo "hello from a container"
```

What happens:

1. The image is located or pulled
2. A writable container layer is created
3. Isolation and resource configuration are prepared
4. The command starts as the container's main process
5. The container exits when that process exits

---

# Long-Running Container

```bash
docker run -d \
  --name training-web \
  -p 8080:80 \
  nginx:stable-alpine
```

Inspect:

```bash
docker ps
docker logs training-web
docker inspect training-web
```

Clean up:

```bash
docker rm -f training-web
```

---

# Build a Custom Image

```dockerfile
FROM python:3.13-alpine
WORKDIR /app
COPY app.py .
USER 10001
EXPOSE 8080
CMD ["python", "app.py"]
```

Build:

```bash
docker build -t virtualization-training/hello:local \
  examples/hello-container
```

---

# Run with Limits

```bash
docker run -d \
  --name virtualization-training-hello \
  -p 8080:8080 \
  --memory 128m \
  --cpus 0.50 \
  virtualization-training/hello:local
```

Resource limits make capacity and failure behavior more predictable.

---

# Environment Variables

```bash
docker run --rm \
  -e TRAINING_MESSAGE="configured at runtime" \
  virtualization-training/hello:local
```

Use environment variables for non-secret runtime configuration.

For secrets, use a dedicated secret-management mechanism.

---

# Volumes and Bind Mounts

Named volume:

```bash
docker volume create training-data
```

Bind mount:

```bash
docker run --rm \
  -v "$(pwd)/data:/data:ro" \
  alpine:3.22 ls -la /data
```

Mount only the paths required by the application.

---

# Container Networks

```bash
docker network create training-net

docker run -d --name web-a --network training-net nginx:stable-alpine
docker run --rm --network training-net alpine:3.22 \
  wget -qO- http://web-a
```

Containers on the same user-defined network can resolve each other by name.

---

# Compose Workflow

Start:

```bash
docker compose \
  -f examples/compose-stack/compose.yaml \
  up -d --build
```

Inspect:

```bash
docker compose -f examples/compose-stack/compose.yaml ps
docker compose -f examples/compose-stack/compose.yaml logs
```

Stop:

```bash
docker compose -f examples/compose-stack/compose.yaml down
```

---

# Troubleshooting Sequence

```text
1. Container state
2. Logs
3. Image and command
4. Environment variables
5. Port mapping
6. Network membership and DNS
7. Volume paths and permissions
8. CPU and memory limits
9. Host runtime and kernel logs
```

Use `inspect` to compare expected and actual configuration.

---

# Useful Inspection Commands

```bash
docker ps -a
docker logs <container>
docker inspect <container>
docker stats --no-stream
docker top <container>
docker exec <container> <command>
docker network inspect <network>
docker volume inspect <volume>
```

Avoid installing debugging tools permanently into production images only for convenience.

---

# Cleanup

```bash
docker container prune
docker image prune
docker network prune
docker volume prune
```

Prune commands remove unused resources.

Review their scope before confirming deletion.

---

# Key Takeaway

A repeatable container workflow is:

```text
Define -> Build -> Scan/Test -> Run -> Observe -> Replace -> Clean Up
```
