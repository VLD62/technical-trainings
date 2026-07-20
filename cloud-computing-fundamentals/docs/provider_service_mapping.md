# Provider Service Mapping

Service mapping is approximate. Products that appear in the same row can differ significantly in architecture, limits, pricing, security controls, regional availability, and operational responsibility.

## Governance and Identity

| Capability | AWS | Microsoft Azure | Google Cloud | OCI |
|---|---|---|---|---|
| Top organizational boundary | Organization | Tenant / management group hierarchy | Organization | Tenancy |
| Workload isolation unit | Account | Subscription | Project | Compartment, with tenancy-level boundaries |
| Grouping below top level | Organizational unit | Management group / resource group | Folder | Compartment hierarchy |
| Human and workload access | IAM, IAM Identity Center, roles | Microsoft Entra ID, Azure RBAC, managed identities | Cloud IAM, service accounts, federation | OCI IAM, policies, dynamic groups, instance principals |
| Policy guardrails | Service Control Policies, Config rules | Azure Policy | Organization Policy | IAM policies, Security Zones |
| Audit activity | CloudTrail | Activity Log | Cloud Audit Logs | Audit |

## Compute and Application Platforms

| Capability | AWS | Microsoft Azure | Google Cloud | OCI |
|---|---|---|---|---|
| Virtual machines | Amazon EC2 | Azure Virtual Machines | Compute Engine | Compute |
| Autoscaling VMs | EC2 Auto Scaling | Virtual Machine Scale Sets | Managed instance groups | Instance pools and autoscaling |
| Managed application platform | Elastic Beanstalk / App Runner | App Service | App Engine | Application-oriented services vary by workload |
| Serverless functions | AWS Lambda | Azure Functions | Cloud Run functions | OCI Functions |
| Serverless containers | AWS Fargate / App Runner | Azure Container Apps | Cloud Run | Container Instances |
| Managed Kubernetes | Amazon EKS | Azure Kubernetes Service | Google Kubernetes Engine | Oracle Kubernetes Engine |
| Container registry | Amazon ECR | Azure Container Registry | Artifact Registry | Container Registry / Artifact Registry capabilities |

## Storage and Databases

| Capability | AWS | Microsoft Azure | Google Cloud | OCI |
|---|---|---|---|---|
| Object storage | Amazon S3 | Azure Blob Storage | Cloud Storage | Object Storage |
| Block storage | Amazon EBS | Managed Disks | Persistent Disk / Hyperdisk | Block Volumes |
| Shared file storage | Amazon EFS / FSx | Azure Files / managed file services | Filestore | File Storage |
| Archive storage | S3 archival classes | Blob archive tier | Archive storage class | Archive Storage |
| Managed relational DB | Amazon RDS / Aurora | Azure SQL and managed database services | Cloud SQL / AlloyDB | Base Database Service / Autonomous Database |
| Globally distributed relational | Aurora Global Database patterns | Azure Cosmos DB for NoSQL and selected relational patterns differ | Spanner | Globally distributed options depend on database service |
| NoSQL key/document | DynamoDB / DocumentDB | Cosmos DB | Firestore / Bigtable | NoSQL Database |
| Data warehouse | Redshift | Synapse Analytics | BigQuery | Autonomous Data Warehouse |
| Managed cache | ElastiCache | Azure Cache for Redis | Memorystore | Cache services |

## Networking

| Capability | AWS | Microsoft Azure | Google Cloud | OCI |
|---|---|---|---|---|
| Virtual network | Amazon VPC | Azure Virtual Network | VPC network | Virtual Cloud Network |
| Resource firewall | Security Groups | Network Security Groups | VPC firewall rules / firewall policies | Network Security Groups |
| Subnet firewall | Network ACLs | Network Security Groups can associate with subnets | Hierarchical and VPC firewall controls | Security Lists |
| Private service access | VPC endpoints / PrivateLink | Private Link / service endpoints | Private Service Connect / Private Google Access | Service Gateway / private endpoints by service |
| Managed DNS | Route 53 | Azure DNS | Cloud DNS | DNS |
| Content delivery | CloudFront | Front Door / CDN | Cloud CDN / Media CDN | OCI CDN capabilities through relevant services |
| Hybrid private connectivity | Direct Connect | ExpressRoute | Cloud Interconnect | FastConnect |
| VPN | Site-to-Site VPN | VPN Gateway | Cloud VPN | Site-to-Site VPN through DRG |

## Messaging, Operations, and Security

| Capability | AWS | Microsoft Azure | Google Cloud | OCI |
|---|---|---|---|---|
| Queue | SQS | Service Bus queues / Storage Queues | Pub/Sub patterns | Queue |
| Publish/subscribe | SNS / EventBridge | Service Bus topics / Event Grid | Pub/Sub / Eventarc | Notifications / Events / Streaming |
| Monitoring | CloudWatch | Azure Monitor | Cloud Monitoring | Monitoring |
| Central logging | CloudWatch Logs | Log Analytics | Cloud Logging | Logging |
| Secrets | Secrets Manager / Parameter Store | Key Vault | Secret Manager | Vault Secrets |
| Key management | KMS / CloudHSM | Key Vault / Managed HSM | Cloud KMS / Cloud HSM | Vault / Key Management |
| Security posture | Security Hub | Defender for Cloud | Security Command Center | Cloud Guard |
| Web application firewall | AWS WAF | Azure Web Application Firewall | Cloud Armor | Web Application Firewall |
| IaC native option | CloudFormation / CDK | ARM / Bicep | Infrastructure Manager / Config Connector | Resource Manager |

## Selection Guidance

Do not select a service from this table alone. Evaluate:

- Functional fit and service limits
- Data model and consistency
- Security features and identity integration
- Regional availability
- Availability and recovery behavior
- Operational effort
- Observability and support
- Pricing and data transfer
- Existing team skills
- Migration and exit complexity
