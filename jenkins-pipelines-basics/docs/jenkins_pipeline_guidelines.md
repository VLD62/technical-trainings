# Jenkins Pipeline Guidelines

This document summarizes practical guidelines for writing maintainable Jenkins Pipelines.

The examples are intentionally generic and should be adapted to the build system, test framework, deployment model, and security requirements of each project.

---

## 1. Store Pipeline Code in Version Control

Keep the `Jenkinsfile` and related pipeline scripts in the same source control system as the application code whenever possible.

Benefits:

* Pipeline changes can be reviewed
* The pipeline evolves together with the code
* Changes can be reverted
* Branch-specific pipeline behavior is easier to manage

Avoid keeping important pipeline logic only in the Jenkins UI.

---

## 2. Prefer Declarative Pipelines

Use Declarative Pipeline as the default approach.

Declarative syntax is usually easier to read, standardize, and maintain.

```groovy
pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'make build'
      }
    }

    stage('Test') {
      steps {
        sh 'make test'
      }
    }
  }
}
```

Use Scripted Pipeline only when the workflow requires complex Groovy logic that cannot be expressed clearly in Declarative syntax.

---

## 3. Split Work into Clear Stages

Divide the pipeline into logical stages.

Typical stages:

* Checkout
* Build
* Unit Tests
* Static Analysis
* Package
* Publish
* Deploy

Clear stages help users quickly understand where a failure happened.

---

## 4. Use Pipeline Steps for Individual Tasks

Each stage should contain steps that describe the work to execute.

Examples:

```groovy
steps {
  sh 'make build'
  sh 'make test'
  junit '**/TEST-*.xml'
  archiveArtifacts artifacts: 'dist/**', fingerprint: true
}
```

Steps can be shell commands, Jenkins built-ins, or plugin-provided actions.

---

## 5. Use Environment Variables

Use environment variables for values that should be defined once and reused across stages.

```groovy
pipeline {
  agent any

  environment {
    APP_NAME = 'demo-app'
    BUILD_DIR = 'build'
  }

  stages {
    stage('Build') {
      steps {
        sh 'echo Building $APP_NAME in $BUILD_DIR'
      }
    }
  }
}
```

Do not use environment variables to store plain-text secrets in the Jenkinsfile.

---

## 6. Use Parameters Carefully

Parameters can make a pipeline flexible, but too many parameters make it hard to operate.

```groovy
pipeline {
  agent any

  parameters {
    choice(name: 'TARGET_ENV', choices: ['dev', 'test', 'prod'], description: 'Deployment target')
    booleanParam(name: 'RUN_DEPLOY', defaultValue: false, description: 'Run deployment stage')
  }

  stages {
    stage('Deploy') {
      when {
        expression { return params.RUN_DEPLOY }
      }
      steps {
        sh 'echo Deploying to ${TARGET_ENV}'
      }
    }
  }
}
```

Good parameter examples:

* Target environment
* Build version
* Test scope
* Optional deployment flag

---

## 7. Avoid Hardcoding

Avoid hardcoding:

* Passwords
* API tokens
* Private keys
* Environment-specific URLs
* Repeated paths
* Tool versions that should be configurable

Prefer:

* Jenkins credentials
* Environment variables
* Parameters
* Configuration files
* Shared libraries
* Standard build images

---

## 8. Use Post Actions for Cleanup and Reporting

Use `post` actions for common cleanup and reporting behavior.

```groovy
post {
  always {
    junit '**/TEST-*.xml'
    archiveArtifacts artifacts: 'logs/**/*.log', allowEmptyArchive: true
  }
  success {
    echo 'Pipeline completed successfully.'
  }
  failure {
    echo 'Pipeline failed. Check logs and reports.'
  }
}
```

Post actions make result handling consistent and visible.

---

## 9. Handle Expected Errors Intentionally

Handle known failure scenarios with clear logic.

Examples:

* Mark test failures as unstable when appropriate
* Fail fast on missing required configuration
* Print useful error messages
* Archive logs even when a stage fails
* Keep cleanup in `post` blocks

Avoid hiding errors without reporting them.

---

## 10. Use Parallelism Where It Helps

Use parallel stages for independent tasks that can safely run at the same time.

```groovy
pipeline {
  agent any

  stages {
    stage('Quality Checks') {
      parallel {
        stage('Unit Tests') {
          steps {
            sh 'make test'
          }
        }
        stage('Lint') {
          steps {
            sh 'make lint'
          }
        }
      }
    }
  }
}
```

Only parallelize tasks that are independent and do not compete for the same workspace or shared resources.

---

## 11. Keep Code Reusable

If the same pipeline logic appears in multiple places, extract it.

Options:

* Functions inside the Jenkinsfile for small local reuse
* Shared libraries for organization-wide or multi-repository reuse
* External scripts for complex shell or language-specific logic
* Standard Docker images for repeatable build environments

---

## 12. Use Modular Pipeline Design

A maintainable pipeline should have clear boundaries.

Good signs:

* Each stage has one purpose
* Build, test, publish, and deploy logic are separated
* Configuration is not mixed with business logic
* Repeated logic is extracted
* Shell scripts are not hidden inside long inline strings

---

## 13. Log Important Information

Good logs help troubleshoot issues.

Log:

* Selected parameters
* Tool versions
* Important file paths
* Build metadata
* Test report locations
* Deployment targets

Do not log secrets.

---

## 14. Publish Useful Reports and Artifacts

Publish evidence that helps users understand pipeline results.

Examples:

* Test reports
* Coverage reports
* Static analysis reports
* Build logs
* Deployment logs
* Generated packages

---

## 15. Use Notifications Thoughtfully

Notifications should help people take action.

Good notification design:

* Notify only relevant channels or users
* Include the pipeline name and build URL
* Include result and failed stage when possible
* Avoid excessive noise

---

## 16. Test Pipeline Changes

Test Jenkinsfile changes before relying on them for production workflows.

Recommended approach:

* Test in a branch
* Use a sandbox job or non-production Jenkins instance
* Test failure paths
* Verify credentials, labels, and tool availability
* Confirm reports and artifacts are published correctly

---

## 17. Keep Groovy Readable

Guidelines:

* Use consistent indentation
* Use descriptive names
* Add comments for non-obvious logic
* Avoid unnecessary global variables
* Prefer Jenkins built-in steps when possible
* Keep complex logic out of the Jenkinsfile when it belongs in scripts or libraries

---

## 18. Common Anti-Patterns

Avoid:

* Secrets committed in Jenkinsfiles
* Long scripts embedded directly in pipeline steps
* Heavy work running on the Jenkins controller
* Hardcoded agent names when labels would be better
* Ignoring `post` cleanup and report publishing
* Using Scripted Pipeline for simple workflows
* Too many parameters and manual decisions
* Pipelines that only work on one undocumented machine
