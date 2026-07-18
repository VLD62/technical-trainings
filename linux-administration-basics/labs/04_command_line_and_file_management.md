# Lab 4 – Command Line and File Management

## Objectives

- Practice quoting, expansion, history, and command discovery
- Manage files and directories safely
- Find files using multiple predicates
- Create, list, extract, and verify archives

## Setup

```bash
LAB_DIR=$(mktemp -d /tmp/lpic-files.XXXXXX)
cd "$LAB_DIR"
mkdir -p project/{docs,logs,data}
printf '%s\n' alpha beta gamma > project/data/names.txt
printf '%s\n' 'one two' 'three four' > 'project/docs/notes with spaces.txt'
touch project/logs/app.log project/logs/error.log
```

## Quoting and Expansion

Run and explain the difference:

```bash
name='Linux Admin'
printf '%s\n' '$name'
printf '%s\n' "$name"
printf '%s\n' $name
printf '%s\n' "Today is $(date +%F)"
printf '%s\n' project/logs/*.log
```

## Command Discovery

```bash
type cd
type printf
command -v tar
which tar
man -f tar
```

Explain why `type` can provide more shell-specific information than `which`.

## File Management

```bash
cp -a project project-copy
mv project-copy/docs project-copy/documentation
touch -d '2 days ago' project/logs/app.log
find project -type f -printf '%TY-%Tm-%Td %10s %p\n' | sort
```

Find:

- Files modified in the last day
- Files ending in `.log`
- Files larger than zero bytes
- Empty files

## Archives

```bash
tar -czf project.tar.gz project
tar -tf project.tar.gz | head
sha256sum project.tar.gz > project.tar.gz.sha256
sha256sum -c project.tar.gz.sha256
mkdir restored
tar -xzf project.tar.gz -C restored
diff -ru project restored/project
```

## `dd` Awareness

Do not write to a block device. Create a small test file only:

```bash
dd if=/dev/zero of=sample.bin bs=1K count=16 status=progress
ls -lh sample.bin
```

Explain why swapping `if` and `of` can be catastrophic when block devices are involved.

## Cleanup

```bash
cd /
rm -rf "$LAB_DIR"
```

## Validation

- You can predict shell expansion before command execution.
- You can handle filenames containing spaces.
- You can use `find` without parsing `ls`.
- You can verify an archive and compare extracted content.
