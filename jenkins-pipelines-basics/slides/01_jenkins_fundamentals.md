---
marp: true
theme: default
paginate: true
---

# Jenkins Fundamentals

## Session 1

Jenkins Pipelines: Basics

---

# Agenda

* What is Jenkins?
* Why use Jenkins?
* Jenkins and CI/CD
* Jenkins architecture
* Controllers and agents
* Jobs, builds, and workspaces
* Summary

---

# What is Jenkins?

Jenkins is an open-source automation server used to automate parts of the software delivery process.

Common use cases:

* Build automation
* Test automation
* Static analysis
* Packaging
* Artifact publishing
* Deployment automation

---

# Jenkins in CI/CD

A common CI/CD flow:

```text
Code Change
    ↓
Source Control
    ↓
Jenkins Trigger
    ↓
Build
    ↓
Test
    ↓
Package
    ↓
Publish / Deploy
```

---

# Why Use Jenkins?

Jenkins is useful because it is:

* Flexible
* Extensible through plugins
* Scriptable through pipelines
* Suitable for many languages and platforms
* Able to run distributed builds
* Easy to integrate with existing tools

---

# Jenkins Architecture

```text
Jenkins Controller
    ├── Agent 1
    ├── Agent 2
    └── Agent 3
```

The controller manages configuration, scheduling, job orchestration, credentials, and plugin behavior.

Agents execute build and pipeline workloads.

---

# Jenkins Controller

The controller is responsible for:

* Managing jobs and pipelines
* Scheduling builds
* Coordinating agents
* Storing configuration
* Managing plugins
* Providing the web UI and API

Avoid running heavy build workloads directly on the controller.

---

# Jenkins Agents

Agents are machines or containers used to execute work.

Agents can be:

* Static virtual machines
* Physical build machines
* Docker containers
* Kubernetes pods
* Cloud instances

Agents help isolate workloads and scale build capacity.

---

# Jobs, Builds, and Workspaces

A **job** defines what Jenkins should execute.

A **build** is one execution of a job.

A **workspace** is the directory where Jenkins checks out code and runs commands.

Pipelines define job logic as code.

---

# Key Takeaways

* Jenkins automates CI/CD workflows
* Controllers orchestrate work
* Agents execute workloads
* Jobs define automation logic
* Builds are job executions
* Workspaces contain checked-out code and generated files

---

# Next Session

## Jenkins in Practice

* Plugins
* Integrations
* Build triggers
* Distributed execution
* Practical toolchain examples
