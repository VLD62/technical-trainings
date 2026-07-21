#!/usr/bin/env bash
set -u

failures=0

check_command() {
  local command_name="$1"
  if command -v "$command_name" >/dev/null 2>&1; then
    printf '[OK]   %-12s %s\n' "$command_name" "$(command -v "$command_name")"
  else
    printf '[MISS] %-12s not found\n' "$command_name"
    failures=$((failures + 1))
  fi
}

echo 'Terraform: Fundamentals environment check'
echo

check_command terraform
check_command git
check_command python3
check_command make

echo
if command -v terraform >/dev/null 2>&1; then
  terraform version | head -n 2
fi

if command -v docker >/dev/null 2>&1; then
  printf '[OPT]  docker       installed\n'
else
  printf '[OPT]  docker       not installed; only the optional Docker example requires it\n'
fi

if command -v tflint >/dev/null 2>&1; then
  printf '[OPT]  tflint       installed\n'
else
  printf '[OPT]  tflint       not installed\n'
fi

if [[ "$failures" -gt 0 ]]; then
  echo
  echo "$failures required command(s) are missing."
  exit 1
fi

echo
echo 'Required commands are available.'
