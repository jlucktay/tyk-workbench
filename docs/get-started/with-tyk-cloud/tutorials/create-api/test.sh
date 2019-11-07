#!/usr/bin/env bash
set -euo pipefail

TYK_ROOT=$( dirname "${BASH_SOURCE[0]}" )/../../../../..

for lib in "${TYK_ROOT}"/lib/*.sh; do
    # shellcheck disable=SC1090
    source "$lib"
done

tyk::key

curl \
    --header "Authorization: ${key:-}" \
    --header "Foo: Bar" \
    --request GET \
    --silent \
    --verbose \
    "https://jlucktay.cloudv2.tyk.io/test-api/get?foo=bar"
