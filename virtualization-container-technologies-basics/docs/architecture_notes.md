# Architecture Notes

## 1. Bare-Metal Host

```text
Application
    |
Host Operating System
    |
Physical CPU, memory, storage, and network
```

The operating system owns the hardware directly. This model is simple and can provide predictable performance, but the whole machine is the workload boundary.

## 2. Type 1 Virtualization

```text
VM A                VM B
App                 App
Guest OS            Guest OS
   \                  /
       Hypervisor
           |
Physical Infrastructure
```

The virtualization layer controls physical resources and presents virtual hardware to each guest.

## 3. Type 2 Virtualization

```text
VM A                VM B
Guest OS            Guest OS
   \                  /
Hosted Hypervisor Application
           |
Host Operating System
           |
Physical Infrastructure
```

The host operating system remains an additional layer between the hypervisor application and the hardware.

## 4. Linux Virtualization Stack

```text
virsh / management application
             |
          libvirt
             |
        QEMU process
             |
       KVM kernel API
             |
 Hardware virtualization extensions
```

- QEMU can emulate a complete machine.
- KVM accelerates supported guests through hardware virtualization.
- libvirt provides management abstractions and APIs.

## 5. Container Runtime Stack

```text
Docker CLI / Podman / Kubernetes
               |
Container engine or high-level runtime
               |
containerd / CRI-O where applicable
               |
OCI runtime such as runc or crun
               |
Linux namespaces, cgroups, security controls
               |
Host kernel
```

The exact implementation differs by platform. The important distinction is between the user-facing management layer and the lower-level process-creation layer.

## 6. Container Image Flow

```text
Dockerfile or Containerfile
            |
          Build
            |
     Local OCI image
            |
          Push
            |
        Registry
            |
          Pull
            |
         Runtime
            |
        Container
```

An image is a package. A container is a running or stopped instance created from that package.

## 7. Hybrid Infrastructure

```text
Physical or Cloud Infrastructure
               |
       Hypervisor / IaaS
               |
         Virtual Machines
               |
     Container Runtime or Cluster
               |
      Containerized Applications
```

This is a common architecture because VMs and containers provide boundaries at different layers.

## 8. Control and Data Planes

Management systems are often divided into:

- **Control plane** - stores desired state and makes scheduling or lifecycle decisions
- **Data plane** - runs the actual workloads and handles application traffic

This distinction appears in virtualization platforms, software-defined networking, storage systems, and container orchestrators.
