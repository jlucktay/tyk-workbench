#!/usr/bin/env bash
set -euo pipefail

readonly TYK_ROOT="$(cd "$(dirname "${BASH_SOURCE[-1]}")" &> /dev/null && git rev-parse --show-toplevel)"

for lib in "${TYK_ROOT}"/lib/*.sh; do
  # shellcheck disable=SC1090
  source "$lib"
done

curl \
  --data @"${script_dir:?}/create-api-token.json" \
  --header "Authorization: $(tyk::token)" \
  --header "Content-Type: application/json" \
  --request POST \
  --silent \
  https://admin.cloudv2.tyk.io/api/keys
