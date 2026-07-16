---

marp: true
theme: default
paginate: true
--------------

# Workflows & Automation

## Session 2

AI Agents & Workflows: Basics

---

# Agenda

* What is a Workflow?
* What is Automation?
* Workflow Examples
* Workflow vs Agent
* Where Workflows Work Best
* Where Agents Help
* Introduction to n8n
* Summary

---

# What is a Workflow?

A workflow is a predefined sequence of steps used to accomplish a task.

Examples:

* Approval process
* CI/CD pipeline
* Order processing
* Data synchronization

---

# Simple Workflow Example

```text
Receive Request
      ↓
Validate Data
      ↓
Process Request
      ↓
Send Notification
```

Each step is known in advance.

---

# What is Automation?

Automation is the execution of tasks with minimal human intervention.

Benefits:

* Faster execution
* Fewer errors
* Repeatability
* Scalability

---

# Workflow Automation Examples

### CI/CD

```text
Commit
  ↓
Build
  ↓
Test
  ↓
Deploy
```

### Ticket Processing

```text
New Ticket
    ↓
Assign Owner
    ↓
Notify Team
```

---

# Workflow Characteristics

* Predictable
* Repeatable
* Deterministic
* Rule-based

Workflows are excellent when the process is already known.

---

# Workflow vs Agent

| Workflow         | Agent                 |
| ---------------- | --------------------- |
| Fixed steps      | Dynamic decisions     |
| Rule-based       | Goal-based            |
| Predictable      | Adaptive              |
| Executes process | Reasons about process |

---

# Example: Workflow

User submits a vacation request.

```text
Submit Request
      ↓
Manager Approval
      ↓
HR Notification
      ↓
Update System
```

Every step is predefined.

---

# Example: Agent

User asks:

> "Prepare a summary of our project status."

Agent may:

* Search documents
* Read tickets
* Gather information
* Generate summary

The exact steps are decided dynamically.

---

# Where Workflows Work Best

Good use cases:

* CI/CD pipelines
* Data processing
* Notifications
* Scheduled jobs
* Approvals

---

# Where Agents Help

Good use cases:

* Research
* Analysis
* Summarization
* Planning
* Information retrieval
* Decision support

---

# Introduction to n8n

n8n is a workflow automation platform.

Key concepts:

* Trigger
* Nodes
* Connections
* Execution Flow

n8n helps automate workflows visually.

---

# Workflow + Agent

Modern systems often combine both.

```text
Workflow
    ↓
Agent
    ↓
Workflow
```

Example:

* Workflow receives request
* Agent analyzes request
* Workflow executes actions

---

# Key Takeaways

* Workflows execute predefined steps
* Automation reduces manual work
* Agents make dynamic decisions
* Workflows and Agents complement each other
* n8n is a popular workflow automation platform

---

# Next Session

## LangChain: Agents & Tools

* Tool Calling
* Agent Logic
* Building the First Real Agent

```
```
