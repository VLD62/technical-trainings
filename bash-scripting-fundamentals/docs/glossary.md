# Glossary

**Argument** — A value passed to a command or script after its command name.

**Bash** — GNU Bourne Again Shell, a command interpreter and scripting language.

**Builtin** — A command implemented by the shell itself, such as `cd`, `printf`, or `read`.

**Command substitution** — Replaces `$(command)` with the command's standard output after trailing newlines are removed.

**Environment variable** — A named value exported to child processes.

**Exit status** — An integer from 0 to 255 returned by a command; 0 conventionally means success.

**Expansion** — Bash processing that transforms syntax into words, including parameter, command, arithmetic, and pathname expansion.

**File descriptor** — A numeric handle for an open stream; 0, 1, and 2 are standard input, output, and error.

**Globbing** — Pathname expansion using patterns such as `*`, `?`, and bracket expressions.

**Here document** — A block of text redirected to a command until a delimiter line is reached.

**Idempotency** — A property where repeated execution produces the same intended state without additional unintended changes.

**Interpreter** — A program that reads and executes source text, such as Bash executing a shell script.

**Pipeline** — Commands connected so the output of one becomes the input of the next.

**Positional parameter** — An argument available as `$1`, `$2`, and so on.

**Process substitution** — Exposes command input or output as a temporary file-like path using `<(...)` or `>(...)`.

**Quoting** — Syntax that controls how characters and expansions are interpreted.

**Redirection** — Changes where a command reads input or writes output and errors.

**Shebang** — The first line beginning with `#!` that selects an interpreter for direct execution.

**Shell** — A command interpreter that provides command execution, pipelines, variables, and scripting features.

**ShellCheck** — A static analysis tool for shell scripts.

**Signal** — An asynchronous notification sent to a process, such as `INT` or `TERM`.

**Subshell** — A child shell process or environment used for grouped commands, command substitution, or parts of pipelines.

**Trap** — A Bash mechanism that runs a command or function when a signal or shell event occurs.

**Word splitting** — Splits unquoted expansion results using characters from `IFS`.
