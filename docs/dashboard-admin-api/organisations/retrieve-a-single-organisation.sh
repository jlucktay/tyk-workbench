#!/usr/bin/env bash
set -euo pipefail

readonly TYK_ROOT="$(cd "$(dirname "${BASH_SOURCE[-1]}")" &> /dev/null && git rev-parse --show-toplevel)"

for lib in "${TYK_ROOT}"/lib/*.sh; do
  # shellcheck disable=SC1090
  source "$lib"
done

curl \
  --header "admin-auth: 12345" \
  --request GET \
  --verbose \
  "https://admin.cloudv2.tyk.io/admin/organisations/5dbc41a8c7cb220001e9c1e3"
