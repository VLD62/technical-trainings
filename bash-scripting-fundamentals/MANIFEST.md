# Course Manifest

This file summarizes the reusable materials included in the course.

## Core Files

| Path | Purpose |
|---|---|
| `README.md` | Course overview, objectives, structure, prerequisites, safety notes, and quick start |
| `Makefile` | Short commands for validation, linting, formatting checks, tests, and demonstrations |
| `.editorconfig` | Consistent editor behavior for Markdown, Bash, Python, and Makefiles |
| `.gitignore` | Ignores generated reports, archives, and temporary files |
| `LICENSE.md` | Licensing summary for educational content and executable examples |

## Slides

| Path | Topic |
|---|---|
| `slides/00_course_introduction.md` | Scope, outcomes, learning path, and final project |
| `slides/01_shell_and_script_foundations.md` | Shell concepts, execution, shebangs, permissions, PATH, and exit status |
| `slides/02_variables_quoting_and_expansion.md` | Variables, arguments, quoting, and Bash expansion order |
| `slides/03_input_conditions_and_control_flow.md` | Input validation, tests, conditions, `case`, and `getopts` |
| `slides/04_loops_arrays_and_functions.md` | Iteration, arrays, functions, scope, and reusable libraries |
| `slides/05_files_streams_and_text_processing.md` | Streams, redirection, pipelines, file discovery, and text processing |
| `slides/06_robust_scripts_debugging_and_testing.md` | Error handling, traps, debugging, linting, formatting, and testing |
| `slides/07_automation_security_and_final_project.md` | Secure automation, scheduling, operational integration, and final project |

## Documentation

| Path | Purpose |
|---|---|
| `docs/setup_guide.md` | Environment setup for Linux, macOS, and WSL2 |
| `docs/cheat_sheet.md` | Frequently used Bash syntax and commands |
| `docs/style_guide.md` | Naming, structure, quoting, functions, interfaces, and review practices |
| `docs/debugging_and_testing.md` | Debugging workflow, ShellCheck, shfmt, tests, and CI suggestions |
| `docs/security_and_operations.md` | Input handling, secrets, privileges, temporary files, and automation safety |
| `docs/troubleshooting.md` | Common execution and portability problems |
| `docs/glossary.md` | Key Bash, shell, process, stream, and automation terms |
| `docs/instructor_guide.md` | Delivery plans, demonstrations, timing, and assessment suggestions |
| `docs/useful_links.md` | Official and primary reference material |

## Labs and Examples

| Path | Purpose |
|---|---|
| `labs/` | Seven guided exercises from first script to final project |
| `examples/` | Focused, runnable scripts for each main topic |
| `examples/lib/logging.sh` | Small reusable logging library sourced by other scripts |
| `examples/data/application.log` | Synthetic log data for text-processing exercises |
| `scripts/check_environment.sh` | Reports required and optional local tools |
| `scripts/validate_content.py` | Validates package structure, public content, and shell syntax |
| `tests/` | Dependency-free behavior checks for the examples |
| `quizzes/` | Fundamentals and scenario-based knowledge checks |
