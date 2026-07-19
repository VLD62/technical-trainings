# Lab 02 - Arguments, Variables, and Quoting

## Goal

Create `create_workspace.sh` that creates a participant workspace.

## Interface

```text
create_workspace.sh NAME DIRECTORY
```

## Requirements

- Require exactly two arguments.
- Store the participant name and directory in variables.
- Create the directory with `mkdir -p`.
- Create a `README.txt` file inside it.
- Write the participant name, creation date, and absolute directory path.
- Support names and directories containing spaces.
- Reject an empty name.
- Print errors to stderr and use a non-zero status.

## Test Cases

```bash
bash create_workspace.sh Alice ./work/alice
bash create_workspace.sh 'Alice Smith' './work/Alice Smith'
bash create_workspace.sh '' ./work/empty
bash create_workspace.sh only-one-argument
```

## Extension

Use parameter expansion to allow the directory to default to `./work/NAME` when only the name is supplied.
