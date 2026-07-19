# Setup Guide

## Supported Environment

The course targets GNU Bash 4.4 or newer on Linux. Bash 5.x is recommended. Most examples also work on modern macOS after installing a current Bash version, and on Windows through WSL2.

Check the interpreter:

```bash
bash --version
command -v bash
```

## Ubuntu and Debian

```bash
sudo apt update
sudo apt install bash make python3 shellcheck
```

`shfmt` and Bats may be available through the distribution package manager, Homebrew, a downloaded release, or another approved internal software source. Follow your organization's software installation policy.

## Fedora and Related Systems

```bash
sudo dnf install bash make python3 ShellCheck
```

Package names and versions vary by distribution.

## macOS

The system Bash may be older than the course recommendation. A current Bash can be installed through an approved package manager such as Homebrew:

```bash
brew install bash shellcheck shfmt bats-core
```

Invoke the installed Bash explicitly or update the shebang according to the local environment.

## Windows with WSL2

Use an Ubuntu or another Linux distribution in WSL2. Clone or copy the repository inside the Linux filesystem for predictable permissions and performance.

```bash
sudo apt update
sudo apt install bash make python3 shellcheck
```

## Verify the Course

From the training directory:

```bash
make check
make validate
make test
```

Optional quality tools:

```bash
make lint
make format-check
```

## Editor Suggestions

Useful editor capabilities include:

- Bash syntax highlighting
- ShellCheck integration
- Visible whitespace
- LF line endings
- Four-space indentation
- Automatic final newline

The included `.editorconfig` provides common defaults.

## Safe Working Directory

Create a disposable directory for labs:

```bash
mkdir -p "$HOME/bash-fundamentals-work"
cd "$HOME/bash-fundamentals-work"
```

Do not perform destructive labs in a production directory or against important files.
