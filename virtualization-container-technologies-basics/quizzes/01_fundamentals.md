# Quiz 01 - Fundamentals

## Questions

1. What is the main workload boundary in a virtual machine?
2. What is the main workload boundary in a normal Linux process container?
3. What is the difference between a container image and a container?
4. What problem do Linux namespaces solve?
5. What problem do cgroups solve?
6. What is the role of a hypervisor?
7. How do Type 1 and Type 2 hypervisors differ?
8. What is the relationship between QEMU, KVM, and libvirt?
9. What is the difference between an image tag and an image digest?
10. Why is a container registry needed?
11. What is the role of an OCI runtime such as runc?
12. Why can a container usually start faster than a VM?
13. Why can a VM run a different operating-system kernel from the host?
14. Why is persistent data usually kept outside the container writable layer?
15. Why are hybrid VM-plus-container architectures common?

## Answers

<details>
<summary>Show answers</summary>

1. Virtual hardware plus a complete guest operating system.
2. An isolated process environment sharing the host kernel.
3. An image is a package; a container is a runtime instance created from it.
4. They limit which resources and identifiers a process can see.
5. They account for and limit resources such as CPU and memory.
6. It creates and manages VMs and maps virtual resources to physical resources.
7. Type 1 is the primary virtualization layer on the host; Type 2 runs as an application on a host OS.
8. QEMU provides machine emulation and devices, KVM provides Linux hardware acceleration, and libvirt provides management APIs and tools.
9. A tag is a movable name; a digest is an immutable content identifier.
10. To store, organize, authenticate, and distribute images.
11. To create and start container processes according to the OCI runtime specification.
12. It starts an application process without booting a full guest OS.
13. The guest kernel runs inside virtual hardware provided by the hypervisor.
14. The writable layer is tied to the container lifecycle and is normally removed with the container.
15. VMs provide infrastructure isolation while containers provide application packaging and lifecycle efficiency.

</details>
