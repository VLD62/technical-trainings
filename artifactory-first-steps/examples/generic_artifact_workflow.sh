#!/usr/bin/env bash
set -euo pipefail

# Generic Artifactory workflow example.
# Replace all placeholder values before use.
# Do not commit real tokens, usernames, passwords, or internal URLs.

ARTIFACTORY_URL="https://artifactory.example.com/artifactory"
REPOSITORY="example-generic-dev"
ARTIFACT_NAME="sample-artifact.txt"
ARTIFACT_VERSION="1.0.0"
TARGET_PATH="sample-app/${ARTIFACT_VERSION}/${ARTIFACT_NAME}"

# Prefer access tokens from environment variables.
: "${ARTIFACTORY_TOKEN:?Set ARTIFACTORY_TOKEN before running this script}"

echo "Creating sample artifact..."
echo "Sample artifact version ${ARTIFACT_VERSION}" > "${ARTIFACT_NAME}"

echo "Uploading artifact..."
curl \
  --fail \
  --header "Authorization: Bearer ${ARTIFACTORY_TOKEN}" \
  --upload-file "${ARTIFACT_NAME}" \
  "${ARTIFACTORY_URL}/${REPOSITORY}/${TARGET_PATH}"

echo "Downloading artifact for verification..."
curl \
  --fail \
  --header "Authorization: Bearer ${ARTIFACTORY_TOKEN}" \
  --output "downloaded-${ARTIFACT_NAME}" \
  "${ARTIFACTORY_URL}/${REPOSITORY}/${TARGET_PATH}"

echo "Comparing files..."
cmp "${ARTIFACT_NAME}" "downloaded-${ARTIFACT_NAME}"

echo "Workflow completed successfully."
