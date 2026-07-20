# Session 6 — Microsoft Azure Fundamentals

## Learning Objectives

- Understand Azure identity and resource hierarchy
- Recognize Azure core services
- Explain Azure regions, availability zones, and resource organization
- Apply Azure governance and cost-management concepts

## Identity and Resource Hierarchy

- Microsoft Entra ID provides identity and directory capabilities
- A tenant is an identity boundary
- Management groups organize subscriptions
- Subscriptions are billing, quota, and management boundaries
- Resource groups contain related resources with a shared lifecycle
- Azure Resource Manager is the management plane
- Azure RBAC grants role-based permissions at scopes in the hierarchy

## Global Infrastructure

- Azure Region: geographic deployment area
- Availability Zone: isolated group of datacenters inside a supported region
- Region pairs and geographies are relevant to some services and policies
- Service support differs by region and zone

## Identity

- Users and groups come from Microsoft Entra ID
- Service principals represent applications
- Managed identities allow Azure resources to access services without embedded credentials
- Azure RBAC controls resource actions
- Privileged Identity Management can support just-in-time privileged access

## Networking

- Azure Virtual Network provides isolated networking
- Subnets segment address ranges
- Network Security Groups filter traffic
- User-defined routes customize routing
- Azure Load Balancer provides layer-4 balancing
- Application Gateway provides application delivery and web features
- Azure Front Door supports global HTTP delivery
- Private Link provides private access to supported services
- VPN Gateway and ExpressRoute connect external networks
- Azure DNS provides DNS hosting

## Core Services

| Category | Representative services |
|---|---|
| Compute | Azure Virtual Machines, Virtual Machine Scale Sets, Azure Functions, App Service |
| Containers | Azure Kubernetes Service, Azure Container Apps, Azure Container Registry |
| Storage | Azure Blob Storage, Managed Disks, Azure Files, archive access tiers |
| Databases | Azure SQL Database, Azure Database services, Cosmos DB, Azure Cache for Redis, Synapse Analytics |
| Integration | Service Bus, Event Grid, Event Hubs, Logic Apps |
| Observability | Azure Monitor, Log Analytics, Application Insights, Activity Log |
| Security | Key Vault, Defender for Cloud, Microsoft Sentinel, DDoS Protection, Web Application Firewall |
| Infrastructure as Code | ARM templates, Bicep, Terraform support |

## Governance

- Management groups and subscriptions establish scope
- Azure Policy evaluates or enforces resource rules
- Resource locks protect against accidental deletion or modification
- Tags support ownership and cost allocation
- Landing zones provide reusable governance and platform foundations

## Cost Concepts

- Pay-as-you-go pricing
- Reservations and savings plans where applicable
- Spot Virtual Machines
- Storage access tiers
- Data transfer charges
- Azure Cost Management, budgets, and exports
- Azure Advisor recommendations

## Common Architecture Pattern

- Azure DNS or Front Door for global entry
- Application Gateway or Load Balancer
- Application instances across availability zones
- Azure SQL with an appropriate availability configuration
- Blob Storage for static content
- Managed identities and Key Vault
- Azure Monitor and centralized Log Analytics

## Azure Review Questions

- Is the tenant and subscription boundary appropriate?
- Does each resource group have a clear lifecycle?
- Are managed identities used?
- Are Azure Policy and diagnostic settings applied?
- Is public access disabled where private access is possible?
- Are budget and ownership tags enforced?
