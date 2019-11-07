#!/usr/bin/env bash
set -euo pipefail

TYK_ROOT=$( dirname "${BASH_SOURCE[0]}" )/../../..

for lib in "${TYK_ROOT}"/lib/*.sh; do
    # shellcheck disable=SC1090
    source "$lib"
done

tyk::token

curl \
    --header "Authorization: ${token:-}" \
    --request GET \
    --silent \
    "https://admin.cloudv2.tyk.io/api/apis/5dc04d2deafe810001a9a85b" \
    | jq
