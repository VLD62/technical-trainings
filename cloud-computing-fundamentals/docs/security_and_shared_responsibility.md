# Security and Shared Responsibility

## Responsibility Changes by Service Model

| Area | On-premises | IaaS | PaaS / managed service | SaaS |
|---|---|---|---|---|
| Facilities and physical hardware | Customer | Provider | Provider | Provider |
| Hypervisor and core platform | Customer | Provider | Provider | Provider |
| Guest operating system | Customer | Customer | Mostly provider | Provider |
| Runtime and middleware | Customer | Customer | Shared / mostly provider | Provider |
| Application code | Customer | Customer | Customer | Provider |
| Identity and access configuration | Customer | Customer | Customer | Customer |
| Data classification and usage | Customer | Customer | Customer | Customer |
| Endpoint and user-device security | Customer | Customer | Customer | Customer |
| Workload configuration | Customer | Customer | Customer | Shared, depending on product |
| Legal and compliance decisions | Customer | Customer | Customer | Customer |

The exact boundary varies by service. Always consult the service-specific documentation.

## Minimum Cloud Security Baseline

### Identity

- Federated workforce identity
- MFA for all users, stronger controls for administrators
- No shared accounts
- Short-lived credentials
- Workload identities instead of embedded keys
- Regular access reviews
- Separate administrative and daily-use roles

### Resource Organization

- Separate production from non-production
- Use hierarchy for policy and billing
- Apply mandatory ownership and environment metadata
- Restrict approved regions and services where necessary

### Network

- Default-deny inbound exposure
- Private subnets and service endpoints where practical
- Controlled egress
- Central DNS and certificate management
- Flow logging for important networks
- Web application firewall and DDoS controls for public services

### Data

- Encryption at rest and in transit
- Documented key-management ownership
- Secret manager for application secrets
- Backup isolation and restore testing
- Retention and deletion policies
- Data-loss prevention where required

### Logging and Detection

- Administrative audit logs enabled centrally
- Security logs protected from workload administrators
- Alerts for privileged changes and suspicious access
- Time synchronization and retention standards
- Integration with incident-response processes

### Workload Security

- Hardened images
- Patch and vulnerability process
- Dependency and container scanning
- Minimal runtime privileges
- Secure deployment pipeline
- Signed or verified artifacts where appropriate

## Shared Responsibility Exercise

For each workload component, answer:

1. Which provider service model is used?
2. Which layers are provider-managed?
3. Which configuration remains customer-controlled?
4. Who owns patching?
5. Who owns access control?
6. Who owns backup configuration and restore testing?
7. Who monitors service health and incidents?
8. What evidence demonstrates that controls operate correctly?

## Common Misunderstandings

- Managed service does not mean no configuration risk
- Encryption by default does not define correct key governance
- Private networking does not replace identity controls
- Provider compliance certification does not certify the customer's workload
- High availability does not replace backup
- Cloud-native security tools do not remove the need for ownership and response procedures
