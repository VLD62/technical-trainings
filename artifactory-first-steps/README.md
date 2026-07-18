# JFrog Artifactory: First Steps

Welcome to the **JFrog Artifactory: First Steps** training.

This module contains reusable training materials, presentation slides, practical examples, and supporting documentation for introducing JFrog Artifactory as a binary repository manager in software delivery workflows.

---

## Course Objectives

By the end of this course participants will:

* Understand what JFrog Artifactory is and why it is used
* Understand the role of artifact repositories in DevOps and CI/CD
* Learn the difference between local, remote, and virtual repositories
* Understand common artifact lifecycle stages
* Learn basic upload, download, publish, and search workflows
* Become familiar with access control and repository governance concepts
* Practice basic Artifactory usage with generic examples

---

## Course Structure

### Session 0 – Course Introduction

* Course overview
* Learning objectives
* Recommended prerequisites
* Repository structure

### Session 1 – Artifactory First Steps

* What is Artifactory?
* Repository concepts
* Repository types
* Artifact lifecycle
* Access and permissions
* Uploading artifacts
* Downloading artifacts
* Publishing artifacts
* CI/CD integration basics
* Good practices

---

## Repository Structure

```text
artifactory-first-steps/
│
├── README.md
│
├── slides/
│   ├── 00_course_introduction.md
│   └── 01_artifactory_first_steps.md
│
├── docs/
│   ├── glossary.md
│   └── useful_links.md
│
└── examples/
    └── generic_artifact_workflow.sh
```

---

## Recommended Prerequisites

Participants should have basic familiarity with:

* Git
* Command-line usage
* Software build outputs
* CI/CD concepts
* Package managers or binary artifacts

---

## Recommended Tools

* JFrog Artifactory access
* Web browser
* Git
* Bash-compatible shell
* curl
* Optional: JFrog CLI

---

## Recommended Learning Approach

For each session:

1. Review the presentation slides
2. Discuss the concepts with the group
3. Run or adapt the provided examples
4. Map the generic workflow to your own project or team setup
5. Document repository naming, ownership, access, and lifecycle rules

---

## Notes

The training is intentionally vendor/product focused but organization-neutral. All examples use generic repository names, placeholder URLs, and placeholder credentials.

Do not commit real Artifactory URLs, access tokens, usernames, internal repository names, or confidential project information.

---

## License

The educational content in this repository, including presentations, documentation, diagrams, and exercises, is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

Source code, scripts, and executable examples are licensed separately under the MIT License.

Third-party images, trademarks, and referenced materials remain subject to their respective owners and licenses.
