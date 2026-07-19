# Lab Setup

## Recommended Environment

- Python 3.11 or newer
- Git
- Terminal
- VS Code, PyCharm, or another editor
- Linux, macOS, Windows, or WSL

## Setup

```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -r requirements.txt
```

Windows PowerShell:

```powershell
py -m venv .venv
.venv\Scripts\Activate.ps1
python -m pip install -r requirements.txt
```

## Verification

```bash
python scripts/validate_environment.py --check-repository
make validate
make test
```

Configure the editor to use `.venv`, UTF-8, four-space indentation, and visible line numbers.
