#!/usr/bin/env bash
set -euo pipefail

echo "200.token.sh - start"

function tyk::token(){
    echo "tyk::token() start"

    test -f "${TYK_ROOT:-}/lib/token.json" || {
        echo >&2 "${script_name:-} requires '$TYK_ROOT/lib/token.json' but it was not found."
        exit 1
    }

    token=$( jq --raw-output '.token' "$TYK_ROOT/lib/token.json" )

    test "$token" = "null" && {
        echo >&2 "'$TYK_ROOT/lib/token.json' did not contain a value under the 'token' key."
        exit 1
    }

    echo "tyk::token() finish"
}

echo "200.token.sh - finish"
