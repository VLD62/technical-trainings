# Repository Integration

## Training Catalog Entry

Add the following row to the main `README.md` training catalog:

```markdown
| **Terraform: Fundamentals** | Practical introduction to Infrastructure as Code with Terraform, covering HCL, providers, resources, variables, outputs, state, backends, modules, lifecycle rules, imports, testing, security, automation, and troubleshooting. | [Open training](./terraform-fundamentals/) |
```

## Repository Structure Entry

Add the module to the repository tree:

```text
├── terraform-fundamentals/
│   ├── README.md
│   ├── MANIFEST.md
│   ├── LICENSE.md
│   ├── Makefile
│   ├── slides/
│   ├── docs/
│   ├── labs/
│   ├── examples/
│   ├── scripts/
│   └── quizzes/
```

## Suggested Commit Message

```text
feat(training): add Terraform fundamentals course
```

Alternative detailed commit message:

```text
feat(terraform): add fundamentals training module with labs and examples
```
