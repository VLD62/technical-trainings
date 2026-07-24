# Jenkins Pipelines: Basics

A practical introduction to Jenkins and pipeline-based CI/CD automation, covering
Jenkins architecture, Declarative and Scripted pipelines, and maintainable
`Jenkinsfile` practices.

## Overview

The course explains what Jenkins is, how controllers, agents, jobs, and plugins work
together, and how to write pipelines that teams can maintain. It combines slide-based
sessions with example `Jenkinsfile`s you can read, adapt, and reuse.

## Target audience

- Developers, DevOps engineers, QA engineers, and release engineers
- IT professionals introducing or improving CI/CD with Jenkins

## Prerequisites

- Basic familiarity with Git and the command line
- Access to a Jenkins instance is helpful for experimentation but not required to
  follow the material (the example `Jenkinsfile`s can be read and discussed on their own)

## Learning objectives

By the end of this training you will be able to:

- Explain the basic Jenkins architecture and the role of plugins
- Write a Declarative Pipeline and recognize when Scripted Pipeline is warranted
- Use stages, steps, parameters, and environment variables
- Apply pipeline practices that reduce common maintenance problems

## Repository structure

```text
jenkins-pipelines-basics/
├── README.md
├── slides/          # Session presentations (00–04)
├── docs/            # Guidelines, glossary, and further reading
└── examples/        # Example Jenkinsfiles (basic, parameters, parallel, modular)
```

## Getting started

```bash
git clone https://github.com/VLD62/technical-trainings.git
cd technical-trainings/jenkins-pipelines-basics
```

Work through the slides in order, then open the matching example `Jenkinsfile`s in
`examples/`.

## Learning path

| Session | Topic |
|---:|---|
| 0 | Course introduction |
| 1 | Jenkins fundamentals |
| 2 | Jenkins in practice |
| 3 | Pipeline fundamentals |
| 4 | Pipeline best practices |

## Examples

| File | Focus |
|---|---|
| `examples/Jenkinsfile.basic` | Minimal Declarative Pipeline |
| `examples/Jenkinsfile.parameters` | Parameters and environment variables |
| `examples/Jenkinsfile.parallel` | Parallel stages |
| `examples/Jenkinsfile.modular` | Structuring larger pipelines |

## Security notes

The examples use placeholder names and no real credentials. In Jenkins, keep secrets
in the credentials store and reference them with the `credentials()` helper — never
hard-code tokens in a `Jenkinsfile`.

## Further reading

See [docs/useful_links.md](./docs/useful_links.md) and
[docs/jenkins_pipeline_guidelines.md](./docs/jenkins_pipeline_guidelines.md).

## License

Educational content is licensed under CC BY-NC-SA 4.0. Source code and executable
examples are licensed under the MIT License. See the repository root
[LICENSE](../LICENSE) and [LICENSE-CONTENT.md](../LICENSE-CONTENT.md).
