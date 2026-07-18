# Lab 01 - CLI and Authentication

## Goal

Configure the OpenStack CLI securely and inspect the authenticated scope and service catalog.

## 1. Install the Client

Use a virtual environment:

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install python-openstackclient
```

Your cloud may require service-specific client plugins.

## 2. Configure `clouds.yaml`

```bash
mkdir -p ~/.config/openstack
cp examples/clouds.yaml.example ~/.config/openstack/clouds.yaml
chmod 600 ~/.config/openstack/clouds.yaml
```

Edit the copied file. Do not modify or commit the repository example with real credentials.

## 3. Test Authentication

```bash
openstack --os-cloud training token issue
```

Record without secrets:

- Project ID
- User ID
- Token expiration time

Do not record the token value.

## 4. Inspect the Catalog

```bash
openstack --os-cloud training catalog list
openstack --os-cloud training endpoint list
```

Questions:

- Which regions exist?
- Which services have public and internal endpoints?
- Are any expected services absent?

## 5. Inspect Client Configuration

```bash
openstack --os-cloud training configuration show
```

Sanitize output before sharing.

## 6. Cleanup

No cloud resources are created in this lab.

## Review

- Why is `clouds.yaml` private?
- What is the difference between a token and a password?
- What does the service catalog provide?
