# Repository Integration

## Training Catalog Entry

Add this row to the main `README.md` training catalog:

```markdown
| **Cloud Computing: Fundamentals** | Vendor-neutral introduction to cloud concepts, service and deployment models, security, networking, compute, storage, databases, reliability, operations, FinOps, and practical comparisons of AWS, Microsoft Azure, Google Cloud, and Oracle Cloud Infrastructure. | [Open training](./cloud-computing-fundamentals/) |
```

## Repository Tree Entry

Add this module to the repository structure:

```text
├── cloud-computing-fundamentals/
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
feat: add cloud computing fundamentals training
```

## Suggested Extended Commit Body

```text
- cover cloud concepts, service models, security, networking and reliability
- compare AWS, Azure, Google Cloud and OCI services
- add provider-neutral labs, quizzes, examples and reference documentation
- include validation, environment checks and safe read-only CLI examples
- update the main training catalog and repository structure
```
