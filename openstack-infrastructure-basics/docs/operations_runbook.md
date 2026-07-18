# OpenStack Operations Runbook

## 1. Purpose

Provide a safe, repeatable sequence for triaging OpenStack incidents and collecting evidence before making changes.

## 2. Safety Boundary

This runbook starts with read-only commands. Any restart, failover, reconfiguration, database operation, queue reset, forced detach, or resource deletion requires a separate approved procedure.

## 3. Record Context

Capture:

```text
Timestamp and timezone:
Cloud and region:
Project:
Affected user or automation:
Affected service:
Resource IDs:
First observed time:
Recent changes:
User-visible error:
Request ID:
```

## 4. Client and Authentication

```bash
openstack --os-cloud <cloud> configuration show
openstack --os-cloud <cloud> token issue
openstack --os-cloud <cloud> catalog list
openstack --os-cloud <cloud> endpoint list
```

Do not paste password fields into tickets or chat.

## 5. Scope the Impact

Ask:

- Can another user reproduce it?
- Does another project work?
- Does another region work?
- Are existing resources healthy?
- Are only create or update operations failing?
- Is one availability zone affected?

## 6. Compute Checks

```bash
openstack --os-cloud <cloud> compute service list
openstack --os-cloud <cloud> hypervisor list
openstack --os-cloud <cloud> server show <server-id>
openstack --os-cloud <cloud> port list --server <server-id>
openstack --os-cloud <cloud> volume attachment list --server <server-id>
```

Administrative commands depend on role and policy.

## 7. Network Checks

```bash
openstack --os-cloud <cloud> network list
openstack --os-cloud <cloud> subnet list
openstack --os-cloud <cloud> router list
openstack --os-cloud <cloud> floating ip list
openstack --os-cloud <cloud> security group rule list <security-group-id>
openstack --os-cloud <cloud> network agent list
```

For OVN, agent output may not represent the complete backend state.

## 8. Storage Checks

```bash
openstack --os-cloud <cloud> volume list --long
openstack --os-cloud <cloud> volume service list
openstack --os-cloud <cloud> volume show <volume-id>
openstack --os-cloud <cloud> volume snapshot list
```

Correlate OpenStack state with backend health.

## 9. Controller Checks

On authorized Kolla hosts:

```bash
sudo docker ps --format 'table {{.Names}}\t{{.Status}}'
sudo docker logs --since 15m <container>
df -h
df -i
free -h
timedatectl
journalctl -p warning --since '30 minutes ago'
```

Use Podman commands if that is the deployed runtime.

## 10. Shared Dependencies

Validate:

- Database cluster membership and readiness
- Message-bus membership, alarms, and partitions
- Memcached reachability
- Virtual IP ownership
- HAProxy backend health
- DNS and certificate validity
- Disk usage and time synchronization

Use deployment-specific procedures and credentials.

## 11. Log Correlation

Search by:

- Request ID
- Resource UUID
- User or project ID
- Timestamp
- Error class

Sanitize tokens, passwords, addresses, and customer data before sharing.

## 12. Escalation Criteria

Escalate when:

- Multiple services or projects are affected
- Data integrity may be at risk
- Shared database, message bus, storage, or network infrastructure is degraded
- A destructive recovery action may be required
- The failure exceeds the team's support boundary

## 13. Closure

Document:

- Root cause
- Corrective action
- Validation performed
- Cleanup performed
- Monitoring or runbook improvement
- Follow-up owner and date
