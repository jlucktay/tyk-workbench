#!/usr/bin/env bash
set -euo pipefail

TYK_ROOT=$( dirname "${BASH_SOURCE[0]}" )/../../..

for lib in "${TYK_ROOT}"/lib/*.sh; do
    # shellcheck disable=SC1090
    source "$lib"
done

# tyk::token

curl \
    --header "admin-auth: 12345" \
    --request GET \
    --verbose \
    "https://admin.cloudv2.tyk.io/admin/organisations/5dbc41a8c7cb220001e9c1e3" #\
    # | jq
