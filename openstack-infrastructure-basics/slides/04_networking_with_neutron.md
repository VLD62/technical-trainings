# Networking with Neutron

## Session 4

---

## Neutron Resources

- Network
- Subnet
- Port
- Router
- Floating IP
- Security group
- Trunk
- Load-balancer integration
- Network segment and provider attributes

A virtual NIC is represented by a Neutron port.

---

## Tenant and Provider Networks

**Tenant network**

- Created for a project
- Often uses an overlay such as VXLAN or Geneve
- Isolated from physical network details

**Provider network**

- Maps to physical connectivity
- Often uses flat or VLAN segmentation
- Requires coordinated physical switching and address management

---

## Common Segmentation Types

- Flat - one untagged provider segment
- VLAN - IEEE 802.1Q segmentation
- VXLAN - overlay over IP transport
- Geneve - extensible overlay, commonly used with OVN
- Local - limited to one host, mainly for special use cases

---

## Router and Floating IP Flow

```text
Instance fixed IP
      |
Tenant subnet
      |
Neutron router
      |
External provider network
      |
Floating IP and upstream network
```

A floating IP is usually one-to-one NAT associated with a port's fixed IP.

---

## North-South and East-West

- North-south: traffic entering or leaving the cloud workload environment
- East-west: traffic between workloads inside the cloud

Architecture choices determine whether traffic is centralized or distributed.

---

## Security Groups

Security groups are stateful virtual firewall policies applied to ports.

Good practice:

- Start with minimal ingress
- Restrict sources
- Separate application tiers
- Review IPv4 and IPv6 rules
- Remove obsolete rules
- Avoid using broad rules as a troubleshooting shortcut

---

## DHCP and Metadata

Instances commonly need:

- DHCP for network configuration
- Metadata or config-drive for cloud-init data
- DNS settings
- Default route

A booted instance without correct metadata or DHCP may appear like a compute failure.

---

## Open vSwitch Bridge Model

Common OVS bridge names in ML2/OVS deployments:

- `br-int` - integration bridge
- `br-tun` - overlay tunnel bridge in classic designs
- `br-ex` - external provider bridge

Exact bridge and flow design depends on the selected mechanism driver.

---

## OVN Model

OVN provides a distributed logical networking control plane backed by OVS.

Concepts include:

- Northbound database
- Southbound database
- Logical switches and routers
- Chassis
- Distributed flows

Do not mix troubleshooting assumptions from ML2/OVS agents with OVN without confirming the backend.

---

## End-to-End Troubleshooting

Trace the path:

1. Instance interface and route
2. Neutron port state
3. Security-group rules
4. DHCP and metadata
5. Local virtual switch
6. Overlay tunnel or VLAN
7. Router namespace or distributed router
8. External bridge and physical switch
9. Upstream gateway and return path

---

## Useful CLI Checks

```bash
openstack network list
openstack subnet list
openstack port list --server <server>
openstack router list
openstack floating ip list
openstack security group rule list <security-group>
openstack network agent list
```

Administrative agent commands may not be available to project users.
