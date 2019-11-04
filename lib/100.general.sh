#!/usr/bin/env bash
set -euo pipefail

# shellcheck disable=SC2034
script_name=$( basename "${BASH_SOURCE[-1]}" )

# shellcheck disable=SC2034
script_dir="$( cd "$( dirname "${BASH_SOURCE[-1]}" )" >/dev/null 2>&1 && pwd )"
