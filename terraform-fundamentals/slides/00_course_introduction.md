# Terraform: Fundamentals — Course Introduction

## Learning Outcomes

- Understand the course scope and expected outcomes
- Prepare a safe local lab environment
- Recognize the difference between learning examples and production infrastructure

---

## Why Terraform?

Terraform provides a declarative workflow for describing and managing infrastructure through version-controlled configuration.

The same core workflow can be used across:

- Public cloud platforms
- Private cloud and virtualization platforms
- Kubernetes and cloud-native services
- SaaS platforms
- Networking, DNS, monitoring, identity, and security systems

---

## Course Philosophy

- Learn the mental model before memorizing commands
- Predict the plan before applying it
- Treat state as a critical system component
- Prefer small, composable modules
- Automate validation before automating apply
- Use least privilege and short-lived credentials
- Keep training environments disposable

---

## Lab Strategy

The core examples use the built-in `terraform_data` resource.

Benefits:

- No cloud account required
- No paid resources
- No provider credentials
- Fast initialization
- Safe practice with state, dependencies, lifecycle, modules, and tests

An optional Docker example demonstrates a real external provider.

---

## Required Tools

- Terraform CLI 1.6 or newer
- Git
- A terminal
- A text editor or IDE
- Python 3 for content validation
- Optional Docker Engine or Podman

---

## Safety Rules

- Do not commit state or credentials
- Do not use production environments
- Read every plan
- Do not blindly copy destructive commands
- Keep backups before state operations
- Destroy disposable lab resources when finished

---

## Learning Flow

1. Explain the concept
2. Inspect the configuration
3. Predict the plan
4. Run the command
5. Inspect state and outputs
6. Change one thing
7. Compare the new plan
8. Clean up
