#!/usr/bin/env bash
set -euo pipefail

echo "201.key.sh - start"

function tyk::key(){
    echo "tyk::key() start"

    test -f "${TYK_ROOT:-}/lib/key.json" || {
        echo >&2 "${script_name:-} requires '$TYK_ROOT/lib/key.json' but it was not found."
        exit 1
    }

    key=$( jq --raw-output '.key' "$TYK_ROOT/lib/key.json" )

    test "$key" = "null" && {
        echo >&2 "'$TYK_ROOT/lib/key.json' did not contain a value under the 'key' key."
        exit 1
    }

    echo "tyk::key() finish"
}

echo "201.key.sh - finish"
