# Knowledge Check 1 - OpenStack Fundamentals

## Questions

1. What problem does OpenStack solve, and what type of cloud service model does it primarily provide?
2. What is the difference between the OpenStack control plane and data plane?
3. Which service authenticates users and publishes the service catalog?
4. Which services are primarily responsible for compute, images, networking, and block storage?
5. What is the difference between a project and a domain?
6. What is an availability zone, and what does it not guarantee by itself?
7. Why does Nova use Placement?
8. What is the difference between an image and an instance?
9. What is the difference between a tenant network and a provider network?
10. What are the roles of a router, floating IP, and security group?
11. Compare ephemeral storage and a Cinder volume.
12. Name three OpenStack services that can use Ceph RBD as a backend or storage mechanism.
13. What is the purpose of `clouds.yaml`?
14. Why should a reusable training repository contain placeholders rather than real endpoints or credentials?
15. What is the difference between an all-in-one and a multinode deployment?

## Suggested Answers

1. It provides programmable infrastructure services such as compute, networking, identity, images, and storage, commonly as Infrastructure as a Service.
2. The control plane stores state and makes lifecycle decisions; the data plane runs workloads and moves workload traffic or data.
3. Keystone.
4. Nova, Glance, Neutron, and Cinder.
5. A domain is a higher-level identity boundary; a project is the resource and quota boundary in which workloads are created.
6. It is an operator-defined failure or scheduling domain. Its name alone does not prove physical fault isolation.
7. Placement tracks resource-provider inventories, traits, allocations, and candidates used during scheduling.
8. An image is a reusable boot source; an instance is a running or stopped virtual machine created from an image or volume.
9. A tenant network is usually project-owned and isolated; a provider network maps more directly to operator-managed physical connectivity.
10. The router connects networks and performs L3 functions, a floating IP provides reachable address translation, and a security group filters allowed traffic at ports.
11. Ephemeral storage follows the server lifecycle; a Cinder volume is independently managed block storage that can persist beyond a server.
12. Typical examples include Glance, Nova ephemeral disks, and Cinder. Designs may also integrate other services.
13. It stores named cloud connection and authentication profiles for OpenStack clients and SDKs.
14. Public material must be reusable and must not disclose secrets, private topology, internal naming, or organization-specific access paths.
15. All-in-one places roles on one node for evaluation; multinode separates roles for scale, resilience, and operational realism.
