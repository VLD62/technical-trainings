# Lab 04 - Loops, Arrays, and Functions

## Goal

Create `command_audit.sh` that checks a list of required commands.

## Requirements

- Store default commands in an indexed array.
- Accept additional command names as arguments.
- Implement `command_exists`, `check_command`, and `print_summary` functions.
- Count available and missing commands.
- Print one result per command.
- Return status 0 when all commands exist and 1 otherwise.
- Use local variables inside functions.

## Suggested Defaults

```bash
required_commands=(bash grep sed awk find tar)
```

## Test Cases

```bash
bash command_audit.sh
bash command_audit.sh definitely-not-a-command
```

## Extension

Add a `--quiet` mode and avoid duplicate command checks.
