#!/usr/bin/env bash
set -euo pipefail

script_name=$(basename "${BASH_SOURCE[-1]}")

### Check for presence of other tools
# JQ
hash jq 2> /dev/null || {
  echo >&2 "$script_name requires 'jq' but it's not installed: https://github.com/stedolan/jq/wiki/Installation"
  exit 1
}
