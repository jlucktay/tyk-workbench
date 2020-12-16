#!/usr/bin/env bash
set -euo pipefail

readonly TYK_ROOT="$(cd "$(dirname "${BASH_SOURCE[-1]}")" &> /dev/null && git rev-parse --show-toplevel)"

for lib in "${TYK_ROOT}"/lib/*.sh; do
  # shellcheck disable=SC1090
  source "$lib"
done

curl \
  --header "Authorization: $(tyk::key)" \
  --header "Foo: Bar" \
  --request GET \
  --silent \
  --verbose \
  "https://jlucktay.cloudv2.tyk.io/test-api/get?foo=bar"
