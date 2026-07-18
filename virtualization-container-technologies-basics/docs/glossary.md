# Glossary

## Bare Metal

A physical machine running an operating system directly, without a VM hypervisor layer for the workload.

## cgroups

Linux control groups. Kernel mechanisms for accounting for and limiting resources such as CPU, memory, and process count.

## Cloud-Init

A widely used system for initializing cloud or VM instances with metadata and user-provided configuration.

## Compose

A declarative YAML-based method for defining and running a multi-container application.

## Container

An isolated process environment created from a container image. Containers normally share the host kernel.

## Container Engine

A user-facing tool that manages images, containers, networks, and volumes. Docker Engine and Podman are common examples.

## Container Image

A packaged, typically immutable application filesystem and configuration used to create containers.

## Container Registry

A service for storing and distributing container images and related metadata.

## Container Runtime

Software responsible for creating and managing container processes. The term may refer to high-level runtimes such as containerd or low-level OCI runtimes such as runc.

## Copy-on-Write

A storage technique where shared data is reused until a modification requires a private copy.

## Digest

A content-derived cryptographic identifier for an image or manifest. Unlike a tag, a digest is immutable for the referenced content.

## Guest Operating System

The operating system running inside a virtual machine.

## Host Operating System

The operating system controlling the physical machine or providing the kernel used by containers.

## Hypervisor

The virtualization layer that creates and manages virtual machines and maps virtual hardware to physical resources.

## Image Layer

A filesystem change set that contributes to a container image.

## KVM

Kernel-based Virtual Machine. Linux kernel functionality that enables hardware-assisted virtualization.

## libvirt

An open-source toolkit and API for managing multiple virtualization platforms.

## Namespace

A Linux kernel isolation mechanism that gives processes a restricted view of resources such as process IDs, mounts, networks, hostnames, or users.

## OCI

Open Container Initiative. A standards body defining container image, runtime, and distribution specifications.

## Orchestrator

A system that coordinates workload placement, desired state, scaling, networking, and recovery across multiple hosts.

## Overlay Network

A logical network built over another network, commonly used to connect workloads across hosts.

## Pod

In Kubernetes, the smallest scheduling unit, containing one or more containers that share selected resources.

## Podman

A daemonless container engine with strong support for rootless workflows and Docker-compatible command patterns.

## QEMU

An open-source machine emulator and virtualizer. It is commonly combined with KVM for accelerated virtual machines.

## Rootless Container

A container managed without requiring the user to have root privileges on the host.

## runc

A low-level OCI-compatible runtime that creates and starts container processes according to an OCI runtime specification bundle.

## Snapshot

A point-in-time representation of VM or storage state. Snapshots are useful operational tools but are not automatically complete backups.

## Tag

A human-readable image reference such as `v1.2` or `stable`. Tags can be changed to point to different content.

## Type 1 Hypervisor

A virtualization layer that runs directly on hardware or as the primary host virtualization environment.

## Type 2 Hypervisor

A hypervisor application that runs on top of a general-purpose host operating system.

## Virtual Machine

A software-defined computer with virtual CPU, memory, storage, network devices, and a guest operating system.

## Virtual Network

A software-defined network connecting VMs or containers independently of dedicated physical interfaces.

## Virtual Disk

A file, logical volume, or remote block device presented to a VM as a disk.

## Writable Layer

The container-specific filesystem layer where runtime changes are stored. It is normally removed when the container is deleted.
