# Security and Production Hardening Notes

The included Docker Compose stack is intentionally simple and designed for local training.

## Credentials

- Do not commit `.env`.
- Replace all example passwords.
- Use a secret manager in production.
- Rotate credentials when exposure is suspected.

## Network Access

- Do not expose Prometheus, Grafana, or Node Exporter directly to the public internet.
- Restrict Node Exporter access to Prometheus.
- Restrict the Prometheus lifecycle endpoint.
- Use firewalls, security groups, or network policies.

## Authentication and TLS

- Put services behind an approved reverse proxy or identity-aware access layer.
- Use TLS for browser and API access.
- Configure Grafana users, teams, folders, and permissions.
- Protect Prometheus API and administrative endpoints.

## Metric Content

Metrics and labels can reveal:

- Hostnames
- Software versions
- File paths
- Environment names
- Service topology
- Customer or tenant identifiers

Review custom metrics before publication.

Never use high-cardinality or sensitive label values such as:

- User IDs
- Email addresses
- Request IDs
- Tokens
- Full URLs containing secrets
- Personal data

## Container Images

- Pin supported versions.
- Review security advisories.
- Rebuild and redeploy regularly.
- Test upgrades in a non-production environment.

## Persistent Data

- Define backup and restore requirements.
- Encrypt storage where required.
- Protect snapshots and backup media.
- Test recovery procedures.

## Alert Destinations

- Use test destinations during training.
- Do not commit webhook URLs, API tokens, or SMTP passwords.
- Route alerts according to ownership and severity.
