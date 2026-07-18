---
marp: true
paginate: true
title: Zabbix Security and Access Control
---

# Security and Access Control

## Users, Authentication, Encryption, and Secrets

---

# Security Objectives

A secure monitoring platform should:

- Protect monitoring data
- Prevent unauthorized configuration changes
- Limit access to credentials
- Preserve auditability
- Protect agent, proxy, server, and database communication
- Maintain emergency administrative access
- Avoid becoming a path into monitored systems

Monitoring platforms are high-value administrative systems.

---

# Access-Control Layers

Zabbix access control includes:

- Users
- User groups
- User roles
- Host-group permissions
- Template-group permissions
- API tokens
- Media access
- Action and script permissions
- Authentication method
- MFA

A role controls capabilities. Group permissions control access to monitored objects.

---

# Least Privilege

Examples:

- Operators can acknowledge problems but cannot change global settings
- Application teams can see only their host groups
- Template maintainers can edit selected template groups
- Automation uses scoped API tokens
- Emergency administrators are limited and audited
- Script execution is restricted to approved roles

Avoid assigning broad administrator access for convenience.

---

# Authentication Options

Zabbix supports several authentication methods:

- Internal authentication
- LDAP
- SAML
- HTTP or web-server authentication
- MFA as an additional factor

Authentication can be configured globally and refined for user groups.

---

# LDAP and SAML

External identity integration can provide:

- Centralized account lifecycle
- Group-based provisioning
- Consistent password policy
- Reduced local account administration
- Just-in-time provisioning where supported

Production requirements:

- Use encrypted transport
- Store bind credentials securely
- Define group mappings carefully
- Test deprovisioning
- Retain a controlled emergency login path

---

# MFA

MFA reduces risk from stolen passwords.

Apply MFA especially to:

- Super administrators
- Administrators
- Users with script execution
- Users with API-token management
- Users who can change authentication
- Remote-access users

Test recovery and reset procedures before enforcing MFA broadly.

---

# Emergency Administrator Access

Keep a small, controlled emergency path that:

- Uses internal authentication
- Has a strong unique password
- Is stored in an approved secret vault
- Is tested periodically
- Is monitored and audited
- Is not used for daily administration

Do not leave a default password as an emergency strategy.

---

# API Tokens

For automation:

- Prefer API tokens over stored interactive passwords
- Scope the user role and object permissions
- Use one token per integration
- Set expiration where supported
- Rotate tokens
- Store tokens in a secret manager
- Revoke unused tokens
- Audit token usage

Never place a real token in a script committed to Git.

---

# Agent and Proxy Encryption

Use TLS between:

- Agent and server or proxy
- Proxy and server
- Server and database where required
- User and frontend
- Webhooks and external services

Zabbix component encryption options include:

- Pre-shared keys
- Certificates

Verify that both endpoints use matching settings.

---

# Certificate Validation

For certificate-based communication:

- Trust only approved certificate authorities
- Verify certificate validity
- Restrict accepted issuer and subject where appropriate
- Protect private keys
- Rotate certificates before expiration
- Monitor certificate expiration
- Document the renewal process

A trusted certificate alone may not prove that the peer is the intended Zabbix component.

---

# Secret Management

Secrets can include:

- Database passwords
- LDAP bind passwords
- SMTP credentials
- API tokens
- Webhook secrets
- TLS private keys
- PSKs
- Cloud credentials
- Kubernetes service-account tokens

Use environment-specific secret stores and do not expose secrets in screenshots or documentation.

---

# Frontend Security

Production frontend controls:

- HTTPS only
- Restricted network exposure
- Secure cookies
- Supported web server and PHP versions
- Strong authentication
- MFA
- Session timeout policy
- Security headers
- Reverse-proxy hardening
- Rate limiting where appropriate

Do not expose an unprotected lab frontend to the internet.

---

# Database Security

- Use a dedicated database account
- Grant only required permissions
- Restrict network access
- Encrypt connections where required
- Protect backups
- Monitor failed connections
- Separate database administration from Zabbix administration
- Keep credentials out of readable process arguments and repositories

---

# Audit and Change Control

Review:

- User and role changes
- Authentication changes
- Template changes
- Trigger threshold changes
- Action changes
- Script changes
- API token creation
- Proxy and agent encryption changes
- Maintenance creation
- Housekeeping and retention changes

Monitoring changes can alter what incidents are detected.

---

# Security Review Checklist

- Default password changed
- MFA enabled for privileged users
- Emergency account secured
- TLS enabled
- Secrets stored outside Git
- API tokens scoped and rotated
- Host-group permissions reviewed
- Script execution restricted
- Frontend not publicly exposed
- Database access restricted
- Audit logs reviewed
- Backup access protected

---

# Key Takeaways

- Authentication and authorization are different controls
- Roles define capabilities
- Group permissions define object access
- TLS protects component communication
- Secrets must stay out of repositories and screenshots
- Emergency access should be secure, tested, and audited
