# Session 5 — AWS Fundamentals

## Learning Objectives

- Understand AWS account and organization structure
- Recognize core AWS infrastructure and services
- Map AWS products to provider-neutral capabilities
- Apply AWS-specific security and cost concepts

## Resource and Governance Structure

- AWS Organizations groups multiple AWS accounts
- Organizational units can apply structure and policy
- Service Control Policies define permission guardrails; they do not grant permissions
- Separate accounts are commonly used for workload and environment isolation
- IAM controls identities and permissions within the relevant scope

## Global Infrastructure

- AWS Region: geographic area
- Availability Zone: isolated infrastructure location inside a Region
- Edge locations support services such as content delivery and DNS
- Some services are regional, zonal, or global

Always verify regional service availability.

## Identity

- IAM users are long-term identities and should be minimized
- IAM roles provide assumable permissions
- Identity federation integrates workforce identity
- Instance profiles and service roles provide workload access
- Policies can be identity-based, resource-based, permission boundaries, or organization guardrails

Prefer short-lived role credentials over static access keys.

## Networking

- Amazon VPC provides isolated virtual networking
- Subnets are associated with Availability Zones
- Route tables control forwarding
- Internet Gateway supports public connectivity
- NAT Gateway supports outbound connectivity from private subnets
- Security Groups are stateful resource-level controls
- Network ACLs are stateless subnet-level controls
- Elastic Load Balancing distributes traffic
- Route 53 provides DNS and routing features

## Core Services

| Category | Representative services |
|---|---|
| Compute | Amazon EC2, Auto Scaling, AWS Lambda, AWS Fargate |
| Containers | Amazon ECS, Amazon EKS, Amazon ECR |
| Storage | Amazon S3, Amazon EBS, Amazon EFS, S3 Glacier classes |
| Databases | Amazon RDS, Amazon Aurora, DynamoDB, ElastiCache, Redshift |
| Integration | Amazon SQS, Amazon SNS, EventBridge, Kinesis |
| Observability | Amazon CloudWatch, AWS CloudTrail, AWS Config, X-Ray |
| Security | AWS KMS, Secrets Manager, GuardDuty, Security Hub, WAF |
| Infrastructure as Code | AWS CloudFormation, AWS CDK |

## AWS Shared Responsibility Examples

With EC2, the customer manages guest OS configuration and patching. With a managed database, the provider manages more infrastructure and database platform tasks, while the customer remains responsible for access, schemas, queries, data, and configuration.

## Cost Concepts

- On-Demand pricing
- Savings Plans and reserved commitments
- Spot capacity
- Data transfer and egress
- Storage classes and lifecycle policies
- Cost allocation tags
- AWS Budgets and Cost Explorer

## Common Architecture Pattern

- Route 53 for DNS
- CloudFront for content delivery
- Application Load Balancer across multiple Availability Zones
- Auto Scaling group of stateless application instances
- Amazon RDS Multi-AZ database
- Amazon S3 for static assets and backups
- CloudWatch and CloudTrail for operational and audit visibility

## AWS Review Questions

- Is the workload isolated in the correct account?
- Are roles used instead of static keys?
- Are public and private subnets intentional?
- Is the database failure model understood?
- Are audit logs delivered to a protected destination?
- Are budgets and cost allocation tags configured?
