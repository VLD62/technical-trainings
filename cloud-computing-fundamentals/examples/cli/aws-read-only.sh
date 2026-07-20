#!/usr/bin/env bash
set -euo pipefail

command -v aws >/dev/null 2>&1 || { echo "AWS CLI is not installed." >&2; exit 1; }

echo "AWS CLI version:"
aws --version

echo
echo "Caller identity:"
aws sts get-caller-identity --output table

echo
echo "Configured default region:"
aws configure get region || true

echo
echo "Enabled regions visible to the current identity:"
aws ec2 describe-regions --query 'Regions[].RegionName' --output table
