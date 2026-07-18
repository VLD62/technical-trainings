# Zabbix Deployment Notes

## Select a Supported Version

Before deployment:

1. Select a supported Zabbix server release.
2. Verify operating-system support.
3. Verify database and PHP requirements.
4. Verify proxy compatibility.
5. Verify Agent 2 compatibility.
6. Verify template requirements.
7. Verify the Kubernetes Helm chart branch when Kubernetes monitoring is included.
8. Review upgrade notes before changing an existing deployment.

The local examples use the Zabbix 7.0 LTS image line for training consistency. Production deployments should follow the current official lifecycle and compatibility information.

## Architecture Decisions

Document:

- Server deployment method
- Database engine and topology
- Frontend topology
- Proxy locations
- Active versus passive agent strategy
- Network zones and firewall rules
- TLS strategy
- Authentication strategy
- Notification integrations
- Retention policy
- Backup scope
- High-availability requirements
- Upgrade ownership

## Capacity Planning

Estimate:

- Hosts
- Enabled items
- New values per second
- Polling intervals
- Preprocessing volume
- Discovery volume
- Trigger and event rate
- History retention
- Trend retention
- Database growth
- Backup duration
- Network bandwidth
- Proxy buffer requirements

Perform a controlled load test when possible.

## Database Notes

Use:

- A dedicated Zabbix database and account
- Supported database versions
- Appropriate character set and collation
- Restricted network access
- Encrypted transport where required
- Tested backups
- Storage monitoring
- Slow-query monitoring
- Capacity alerts

Do not rely on housekeeping alone as a database strategy for a large environment.

## Network Notes

Common traffic:

| Source | Destination | Purpose |
|---|---|---|
| Server or proxy | Agent TCP 10050 | Passive checks |
| Agent | Server or proxy TCP 10051 | Active checks |
| Proxy | Server TCP 10051 | Proxy data |
| User | Frontend HTTPS | Web access |
| Server/frontend/proxy | Database | Configuration and monitoring data |
| Server | SMTP/webhook endpoint | Notifications |

Use explicit firewall rules and approved DNS names.

## Security Notes

Production baseline:

- HTTPS frontend
- TLS agent and proxy communication
- Strong authentication
- MFA for privileged users
- Least-privilege roles and host-group permissions
- Scoped API tokens
- Secret manager
- Audited emergency administrator account
- Restricted script execution
- Secure database account
- Protected backups
- Regular patching

## Agent Rollout

Standardize:

- Package source
- Agent 2 version
- Configuration path
- Service name
- Hostname strategy
- Active/passive strategy
- TLS mode
- Logging
- Include directory
- Plugin deployment
- Upgrade process
- Decommissioning

Automate rollout with a configuration-management tool where appropriate.

## Kubernetes Notes

Before installing the Helm chart:

- Check chart and server compatibility
- Review all rendered manifests
- Review Kubernetes RBAC
- Review image sources
- Check resource requests and limits
- Check service-account token handling
- Check network policies
- Check existing host agents and port conflicts
- Define discovery filters
- Define the external proxy-to-server connection
- Plan chart upgrades and rollback

## Alerting Notes

For each alert define:

- Condition
- Severity
- Owner
- Notification target
- Escalation delay
- Recovery behavior
- Maintenance behavior
- Runbook
- Expected acknowledgement time
- Review date

## Backup and Recovery

Back up:

- Database
- Server configuration
- Proxy configuration where required
- Frontend configuration
- Custom scripts
- TLS certificates and private keys
- PSKs
- External modules
- Integration configuration
- Version and topology documentation

Test:

- Database restore
- Configuration restore
- Credential recovery
- Frontend access
- Server start
- Proxy reconnection
- Agent data flow
- Notification delivery

## Upgrade Preparation

Before an upgrade:

- Read release and upgrade notes
- Verify database requirements
- Verify proxy and agent compatibility
- Back up the environment
- Test in a representative environment
- Measure database-upgrade duration
- Plan rollback
- Notify monitoring users
- Disable or adjust noisy actions where required
- Monitor logs during the upgrade
- Validate data collection and notifications afterwards
