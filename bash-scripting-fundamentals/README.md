# Bash Scripting: Fundamentals

A practical, reusable course for learning safe and maintainable automation with GNU Bash on Linux.

The training starts with the Bash execution model and gradually introduces variables, quoting, arguments, conditions, loops, arrays, functions, pipelines, text processing, error handling, debugging, testing, security, and operational automation. Every topic is paired with runnable examples and guided labs.

---

## Course Objectives

By the end of this course participants will be able to:

- Explain the difference between a terminal, shell, Bash, and a shell script
- Create executable scripts with an appropriate shebang
- Work safely with variables, environment variables, arguments, and exit statuses
- Apply quoting, parameter expansion, command substitution, and arithmetic expansion
- Use conditional expressions, `case`, loops, arrays, and functions
- Process files and text with redirections, pipelines, `grep`, `sed`, `awk`, `find`, and `xargs`
- Build scripts that validate input and report meaningful errors
- Use traps, temporary directories, cleanup functions, and predictable exit codes
- Debug scripts with `bash -n`, `bash -x`, `PS4`, and targeted logging
- Check scripts with ShellCheck and format them consistently with `shfmt`
- Test command-line behavior with lightweight Bash tests and optionally Bats
- Avoid common security problems such as unquoted expansions, unsafe temporary files, and `eval`
- Package Bash automation for cron, systemd timers, CI/CD, and operational runbooks

---

## Course Structure

### Session 0 - Course Introduction

- What Bash is and when it is the right tool
- Course scope, prerequisites, and repository structure
- Safe learning environment and delivery options
- Final project overview

### Session 1 - Shell and Script Foundations

- Terminal, shell, Bash, and process basics
- Interactive and non-interactive shells
- Shebangs, file permissions, and script execution
- Commands, builtins, PATH lookup, exit status, and help systems

### Session 2 - Variables, Quoting, and Expansion

- Variables, environment variables, and readonly values
- Positional parameters and special parameters
- Single quotes, double quotes, escaping, and word splitting
- Parameter, command, arithmetic, pathname, and brace expansion

### Session 3 - Input, Conditions, and Control Flow

- Validating arguments and reading input
- `test`, `[ ]`, and `[[ ]]`
- String, numeric, and file comparisons
- `if`, `elif`, `else`, `case`, `&&`, and `||`
- Basic option parsing with `getopts`

### Session 4 - Loops, Arrays, and Functions

- `for`, C-style `for`, `while`, and `until`
- `break`, `continue`, and safe input loops
- Indexed arrays and iteration patterns
- Functions, arguments, return status, output, and local variables
- Separating reusable library code from executable code

### Session 5 - Files, Streams, and Text Processing

- Standard input, output, and error
- Redirections, pipelines, here documents, and here strings
- File discovery with `find`
- Text filtering and transformation with `grep`, `sed`, and `awk`
- Null-delimited data and filenames containing spaces
- Temporary files and directories

### Session 6 - Robust Scripts, Debugging, and Testing

- Exit codes and explicit error handling
- Benefits and limitations of `set -Eeuo pipefail`
- `trap`, cleanup, signals, and error reporting
- Syntax checking, execution tracing, and debugging techniques
- ShellCheck, `shfmt`, test design, and idempotency

### Session 7 - Automation, Security, and Final Project

- Secure handling of input, paths, credentials, and privileges
- Logging and predictable command-line interfaces
- Cron, systemd timers, CI/CD, and non-interactive environments
- Packaging, documentation, and operational handover
- Final project: system health and inventory report

---

## Repository Structure

```text
bash-scripting-fundamentals/
├── README.md
├── MANIFEST.md
├── LICENSE.md
├── Makefile
├── .editorconfig
├── .gitignore
├── slides/
│   ├── 00_course_introduction.md
│   ├── 01_shell_and_script_foundations.md
│   ├── 02_variables_quoting_and_expansion.md
│   ├── 03_input_conditions_and_control_flow.md
│   ├── 04_loops_arrays_and_functions.md
│   ├── 05_files_streams_and_text_processing.md
│   ├── 06_robust_scripts_debugging_and_testing.md
│   └── 07_automation_security_and_final_project.md
├── docs/
│   ├── setup_guide.md
│   ├── cheat_sheet.md
│   ├── style_guide.md
│   ├── debugging_and_testing.md
│   ├── security_and_operations.md
│   ├── troubleshooting.md
│   ├── glossary.md
│   ├── instructor_guide.md
│   └── useful_links.md
├── labs/
│   ├── README.md
│   ├── 01_first_script.md
│   ├── 02_arguments_variables_and_quoting.md
│   ├── 03_conditions_and_options.md
│   ├── 04_loops_arrays_and_functions.md
│   ├── 05_log_processing.md
│   ├── 06_robust_backup_script.md
│   └── 07_final_project.md
├── examples/
│   ├── data/application.log
│   ├── lib/logging.sh
│   ├── 00_hello_bash.sh
│   ├── 01_arguments.sh
│   ├── 02_file_check.sh
│   ├── 03_loop_files.sh
│   ├── 04_functions.sh
│   ├── 05_log_summary.sh
│   ├── 06_backup_directory.sh
│   └── 07_system_report.sh
├── scripts/
│   ├── check_environment.sh
│   └── validate_content.py
├── tests/
│   ├── run_tests.sh
│   └── test_examples.sh
└── quizzes/
    ├── 01_fundamentals.md
    └── 02_scenarios.md
```

---

## Prerequisites

Recommended knowledge:

- Basic Linux command-line navigation
- Familiarity with files, directories, permissions, and processes
- Basic Git usage
- Access to a text editor or IDE

Required environment:

- Linux, macOS, or Windows with WSL2
- GNU Bash 4.4 or newer; Bash 5.x is recommended
- Common command-line tools such as `grep`, `sed`, `awk`, `find`, `tar`, and `mktemp`
- Python 3 for repository validation
- Optional: `make`, ShellCheck, `shfmt`, and Bats

The examples target Bash rather than portable POSIX `sh`. Run them with Bash even when another shell is configured as the interactive default.

---

## Quick Start

Check the environment:

```bash
make check
```

Validate the training package and Bash syntax:

```bash
make validate
```

Run the automated example tests:

```bash
make test
```

Run all safe demonstrations:

```bash
make demo
```

Run a single example:

```bash
bash examples/01_arguments.sh Alice 3
```

Check scripts with ShellCheck when installed:

```bash
make lint
```

Check formatting with `shfmt` when installed:

```bash
make format-check
```

---

## Recommended Learning Approach

For each session:

1. Review the corresponding Markdown slide deck.
2. Run the focused examples and predict their output first.
3. Modify one input, condition, expansion, or pipeline.
4. Complete the associated lab in a temporary working directory.
5. Run `bash -n` and ShellCheck before executing changed scripts.
6. Test both successful and failing inputs.
7. Complete the relevant knowledge-check questions.

The course can be delivered as:

- A 60-minute Bash safety and scripting overview
- Two 90-minute sessions with demonstrations
- A half-day workshop with selected labs
- A full-day hands-on course including the final project
- A multi-session internal academy with homework and peer reviews

---

## Safety and Security Notes

- Run training scripts only in authorized, non-production environments.
- Read a script before executing it, especially when it changes or removes files.
- Quote variable expansions unless word splitting or glob expansion is explicitly intended.
- Use `mktemp` for temporary files and remove them through a cleanup trap.
- Treat command-line arguments, filenames, environment variables, and command output as untrusted input.
- Avoid `eval`; prefer arrays, functions, and explicit command construction.
- Never place secrets directly in source code, command history, logs, or process arguments.
- Use least privilege and do not run a script as root unless the task truly requires it.
- Test destructive operations with a dry-run mode and isolated sample data.
- Do not assume interactive configuration exists in cron, systemd, containers, or CI runners.

---

## License

Educational content, including presentations, documentation, diagrams, exercises, and quizzes, is licensed under the Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License.

Source code, shell scripts, Python scripts, Makefiles, and executable examples are licensed under the MIT License.

GNU, Bash, Linux, ShellCheck, Bats, and other product or project names remain subject to the licenses and trademarks of their respective owners.

## Author

**Vladislav Iliev**

[LinkedIn](https://www.linkedin.com/in/vld62/)
