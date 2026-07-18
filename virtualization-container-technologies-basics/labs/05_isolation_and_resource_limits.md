# Lab 05 - Explore Isolation and Resource Limits

## Goal

Observe selected namespace and cgroup behavior using controlled containers.

Do not run stress tests on shared systems without authorization.

## Step 1 - PID Namespace

Start a container:

```bash
docker run -d --name isolation-lab alpine:3.22 sleep 600
```

Inside the container:

```bash
docker exec isolation-lab ps
```

On the host:

```bash
docker top isolation-lab
```

The same workload is represented differently in the container and host process views.

## Step 2 - Network Namespace

```bash
docker exec isolation-lab ip addr
docker inspect --format '{{json .NetworkSettings.Networks}}' isolation-lab
```

Compare the container interface and address with the host network.

## Step 3 - Read-Only Root Filesystem

```bash
docker rm -f isolation-lab

docker run --rm --read-only alpine:3.22 \
  sh -c 'touch /test-file'
```

The write should fail because the root filesystem is read-only.

Provide a writable temporary filesystem:

```bash
docker run --rm --read-only --tmpfs /tmp alpine:3.22 \
  sh -c 'touch /tmp/test-file && ls -l /tmp/test-file'
```

## Step 4 - Memory Limit

Run a small limited container:

```bash
docker run -d \
  --name limited-container \
  --memory 64m \
  --cpus 0.25 \
  alpine:3.22 sleep 600
```

Inspect:

```bash
docker inspect limited-container
docker stats --no-stream limited-container
```

## Step 5 - Capabilities

Inspect the default capability configuration:

```bash
docker inspect --format '{{json .HostConfig.CapAdd}} {{json .HostConfig.CapDrop}}' limited-container
```

Run with all capabilities dropped:

```bash
docker run --rm --cap-drop ALL alpine:3.22 id
```

Application requirements determine which capabilities, if any, must be added back.

## Cleanup

```bash
docker rm -f isolation-lab limited-container 2>/dev/null || true
```

## Review Questions

1. Which lab step changed visibility?
2. Which step changed resource accounting?
3. Why is a read-only root filesystem useful?
4. Why should capabilities be minimized?
5. Why is shared-kernel isolation different from a VM boundary?
