#!/usr/bin/env bash
set -euo pipefail

readonly TYK_ROOT="$(cd "$(dirname "${BASH_SOURCE[-1]}")" &> /dev/null && git rev-parse --show-toplevel)"

for lib in "${TYK_ROOT}"/lib/*.sh; do
  # shellcheck disable=SC1090
  source "$lib"
done

curl \
    --header "Authorization: ${token:-}" \
    --request GET \
    --silent \
    "https://admin.cloudv2.tyk.io/api/apis/5dc04d2deafe810001a9a85b" \
    | jq
