# Instructor Guide

## Audience

The course is suitable for developers, DevOps engineers, system administrators, platform engineers, support engineers, and technical learners who know basic command-line navigation but have limited structured scripting experience.

## Delivery Options

### 60-Minute Awareness Session

- 10 min: shell model, execution, and exit status
- 15 min: quoting and argument boundaries
- 15 min: conditions, pipelines, and functions
- 10 min: error handling, ShellCheck, and testing
- 10 min: security mistakes and demonstration

### Half-Day Workshop

- Sessions 0-3 with labs 1-3
- Short break
- Sessions 4-6 with labs 4-6
- Final review and quiz

### Full-Day Course

- All slide decks
- All guided labs
- Final project implementation
- Peer review using the style and security checklists
- Fundamentals and scenario quiz

## Recommended Demonstrations

1. Show how `"$@"` preserves multiple arguments while `$*` and unquoted expansions do not.
2. Create a filename containing spaces and a leading dash.
3. Compare pipeline status with and without `pipefail`.
4. Demonstrate a cleanup trap after a controlled failure.
5. Run ShellCheck against a deliberately unsafe snippet.
6. Run a script with a minimal PATH to simulate cron or CI.
7. Show atomic report generation with a temporary file and `mv`.

## Teaching Notes

- Ask participants to predict arguments, output, and status before execution.
- Distinguish Bash-specific syntax from portable POSIX shell syntax.
- Avoid presenting strict mode as a complete error-handling solution.
- Emphasize that text output is an interface and should be designed deliberately.
- Use synthetic data and temporary directories for destructive examples.
- Review failure behavior after every successful implementation.

## Assessment

Suggested scoring:

- 20% syntax and language fundamentals
- 20% quoting, arrays, and argument safety
- 20% control flow and functions
- 20% reliability, cleanup, and testing
- 20% final project clarity, security, and maintainability

## Final Project Review Questions

- Does the script produce a useful help message?
- Does it reject invalid options and unwritable destinations?
- Are data output and diagnostics separated?
- Are all temporary files removed after success and failure?
- Does a path containing spaces work?
- Does the script pass validation and tests?
- Can another participant explain and safely modify it?
