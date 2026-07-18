---
marp: true
theme: default
paginate: true
---

# Shell Environment and Bash Scripting

### LPIC-1 objectives 105.1 and 105.2

**Presenter:** Vladislav Iliev

**Audience:** Linux learners, system administrators, DevOps engineers, and certification candidates

---

## Shell Startup Files

- Login and interactive shells read different startup files.
- System-wide files provide defaults.
- User files customize the environment.
- Know the roles of `/etc/profile`, shell rc files, and user profile files.

---

## Environment Variables

- Shell variables become environment variables when exported.
- `PATH` controls executable lookup.
- `env`, `set`, `export`, and `unset` inspect or change state.
- Quote variable expansions unless word splitting is intended.

---

## Aliases and Functions

- Aliases replace simple command prefixes.
- Functions support parameters and multi-step behavior.
- Use functions for reusable interactive workflows.
- Use scripts for versioned, testable automation.

---

## Script Structure

- Start with an appropriate shebang.
- Use clear variables and comments.
- Validate arguments and command dependencies.
- Return meaningful exit codes.

---

## Tests and Conditions

- `test`, `[ ]`, and `[[ ]]` evaluate conditions.
- Use numeric, string, and file tests correctly.
- `if`, `elif`, and `else` select control flow.
- `&&` and `||` chain commands based on exit status.

---

## Loops and Input

- Use `for` for known lists.
- Use `while` for condition-driven repetition.
- Use `read` for controlled input.
- Avoid parsing `ls` output.

---

## Safer Scripting

- Use `set -Eeuo pipefail` thoughtfully.
- Create temporary files safely.
- Quote expansions.
- Avoid SUID shell scripts.
- Test in a disposable environment.

---

## Practice

- Run the commands in a disposable lab.
- Capture expected and unexpected output.
- Explain what changed and how to reverse it.
- Complete the matching lab and checklist items.

---

## Key Takeaways

- Understand the concept before memorizing options.
- Know the important commands, files, and failure modes.
- Prefer safe, observable, reversible practice.
- Review the official LPIC-1 objectives as the source of truth.
