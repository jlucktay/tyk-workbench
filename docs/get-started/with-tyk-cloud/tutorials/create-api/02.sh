#!/usr/bin/env bash
set -euo pipefail

TYK_ROOT=$( dirname "${BASH_SOURCE[0]}" )/../../../../..

for lib in "${TYK_ROOT}"/lib/*.sh; do
    # shellcheck disable=SC1090
    source "$lib"
done

tyk::token

curl \
    --data @"${script_dir:-}/02.json" \
    --header "Authorization: ${token:-}" \
    --header "Content-Type: application/json" \
    --request POST \
    --silent \
    https://admin.cloudv2.tyk.io/api/apis/ \
    | jq
