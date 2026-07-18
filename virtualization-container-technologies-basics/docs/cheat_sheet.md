# Virtualization and Container Cheat Sheet

## Host Virtualization Checks on Linux

```bash
lscpu | grep -i virtualization
grep -Eoc '(vmx|svm)' /proc/cpuinfo
lsmod | grep -E '^kvm'
ls -l /dev/kvm
systemd-detect-virt
virt-host-validate
```

## libvirt and virsh

```bash
virsh version
virsh list --all
virsh dominfo <vm-name>
virsh start <vm-name>
virsh shutdown <vm-name>
virsh destroy <vm-name>        # Immediate power-off behavior
virsh autostart <vm-name>
virsh console <vm-name>
virsh dumpxml <vm-name>
virsh net-list --all
virsh pool-list --all
```

## QEMU Disk Images

```bash
qemu-img info disk.qcow2
qemu-img create -f qcow2 disk.qcow2 20G
qemu-img convert -f raw -O qcow2 source.img target.qcow2
qemu-img snapshot -l disk.qcow2
```

## Docker Images

```bash
docker pull alpine:3.22
docker image ls
docker image inspect alpine:3.22
docker build -t training/app:local .
docker image history training/app:local
docker image rm training/app:local
```

## Docker Containers

```bash
docker run --rm alpine:3.22 echo hello
docker run -d --name web -p 8080:80 nginx:stable-alpine
docker ps
docker ps -a
docker logs web
docker inspect web
docker stats --no-stream
docker top web
docker exec -it web sh
docker stop web
docker rm web
```

## Resource Limits

```bash
docker run --rm --memory 128m --cpus 0.5 alpine:3.22 sh -c 'echo limited'
docker inspect --format '{{json .HostConfig.Memory}}' <container>
docker stats --no-stream <container>
```

## Networks

```bash
docker network ls
docker network create training-net
docker network inspect training-net
docker network connect training-net <container>
docker network disconnect training-net <container>
docker network rm training-net
```

## Volumes

```bash
docker volume ls
docker volume create training-data
docker volume inspect training-data
docker run --rm -v training-data:/data alpine:3.22 sh -c 'date > /data/date.txt'
docker volume rm training-data
```

## Compose

```bash
docker compose up -d --build
docker compose ps
docker compose logs -f
docker compose exec <service> <command>
docker compose restart <service>
docker compose down
docker compose down -v
```

## Podman Equivalents

```bash
podman pull alpine:3.22
podman run --rm alpine:3.22 echo hello
podman ps -a
podman images
podman inspect <container>
podman logs <container>
podman stats --no-stream
podman build -t training/app:local .
podman rm -f <container>
```

## Cleanup Commands

```bash
docker container prune
docker image prune
docker network prune
docker volume prune
podman system prune
```

Prune commands remove unused resources. Review the prompt carefully before confirming.

## Basic Troubleshooting

```bash
docker ps -a
docker logs <container>
docker inspect <container>
docker port <container>
docker network inspect <network>
docker events --since 10m
journalctl -u docker --since '10 minutes ago'
journalctl -u libvirtd --since '10 minutes ago'
```

Service names differ by distribution and installation method.
