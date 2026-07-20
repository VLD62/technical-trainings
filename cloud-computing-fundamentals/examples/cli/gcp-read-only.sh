#!/usr/bin/env bash
set -euo pipefail

command -v gcloud >/dev/null 2>&1 || { echo "Google Cloud CLI is not installed." >&2; exit 1; }

echo "Google Cloud CLI version:"
gcloud version

echo
echo "Active account:"
gcloud auth list --filter=status:ACTIVE --format='table(account,status)'

echo
echo "Current configuration:"
gcloud config list

echo
echo "Accessible projects:"
gcloud projects list --format='table(projectId,name,lifecycleState)'
