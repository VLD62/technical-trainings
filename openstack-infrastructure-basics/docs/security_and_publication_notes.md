# Security and Publication Notes

## 1. Credentials

Never publish:

- `passwords.yml`
- Real `clouds.yaml`
- OpenRC files with passwords or tokens
- Application-credential secrets
- Private keys
- Database or message-bus credentials
- Ceph keyrings
- Dashboard default passwords

Use placeholders such as `REPLACE_ME` only in example files.

## 2. Infrastructure Metadata

Remove or generalize:

- Internal DNS names
- Hostnames and inventory numbers
- Management IP addresses
- VLAN IDs tied to a real environment
- Internal project names
- Private repository and pipeline URLs
- Jump-host details
- Certificate subjects
- Monitoring endpoints

Use RFC documentation networks for examples.

## 3. Logs and Command Output

Logs may contain:

- Tokens
- Request bodies
- User and project identifiers
- IP addresses
- Image names
- Internal URLs
- Database connection strings

Sanitize before publishing.

## 4. Images and Screenshots

Review screenshots for:

- Browser address bars
- User names
- Project names
- Notifications
- Resource UUIDs
- IP addresses
- Company branding
- Confidentiality markings

Prefer recreated diagrams and terminal examples.

## 5. Least Privilege

- Use project-scoped accounts for labs
- Use read-only roles for health reports when possible
- Create short-lived application credentials for automation
- Avoid global administrator credentials in workstations and CI
- Separate operator, auditor, and automation identities

## 6. Network Security

- Use TLS for API endpoints
- Restrict management networks
- Protect message-bus and database ports
- Limit dashboard exposure
- Apply security groups and host firewalls
- Monitor certificate expiry

## 7. Image Security

- Use trusted sources
- Validate checksums or signatures
- Scan for vulnerabilities
- Remove embedded credentials
- Patch before publishing
- Record owner and lifecycle
- Retire obsolete images

## 8. Public Course Validation

Run:

```bash
make validate
```

The validator checks required files and known sensitive patterns. It is a safety net, not a replacement for human review.
