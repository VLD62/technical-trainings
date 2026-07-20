# Cloud Computing: Fundamentals

Welcome to the Cloud Computing: Fundamentals course.

This reusable, vendor-neutral training introduces the principles, architecture, security, operations, and economics of cloud computing. It includes practical comparisons of Amazon Web Services (AWS), Microsoft Azure, Google Cloud, and Oracle Cloud Infrastructure (OCI), together with private, hybrid, and multi-cloud concepts.

> This is an independent training resource. It is not an official or endorsed course from AWS, Microsoft, Google, Oracle, or the OpenInfra Foundation.

---

## Course Objectives

By the end of this course participants will be able to:

- Explain cloud computing, elasticity, scalability, resiliency, automation, and consumption-based delivery
- Compare public, private, hybrid, community, sovereign, edge, and multi-cloud deployment models
- Distinguish IaaS, PaaS, SaaS, CaaS, DBaaS, and serverless/FaaS service models
- Explain regions, availability zones or domains, edge locations, fault domains, and data residency
- Apply the shared responsibility model to infrastructure, platforms, applications, identities, and data
- Design basic cloud networking with virtual networks, subnets, routing, gateways, load balancers, DNS, and private connectivity
- Compare compute, storage, database, container, serverless, messaging, observability, and security services
- Recognize the main service families in AWS, Azure, Google Cloud, and OCI
- Use provider-neutral criteria to select a cloud platform or service
- Apply least privilege, identity federation, encryption, logging, backup, and governance principles
- Understand cloud pricing, tagging, budgets, unit economics, rightsizing, and introductory FinOps practices
- Explain Infrastructure as Code, immutable infrastructure, CI/CD, policy as code, and cloud operating models
- Evaluate portability, vendor lock-in, hybrid integration, and multi-cloud trade-offs

---

## Course Structure

| Session | Topic | Main outcome |
|---|---|---|
| 0 | Course introduction and safe lab setup | Understand the learning path, terminology, and cost-safety rules |
| 1 | Cloud concepts and service models | Explain why cloud is different from traditional hosting |
| 2 | Global infrastructure, resilience, and disaster recovery | Design for failure across zones and regions |
| 3 | Identity, security, compliance, and governance | Apply shared responsibility and least privilege |
| 4 | Compute, storage, networking, databases, and application services | Select the correct service category for a workload |
| 5 | AWS fundamentals | Navigate major AWS concepts and service families |
| 6 | Microsoft Azure fundamentals | Navigate major Azure concepts and service families |
| 7 | Google Cloud fundamentals | Navigate major Google Cloud concepts and service families |
| 8 | OCI, private cloud, hybrid cloud, and multi-cloud | Compare OCI and broader deployment strategies |
| 9 | Operations, observability, IaC, cost management, and adoption | Build a responsible cloud operating model |

---

## Provider Coverage

The course compares equivalent capabilities instead of assuming that similarly named products are identical.

| Capability | AWS | Microsoft Azure | Google Cloud | OCI |
|---|---|---|---|---|
| Virtual machines | Amazon EC2 | Azure Virtual Machines | Compute Engine | Compute |
| Object storage | Amazon S3 | Azure Blob Storage | Cloud Storage | Object Storage |
| Virtual networking | Amazon VPC | Azure Virtual Network | Virtual Private Cloud | Virtual Cloud Network |
| Identity and access | AWS IAM | Microsoft Entra ID and Azure RBAC | Cloud IAM | OCI IAM |
| Managed Kubernetes | Amazon EKS | Azure Kubernetes Service | Google Kubernetes Engine | Oracle Kubernetes Engine |
| Serverless compute | AWS Lambda | Azure Functions | Cloud Run functions / Cloud Run | OCI Functions |
| Managed relational database | Amazon RDS / Aurora | Azure SQL and managed database services | Cloud SQL / AlloyDB | Base Database Service / Autonomous Database |
| Monitoring | Amazon CloudWatch | Azure Monitor | Cloud Monitoring | OCI Monitoring |

See [docs/provider_service_mapping.md](docs/provider_service_mapping.md) for a larger comparison.

---

## Repository Structure

```text
cloud-computing-fundamentals/
├── README.md
├── MANIFEST.md
├── LICENSE.md
├── Makefile
├── slides/
│   ├── 00_course_introduction.md
│   ├── 01_cloud_concepts_and_service_models.md
│   ├── 02_global_infrastructure_and_reliability.md
│   ├── 03_identity_security_and_governance.md
│   ├── 04_compute_storage_networking_and_databases.md
│   ├── 05_aws_fundamentals.md
│   ├── 06_azure_fundamentals.md
│   ├── 07_google_cloud_fundamentals.md
│   ├── 08_oci_private_hybrid_and_multicloud.md
│   └── 09_operations_cost_and_cloud_adoption.md
├── docs/
│   ├── lab_setup.md
│   ├── provider_service_mapping.md
│   ├── cloud_architecture_checklist.md
│   ├── security_and_shared_responsibility.md
│   ├── cost_management_and_finops.md
│   ├── glossary.md
│   ├── useful_links.md
│   ├── instructor_guide.md
│   └── repository_integration.md
├── labs/
│   ├── README.md
│   ├── 01_cloud_service_classification.md
│   ├── 02_design_a_highly_available_web_application.md
│   ├── 03_identity_and_least_privilege.md
│   ├── 04_provider_service_mapping.md
│   ├── 05_cost_and_tagging_review.md
│   └── 06_multicloud_architecture_decision.md
├── examples/
│   ├── workload-requirements.yaml
│   ├── tagging-policy.yaml
│   ├── provider-service-map.csv
│   └── cli/
│       ├── aws-read-only.sh
│       ├── azure-read-only.sh
│       ├── gcp-read-only.sh
│       └── oci-read-only.sh
├── scripts/
│   ├── validate_environment.sh
│   ├── cloud_cli_inventory.sh
│   └── validate_content.py
└── quizzes/
    ├── 01_cloud_concepts.md
    ├── 02_security_infrastructure_and_services.md
    ├── 03_provider_comparison_and_operations.md
    └── 04_final_assessment.md
```

---

## Prerequisites

Recommended knowledge:

- Basic Linux or Windows command-line usage
- Basic networking concepts such as IP addresses, ports, DNS, routing, and firewalls
- General understanding of virtual machines, applications, and databases
- Git and a text editor

No previous cloud experience is required. A paid cloud account is not required for the core course.

---

## Recommended Lab Environment

The core labs are architecture and decision exercises that can be completed locally with:

- Git
- Bash
- Python 3.10+
- A Markdown editor
- Optional: AWS CLI, Azure CLI, Google Cloud CLI, or OCI CLI
- Optional: a provider sandbox, free-tier account, or organization-provided training subscription

Read [docs/lab_setup.md](docs/lab_setup.md) before using any public cloud account.

---

## Getting Started

Clone the training repository and enter the module:

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/cloud-computing-fundamentals
```

List the materials:

```bash
make list
```

Validate the training package:

```bash
make validate
```

Check the local environment and optional cloud CLIs:

```bash
make check-environment
```

Show read-only CLI context for installed providers:

```bash
make inventory
```

Print the provider service map:

```bash
make service-map
```

---

## Recommended Learning Approach

For each session:

1. Review the corresponding slide deck
2. Read the related glossary and reference documents
3. Complete the associated lab using the fictional workload
4. Compare at least two providers without assuming feature parity
5. Document security, resilience, operational, and cost trade-offs
6. Complete the relevant quiz
7. Revisit decisions that depend on changing provider capabilities or pricing

The course can be delivered as:

- A compact one-day cloud overview
- Five two-hour sessions
- A two-day workshop with design exercises
- A self-study onboarding course for engineers entering cloud roles
- A foundation before vendor-specific certifications such as AWS Cloud Practitioner, Azure Fundamentals, Google Cloud Digital Leader, or OCI Foundations

---

## Lab and Cost Safety

- Use only accounts and subscriptions where you are authorized to create resources
- Prefer organization-provided sandboxes with budgets and automatic cleanup
- Never use production accounts for training
- Configure budgets and alerts before creating billable resources
- Use the smallest practical resource size and delete resources immediately after a lab
- Do not create public endpoints unless the exercise explicitly requires them
- Never commit access keys, service-account keys, private keys, tokens, credentials, or state files containing secrets
- Treat free-tier offers as limited commercial programs that can change
- Verify current pricing, quotas, region support, and free-tier conditions before deployment
- The included CLI scripts are read-only by design

---

## Scope and Limitations

This course teaches durable concepts and representative services. Cloud portfolios, product names, quotas, certification objectives, prices, and regional availability change frequently. Always verify operational decisions against the current official provider documentation.

The course does not attempt to cover every provider service, advanced landing-zone implementation, production migration, regulated-industry control, or certification exam objective.

---

## License

Educational content, including presentations, documentation, exercises, and quizzes, is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

Source code, scripts, and executable examples are licensed separately under the MIT License.

Provider names, service names, trademarks, documentation, and third-party materials remain subject to their respective owners and licenses.

## Author

**Vladislav Iliev**

[LinkedIn](https://www.linkedin.com/in/vld62/)
