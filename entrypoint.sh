#!/usr/bin/env bash

set -eu

name="${INPUT_NAME:-"$(date +%4Y.%m.%d-"${GITHUB_SHA:0:6}")-RELEASE"}"

echo "Creating release with tag ${name}" >&2

export GITHUB_USER="${GITHUB_ACTOR}"
export GITHUB_TOKEN="${INPUT_GITHUB_TOKEN}"

hub release create "${name}" \
  --commitish="${GITHUB_SHA}" \
  --message="${name}" \
  "$([[ -n "${INPUT_PATH:-}" ]] && echo "--attach=${INPUT_PATH}")"
