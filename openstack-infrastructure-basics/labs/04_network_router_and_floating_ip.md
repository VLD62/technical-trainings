# Lab 04 - Network, Router, and Floating IP

## Goal

Create an isolated tenant network, connect it to an external network, launch an instance, and trace the network path.

## 1. Set Names

```bash
export LAB_PREFIX="oslab-${USER}"
export LAB_NET="${LAB_PREFIX}-net"
export LAB_SUBNET="${LAB_PREFIX}-subnet"
export LAB_ROUTER="${LAB_PREFIX}-router"
export LAB_SG="${LAB_PREFIX}-sg"
```

## 2. Create Network and Subnet

```bash
openstack --os-cloud training network create "$LAB_NET"

openstack --os-cloud training subnet create \
  --network "$LAB_NET" \
  --subnet-range 192.0.2.0/24 \
  --allocation-pool start=192.0.2.20,end=192.0.2.200 \
  --gateway 192.0.2.1 \
  --dns-nameserver 1.1.1.1 \
  "$LAB_SUBNET"
```

Change the addressing if it conflicts with cloud policy or routing.

## 3. Create Router

```bash
openstack --os-cloud training router create "$LAB_ROUTER"
openstack --os-cloud training router add subnet "$LAB_ROUTER" "$LAB_SUBNET"
```

Select the authorized external network:

```bash
openstack --os-cloud training network list --external
export EXTERNAL_NETWORK=<external-network-id>
openstack --os-cloud training router set --external-gateway "$EXTERNAL_NETWORK" "$LAB_ROUTER"
```

## 4. Create Security Group

```bash
openstack --os-cloud training security group create "$LAB_SG"
openstack --os-cloud training security group rule create --protocol icmp "$LAB_SG"
openstack --os-cloud training security group rule create \
  --protocol tcp --dst-port 22 \
  --remote-ip <trusted-source-cidr> \
  "$LAB_SG"
```

Do not use `0.0.0.0/0` for SSH unless the training environment explicitly requires and protects it.

## 5. Launch Instance

Use the approved image, flavor, and key pair from Lab 03:

```bash
openstack --os-cloud training server create \
  --image <image-id> \
  --flavor <flavor-id> \
  --network "$LAB_NET" \
  --security-group "$LAB_SG" \
  --key-name <key-name> \
  --wait \
  "${LAB_PREFIX}-net-server"
```

## 6. Allocate Floating IP

```bash
FIP=$(openstack --os-cloud training floating ip create \
  "$EXTERNAL_NETWORK" -f value -c floating_ip_address)

openstack --os-cloud training server add floating ip \
  "${LAB_PREFIX}-net-server" "$FIP"

echo "$FIP"
```

## 7. Trace the Path

```bash
openstack --os-cloud training port list --server "${LAB_PREFIX}-net-server"
openstack --os-cloud training router show "$LAB_ROUTER"
openstack --os-cloud training floating ip list --floating-ip-address "$FIP"
openstack --os-cloud training security group rule list "$LAB_SG"
```

## 8. Cleanup

```bash
openstack --os-cloud training server remove floating ip "${LAB_PREFIX}-net-server" "$FIP" || true
openstack --os-cloud training server delete --wait "${LAB_PREFIX}-net-server"
openstack --os-cloud training floating ip delete "$FIP"
openstack --os-cloud training router unset --external-gateway "$LAB_ROUTER"
openstack --os-cloud training router remove subnet "$LAB_ROUTER" "$LAB_SUBNET"
openstack --os-cloud training router delete "$LAB_ROUTER"
openstack --os-cloud training subnet delete "$LAB_SUBNET"
openstack --os-cloud training network delete "$LAB_NET"
openstack --os-cloud training security group delete "$LAB_SG"
```

## Review

- Which address is fixed and which is floating?
- Where is NAT performed?
- Which return-path failures could break the connection?
