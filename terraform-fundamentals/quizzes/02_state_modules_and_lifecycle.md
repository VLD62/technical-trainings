# Quiz 2 — State, Modules, and Lifecycle

## Questions

1. Why does Terraform need state?
2. Why can state be sensitive?
3. What problem does state locking solve?
4. Name three useful criteria for choosing state boundaries.
5. What is the difference between a root module and a child module?
6. Why should module outputs be treated as an API?
7. When is `for_each` generally preferable to `count`?
8. What risk can `ignore_changes` introduce?
9. What does an import operation do?
10. What problem does a `moved` block solve?

## Answers

1. It maps configuration addresses to remote objects and stores metadata needed for lifecycle management.
2. Providers may store resource attributes, credentials, tokens, or secret values in it.
3. It prevents concurrent writers from modifying the same state.
4. Ownership, lifecycle, blast radius, access control, change frequency, or recovery requirements.
5. The root module is where Terraform runs; a child module is called by another module.
6. Consumers depend on outputs, so unnecessary changes create coupling and breaking changes.
7. When instances have stable meaningful keys rather than positional indexes.
8. It can hide drift and create unclear attribute ownership.
9. It binds an existing remote object to a Terraform resource address in state.
10. It records address refactoring so Terraform does not unnecessarily destroy and recreate an object.
