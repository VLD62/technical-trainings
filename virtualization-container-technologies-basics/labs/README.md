# Lab Guide

The labs are designed for an isolated workstation or test VM.

## Lab Order

1. `01_inspect_host_virtualization.md`
2. `02_run_first_container.md`
3. `03_build_container_image.md`
4. `04_multi_container_compose.md`
5. `05_isolation_and_resource_limits.md`
6. `06_vm_or_container_scenarios.md`

## Requirements

Container labs require Docker Engine. Most single-container commands can be adapted to Podman by replacing `docker` with `podman`.

The Compose lab expects the Docker Compose plugin and uses `docker compose`.

## General Safety

- Do not run the labs on production systems.
- Confirm ports `8080` and `8081` are available.
- Do not use real credentials.
- Do not add sensitive bind mounts.
- Review cleanup steps after every lab.

## Validation

From the course root:

```bash
make validate
```

## Cleanup

```bash
make clean
```

Check for remaining resources:

```bash
docker ps -a
docker image ls
docker network ls
docker volume ls
```
