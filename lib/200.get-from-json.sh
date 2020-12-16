#!/usr/bin/env bash
set -euo pipefail

# $1 - JSON file path
# $2 - key/path within JSON file to return the value of
function tyk::get_from_json() {
  if [ -z "${1:-}" ]; then
    echo >&2 "must provide a file path to ${FUNCNAME[0]}"
    exit 1
  fi

  if [ -z "${2:-}" ]; then
    echo >&2 "must provide a JSON key/path to ${FUNCNAME[0]}"
    exit 1
  fi

  if [ ! -r "$1" ]; then
    echo >&2 "${script_name:?} cannot read '$1'."
    exit 1
  fi

  if ! value=$(jq --exit-status --raw-output ''"$2"'' "$1"); then
    echo >&2 "'$1' did not contain a value under the '$2' key."
    exit 1
  fi

  echo "$value"
}

function tyk::key() {
  tyk::get_from_json "${TYK_ROOT:?}/lib/key.json" ".key"
}

function tyk::token() {
  tyk::get_from_json "$TYK_ROOT/lib/token.json" ".token"
}
