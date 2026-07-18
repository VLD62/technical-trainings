# Lab 02 - Run and Inspect a First Container

## Goal

Run a small container, inspect its lifecycle, and connect the container abstraction to host processes.

## Step 1 - Verify the Engine

```bash
docker version
docker info
```

Record:

- Engine version
- Storage driver
- cgroup version
- Rootless or rootful operation

## Step 2 - Run a One-Time Container

```bash
docker run --rm alpine:3.22 sh -c 'echo hello; uname -a; id'
```

Observe:

- The command starts inside the container environment.
- The kernel information is provided by the host kernel.
- The container is removed after the command exits.

## Step 3 - Run a Background Container

```bash
docker run -d --name training-sleeper alpine:3.22 sleep 600
```

Inspect it:

```bash
docker ps
docker inspect training-sleeper
docker top training-sleeper
```

## Step 4 - Compare with Host Processes

```bash
ps -ef | grep '[s]leep 600'
```

The container process is also a host process, but it executes with namespace and cgroup configuration.

## Step 5 - Execute a Command

```bash
docker exec training-sleeper sh -c 'hostname; ps; ip addr'
```

## Step 6 - View Logs and State

```bash
docker logs training-sleeper
docker inspect --format '{{.State.Status}}' training-sleeper
```

The sleeper produces no normal log output, which is itself an observation.

## Cleanup

```bash
docker rm -f training-sleeper
```

## Review Questions

1. What determines when the container stops?
2. Why is the container's `uname` kernel related to the host?
3. Which resources were isolated?
4. Which resources were shared?
5. How would this differ from starting a VM?
