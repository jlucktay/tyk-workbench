#!/usr/bin/env bash
set -euo pipefail

echo "100.general.sh - start"

# shellcheck disable=SC2034
script_name=$( basename "${BASH_SOURCE[-1]}" )

# shellcheck disable=SC2034
script_dir="$( cd "$( dirname "${BASH_SOURCE[-1]}" )" >/dev/null 2>&1 && pwd )"

### Check for presence of other tools
# JQ
hash jq 2>/dev/null || {
    echo >&2 "$script_name requires 'jq' but it's not installed: https://github.com/stedolan/jq/wiki/Installation"
    exit 1
}

echo "100.general.sh - finish"
