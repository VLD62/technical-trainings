# OpenStack Networking Notes

## 1. Resource Model

- A **network** is a Layer-2 broadcast domain.
- A **subnet** defines addressing, gateway, DNS, and allocation pools.
- A **port** represents an attachment point and owns fixed IPs, MAC address, security groups, and binding data.
- A **router** connects subnets and can connect to an external network.
- A **floating IP** maps an external address to a fixed IP on a port.
- A **security group** is a stateful policy applied to ports.

## 2. Example Training Topology

Documentation-only addressing:

```text
Provider network: 203.0.113.0/24
  Upstream gateway: 203.0.113.1
  Floating pool:    203.0.113.100-203.0.113.150

Tenant network: 192.0.2.0/24
  Router gateway: 192.0.2.1
  Allocation pool: 192.0.2.20-192.0.2.200
```

These address ranges are reserved for documentation and should not be copied into a real environment without a deliberate network design.

## 3. Overlay Networks

VXLAN and Geneve carry tenant Layer-2 segments across an IP underlay.

The underlay must provide:

- IP reachability between participating nodes
- Sufficient MTU
- Stable latency and packet delivery
- Firewall allowance for the selected encapsulation

An overlay MTU problem often appears as partial connectivity: small packets work while larger packets fail.

## 4. Provider Networks

Provider networks expose physical network segments to OpenStack.

Coordinate:

- VLAN IDs
- Switch trunks and access ports
- MTU
- Gateways and routes
- DHCP ownership
- IP allocation pools
- Upstream firewall and return path

## 5. Security Groups

Security groups are stateful, but the implementation depends on the backend.

Troubleshooting checklist:

- Is the correct group attached to the correct port?
- Is ingress allowed from the actual source range?
- Is IPv6 handled separately?
- Are remote groups used as intended?
- Is the guest firewall also allowing traffic?
- Is return traffic routed through the same path?

## 6. Floating IPs

A floating IP requires:

- An external network
- A router with an external gateway
- A reachable fixed IP on a router-connected subnet
- A port association
- Security-group allowance
- Correct upstream routing and return path

## 7. OVS Inspection Concepts

Common read-only commands on authorized hosts:

```bash
ovs-vsctl show
ovs-vsctl list-br
ovs-ofctl dump-flows br-int
ip link show
ip route show
```

Flow commands may be large and backend-specific. Capture only what is required and sanitize addresses before sharing.

## 8. OVN Inspection Concepts

Common tools include:

```bash
ovn-nbctl show
ovn-sbctl show
ovn-sbctl list chassis
ovs-vsctl show
```

Access to OVN databases is an administrative operation.

## 9. Troubleshooting Decision Tree

```text
Can the instance reach its gateway?
  |-- no -> guest config, port state, security group, local switching, DHCP
  |
  +-- yes -> can router reach external gateway?
             |-- no -> router, namespace or OVN flow, provider bridge, physical network
             |
             +-- yes -> floating IP, upstream ACL, route, NAT, return path
```

## 10. MTU

Account for encapsulation overhead.

Validate:

- Physical-interface MTU
- Bridge MTU
- Overlay MTU
- DHCP-advertised MTU
- Guest-interface MTU
- Path MTU through external networks
