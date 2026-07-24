# Contributing

Thanks for your interest in improving these trainings. Contributions of all sizes
are welcome — from fixing a typo to adding a new module.

## Ground rules

- **Keep it technology-neutral and publicly reusable.** No company-specific,
  internal, confidential, or proprietary references.
- **Never commit real secrets.** Use placeholder values and `.env.example` files.
  Real endpoints, tokens, and passwords do not belong in the repository.
- **Prefer clear international English** and consistent Markdown formatting.
- **Keep commands copy-pasteable** and use relative links between files in the repo.
- **Warn before anything destructive**, and always document cleanup steps.

## Making a change

1. Create a branch from `main`.
2. Make your change, keeping edits proportional to the size of the module.
3. Run the repository-wide validation:

   ```bash
   make validate
   # or: python3 scripts/validate_repo.py
   ```

4. If you touched a module that ships a `Makefile`, run its checks too:

   ```bash
   cd <module>
   make validate
   make test    # when the module has tests
   ```

5. Open a pull request and fill in the template. Describe what changed and how you
   verified it.

## Validation and CI

Pull requests run a GitHub Actions workflow that includes, where relevant to the
changed files: repository structure checks, Markdown linting and link checking, YAML
validation, ShellCheck, Python syntax checks, and Terraform formatting/validation.
Checks skip gracefully when a file type is not present and never require cloud
credentials or paid services.

You can reproduce the fast, dependency-light checks locally with `make validate`.

## Adding a new training module

See [docs/adding-a-training-module.md](./docs/adding-a-training-module.md) for the
module conventions and a ready-to-copy README template. In short:

- Use a lowercase, hyphenated directory name (for example `redis-caching-basics`).
- Include a `README.md` and, where it adds value, a `MANIFEST.md`, `LICENSE.md`, and
  `Makefile`.
- Only add directories that carry real content — do not create empty placeholders to
  make modules look identical.
- Add the module to the catalog in the root [README.md](./README.md), in the most
  appropriate category.

## License of contributions

By contributing you agree that your contributions are licensed under the repository's
dual-license model: the [MIT License](./LICENSE) for code and executable examples, and
[CC BY-NC-SA 4.0](./LICENSE-CONTENT.md) for educational content.
