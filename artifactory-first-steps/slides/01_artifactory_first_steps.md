# JFrog Artifactory: First Steps

---

## What is JFrog Artifactory?

JFrog Artifactory is a binary repository manager used to store, organize, control, and distribute software artifacts.

It acts as a single source of truth for build outputs, packages, libraries, archives, container-related assets, and release binaries.

---

## Why artifact management matters

Without a central artifact repository, teams often struggle with:

* Unclear artifact ownership
* Lost or overwritten build outputs
* Manual file sharing
* Inconsistent release versions
* Weak traceability between source, build, and deployment
* Difficult rollback and audit scenarios

---

## What is an artifact?

An artifact is a file produced, consumed, or distributed during software delivery.

Common examples:

* Application packages
* Libraries
* ZIP or TAR archives
* Build outputs
* Test reports
* Release bundles
* Container images or related metadata

---

## What is a repository?

In Artifactory, a repository is a logical location where artifacts are stored or accessed.

Repositories help teams separate artifacts by:

* Technology or package type
* Project or product
* Lifecycle stage
* Access level
* Ownership
* Retention policy

---

## Common repository types

### Local repository

Stores artifacts produced by your organization or project.

### Remote repository

Caches artifacts from an external upstream source.

### Virtual repository

Provides a single access point across multiple local and remote repositories.

---

## Typical artifact lifecycle

```text
Build → Upload → Validate → Promote → Publish → Consume → Retain or Clean up
```

A clear lifecycle helps teams control what is temporary, what is tested, and what is approved for release.

---

## Example lifecycle stages

* `dev` or `snapshot` — temporary build output
* `staging` — candidate artifact for validation
* `release` or `production` — approved artifact
* `archive` — retained artifact for traceability

The exact naming should follow the team's repository governance model.

---

## Access control basics

Repository access should be granted based on role and responsibility.

Common access levels:

* Read artifacts
* Deploy or upload artifacts
* Delete artifacts
* Manage repository configuration
* Manage permissions

Use groups instead of individual user permissions whenever possible.

---

## Repository request checklist

Before creating a new repository, define:

* Repository name
* Artifact/package type
* Owner or responsible team
* Read access group
* Write/deploy access group
* Lifecycle stage
* Retention policy
* Cleanup expectations
* Backup or compliance requirements

---

## Upload workflow

A typical upload workflow:

1. Build the artifact
2. Generate metadata if needed
3. Upload to the correct repository path
4. Verify checksum or file size
5. Link the artifact to build or release information

---

## Download workflow

A typical download workflow:

1. Select the correct repository
2. Identify the required version
3. Download via UI, CLI, or build tool
4. Verify checksum if required
5. Use the artifact in build, test, deployment, or release steps

---

## Publishing and promotion

Promotion means moving or copying an artifact from a temporary or validation stage to an approved release stage.

Good promotion rules:

* Promote only tested artifacts
* Avoid rebuilding the same version for release
* Preserve metadata and checksums
* Keep a clear link to source revision and build number

---

## Artifactory in CI/CD

Artifactory is commonly used in pipelines to:

* Store build outputs
* Resolve dependencies
* Publish release binaries
* Keep deployment artifacts versioned
* Support rollback scenarios
* Improve traceability between commit, build, artifact, and deployment

---

## Example repository naming pattern

```text
<team-or-product>-<technology>-<lifecycle>
```

Examples:

```text
payments-generic-dev
payments-generic-release
frontend-npm-virtual
platform-docker-local
```

Use a pattern that is clear, consistent, and easy to search.

---

## Good practices

* Use clear repository ownership
* Avoid uploading artifacts manually when CI/CD can do it
* Do not overwrite release artifacts
* Use immutable versioning where possible
* Keep secrets out of artifacts
* Define retention and cleanup rules
* Document access groups and support process

---

## Common mistakes

* Using shared folders instead of repositories
* Mixing temporary and release artifacts
* Granting write access too broadly
* Uploading secrets or environment-specific configuration
* Rebuilding instead of promoting the same artifact
* Keeping everything forever without retention rules

---

## Practical exercise

Discuss and define a repository model for a sample application:

* What artifact type is produced?
* Which repository should receive build outputs?
* Who can upload artifacts?
* Who can download artifacts?
* What makes an artifact ready for release?
* How long should temporary artifacts be kept?

---

## Summary

Artifactory provides a controlled, searchable, and traceable location for software artifacts.

A good repository model improves release quality, delivery consistency, rollback readiness, and collaboration across teams.
