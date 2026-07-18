---
marp: true
theme: default
paginate: true
---

# Jenkins Pipeline Fundamentals

## Session 3

Jenkins Pipelines: Basics

---

# Agenda

* What is a Jenkins Pipeline?
* Pipeline as code
* Jenkinsfile
* Declarative Pipeline
* Scripted Pipeline
* Stages and steps
* Basic examples

---

# What is a Jenkins Pipeline?

A Jenkins Pipeline defines the build, test, and delivery process as code.

A pipeline can describe:

* Where to run
* What stages to execute
* Which commands to run
* How to handle results
* What to do after success or failure

---

# Pipeline as Code

Pipeline as code means the pipeline definition is stored in source control.

Benefits:

* Reviewable changes
* Version history
* Rollback support
* Reuse across branches
* Better collaboration
* Clearer delivery process

---

# Jenkinsfile

A `Jenkinsfile` is the file that contains the Jenkins Pipeline definition.

Common location:

```text
repository-root/
└── Jenkinsfile
```

Jenkins reads the Jenkinsfile and executes the defined stages and steps.

---

# Declarative Pipeline

Declarative Pipeline provides a structured syntax.

It is usually preferred for most pipelines because it is:

* Easier to read
* Easier to maintain
* More standardized
* Good for common CI/CD workflows
* Supported by built-in pipeline features

---

# Declarative Pipeline Example

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

---

# Scripted Pipeline

Scripted Pipeline is more flexible and uses Groovy more directly.

It can be useful when:

* Complex logic is required
* Declarative syntax is too limiting
* Custom flow control is needed

Use it carefully because it can become harder to read and maintain.

---

# Scripted Pipeline Example

```groovy
node {
  stage('Build') {
    sh 'make build'
  }

  stage('Test') {
    sh 'make test'
  }
}
```

---

# Stages

Stages split the pipeline into logical parts.

Typical stages:

* Checkout
* Build
* Test
* Package
* Publish
* Deploy

Clear stages make pipeline failures easier to understand.

---

# Steps

Steps are the individual actions inside a stage.

Examples:

```groovy
sh 'make build'
sh 'make test'
junit '**/TEST-*.xml'
archiveArtifacts artifacts: 'dist/**'
```

Steps can be shell commands, Jenkins built-ins, or plugin-provided actions.

---

# Environment Variables

Use environment variables to keep values centralized.

```groovy
pipeline {
  agent any

  environment {
    APP_NAME = 'demo-app'
  }

  stages {
    stage('Build') {
      steps {
        sh 'echo Building $APP_NAME'
      }
    }
  }
}
```

---

# Parameters

Parameters make pipelines configurable.

```groovy
pipeline {
  agent any

  parameters {
    choice(name: 'TARGET_ENV', choices: ['dev', 'test', 'prod'])
  }

  stages {
    stage('Deploy') {
      steps {
        sh 'echo Deploying to ${TARGET_ENV}'
      }
    }
  }
}
```

---

# Key Takeaways

* Jenkins Pipelines define CI/CD as code
* Jenkinsfiles should be stored in source control
* Declarative Pipeline is preferred for most use cases
* Scripted Pipeline is more flexible but more complex
* Stages and steps make pipeline behavior readable

---

# Next Session

## Pipeline Best Practices

* Maintainability
* Reuse
* Error handling
* Logging
* Notifications
* Groovy style
