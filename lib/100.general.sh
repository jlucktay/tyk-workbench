#!/usr/bin/env bash
set -euo pipefail

echo "100.general.sh - start"

script_name=$(basename "${BASH_SOURCE[-1]}")

### Check for presence of other tools
# JQ
hash jq 2> /dev/null || {
  echo >&2 "$script_name requires 'jq' but it's not installed: https://github.com/stedolan/jq/wiki/Installation"
  exit 1
}

echo "100.general.sh - finish"
