# Lab 03 - Images, Flavors, and Instances

## Goal

Inspect available images and flavors, create a small instance, and trace its dependencies.

## 1. Set Names

```bash
export LAB_PREFIX="oslab-${USER}"
export LAB_SERVER="${LAB_PREFIX}-server"
export LAB_KEY="${LAB_PREFIX}-key"
```

## 2. Inspect Images and Flavors

```bash
openstack --os-cloud training image list
openstack --os-cloud training flavor list
```

Choose an approved image and a small flavor.

```bash
export IMAGE_ID=<approved-image-id>
export FLAVOR_ID=<small-flavor-id>
```

## 3. Create a Key Pair

```bash
openstack --os-cloud training keypair create "$LAB_KEY" > "${LAB_KEY}.pem"
chmod 600 "${LAB_KEY}.pem"
```

The private key is local sensitive data. Do not commit it.

## 4. Select a Network

```bash
openstack --os-cloud training network list
export NETWORK_ID=<tenant-network-id>
```

## 5. Create the Server

```bash
openstack --os-cloud training server create \
  --image "$IMAGE_ID" \
  --flavor "$FLAVOR_ID" \
  --network "$NETWORK_ID" \
  --key-name "$LAB_KEY" \
  --wait \
  "$LAB_SERVER"
```

## 6. Inspect Dependencies

```bash
openstack --os-cloud training server show "$LAB_SERVER"
openstack --os-cloud training port list --server "$LAB_SERVER"
```

With administrator access, also inspect compute service and hypervisor placement.

## 7. Optional Cloud-Init

Create a text file:

```yaml
#cloud-config
write_files:
  - path: /etc/training-message
    content: OpenStack training instance
runcmd:
  - [ sh, -c, 'date > /var/tmp/first-boot-date' ]
```

Create another server using `--user-data` and verify the result after login.

## 8. Cleanup

```bash
openstack --os-cloud training server delete --wait "$LAB_SERVER"
openstack --os-cloud training keypair delete "$LAB_KEY"
rm -f "${LAB_KEY}.pem"
```

## Review

- Which services participated in the build?
- What would a `No valid host` error suggest?
- Why can a server be `ACTIVE` while the application is unreachable?
