---
marp: true
theme: default
paginate: true
---

# Pipeline Best Practices

## Session 4

Jenkins Pipelines: Basics

---

# Agenda

* Version control
* Declarative-first approach
* Stages and separation of concerns
* Avoiding hardcoding
* Error handling
* Reusable code
* Logging and notifications
* Testing pipelines
* Groovy style

---

# Use Version Control

Store Jenkinsfiles and shared pipeline code in source control.

This gives you:

* Reviewable changes
* Change history
* Rollback capability
* Branch-specific pipeline behavior
* Better collaboration

Avoid defining important pipeline logic only in the Jenkins UI.

---

# Prefer Declarative Pipelines

Use Declarative Pipeline as the default style.

It is easier to:

* Read
* Review
* Standardize
* Troubleshoot
* Teach to new team members

Use Scripted Pipeline only when the workflow really requires it.

---

# Separate Concerns with Stages

Use stages to represent logical delivery steps.

Good examples:

* Checkout
* Build
* Unit Tests
* Static Analysis
* Package
* Publish
* Deploy

Each stage should have a clear purpose.

---

# Use Parameters Carefully

Parameters make pipelines flexible.

Good uses:

* Target environment
* Version
* Test scope
* Optional deployment flag

Avoid creating too many parameters because the pipeline becomes harder to operate.

---

# Avoid Hardcoding

Do not hardcode:

* Passwords
* Tokens
* Private keys
* Environment-specific URLs
* Repeated paths
* Tool versions that should be configurable

Use credentials, environment variables, parameters, configuration files, or shared libraries.

---

# Error Handling

Handle expected failures intentionally.

Examples:

* Mark test failures as unstable when appropriate
* Capture logs and reports
* Use `post` actions
* Fail fast for critical errors
* Provide useful messages

---

# Post Actions

Use `post` blocks for cleanup and reporting.

```groovy
post {
  always {
    junit '**/TEST-*.xml'
    archiveArtifacts artifacts: 'logs/**/*.log', allowEmptyArchive: true
  }
  failure {
    echo 'Pipeline failed. Check logs and reports.'
  }
}
```

---

# Reusable Code

Avoid repeating the same pipeline logic.

Reuse can be done through:

* Functions
* Shared libraries
* Common scripts
* Standard build images
* Reusable pipeline templates

Start simple and extract shared code when duplication appears.

---

# Modular Design

A pipeline is easier to maintain when each part has one responsibility.

Good signs:

* Stages are small and clear
* Repeated logic is extracted
* Configuration is separated from logic
* Deployment logic is not mixed with build logic

---

# Logging and Artifacts

Good pipelines keep useful evidence.

Store or publish:

* Test reports
* Build logs
* Static analysis reports
* Coverage reports
* Generated packages
* Deployment logs

This makes troubleshooting much easier.

---

# Notifications

Notify the right people at the right time.

Common channels:

* Email
* Chat tools
* Pull request comments
* Source control status checks
* Monitoring dashboards

Avoid noisy notifications that people will ignore.

---

# Testing Pipelines

Treat pipelines as production code.

Test changes by:

* Running them in a sandbox branch
* Using a non-production Jenkins controller
* Testing failure paths
* Verifying credentials and agent labels
* Checking logs and artifacts

---

# Groovy Style Guidelines

Keep Groovy code readable:

* Use consistent indentation
* Use descriptive variable and method names
* Add comments for non-obvious logic
* Avoid unnecessary global variables
* Use appropriate data types
* Prefer built-in Jenkins steps where possible

---

# Common Mistakes

Avoid:

* Secrets in Jenkinsfiles
* Large scripts embedded directly in pipelines
* Long-running work on the controller
* Too many parameters
* Hidden dependencies on a specific agent
* Ignoring cleanup and reports
* Overusing Scripted Pipeline

---

# Key Takeaways

* Pipelines should be readable, reviewable, and reusable
* Prefer Declarative Pipeline for normal CI/CD workflows
* Keep secrets out of code
* Use stages, parameters, environment variables, and post actions well
* Treat Jenkinsfiles like production code

---

# Final Discussion

Questions to review:

* What makes a Jenkinsfile maintainable?
* What should be moved to shared libraries?
* What should never be hardcoded?
* How should pipeline failures be reported?
* Which examples can be adapted to your projects?
