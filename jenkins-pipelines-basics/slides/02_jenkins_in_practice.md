---
marp: true
theme: default
paginate: true
---

# Jenkins in Practice

## Session 2

Jenkins Pipelines: Basics

---

# Agenda

* Jenkins plugins
* Build triggers
* Source control integration
* Artifact repositories
* Container registries
* Monitoring and notifications
* Agents in practice
* Summary

---

# Jenkins Plugins

Plugins extend Jenkins functionality.

They can provide:

* Source control integrations
* Build triggers
* Pipeline steps
* Credential integrations
* Test reporting
* Artifact publishing
* Notifications
* UI and administration features

---

# Plugin Management

Plugins can usually be installed from Jenkins Plugin Manager.

Good practices:

* Install only needed plugins
* Keep plugins updated
* Review plugin health and maintenance status
* Test plugin updates in a non-production Jenkins instance
* Avoid plugin sprawl

---

# Source Control Integration

Jenkins commonly integrates with source control systems such as:

* GitHub
* GitLab
* Bitbucket
* Gerrit
* Generic Git repositories

The source control system usually triggers builds when code changes.

---

# Build Triggers

Common trigger types:

* Push event
* Pull request or merge request event
* Code review event
* Scheduled trigger
* Manual trigger
* Upstream/downstream job trigger

The best trigger depends on the team workflow.

---

# Example Trigger Flow

```text
Developer pushes code
        ↓
Source control event
        ↓
Jenkins pipeline starts
        ↓
Build and tests run
        ↓
Result is reported back
```

---

# Toolchain Integrations

Jenkins often connects to:

* Source control systems
* Artifact repositories
* Container registries
* Secret stores
* Static analysis tools
* Test reporting tools
* Monitoring and notification systems

---

# Agents in Practice

Agents help Jenkins run builds in the right environment.

Examples:

* Linux agent for shell-based builds
* Windows agent for Windows builds
* Docker-based agent for isolated tools
* Kubernetes-based agent for dynamic scaling

---

# Agent Selection

Pipelines can select agents by label:

```groovy
pipeline {
  agent { label 'linux' }
  stages {
    stage('Build') {
      steps {
        sh 'make build'
      }
    }
  }
}
```

---

# Key Takeaways

* Plugins are central to Jenkins flexibility
* Integrations connect Jenkins to the delivery toolchain
* Triggers automate feedback loops
* Agents provide execution capacity and isolation
* Keep Jenkins setup maintainable and observable

---

# Next Session

## Jenkins Pipeline Fundamentals

* Pipeline as code
* Declarative Pipeline
* Scripted Pipeline
* Stages and steps
* Basic Jenkinsfile structure
