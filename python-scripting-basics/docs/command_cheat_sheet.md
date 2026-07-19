# Python Command Cheat Sheet

## Environment

```bash
python3 --version
python3 -m venv .venv
source .venv/bin/activate
python -m pip install -r requirements.txt
deactivate
```

## Run

```bash
python script.py
python -m package.module
python -c "import sys; print(sys.version)"
```

## Test and Validate

```bash
python -m compileall -q examples scripts
python -m unittest discover -s examples/08_testing -p "test_*.py" -v
python -m unittest discover -s examples/09_project -p "test_*.py" -v
ruff check examples scripts
```

## Common Built-ins

`len`, `sum`, `min`, `max`, `sorted`, `enumerate`, `zip`, `any`, `all`, and `isinstance`.

## Debugging

```python
print(repr(value))
breakpoint()
```
