#!/usr/bin/env bash
set -euo pipefail

function tyk::token(){
    ### Check for presence of other tools
    # JQ
    hash jq 2>/dev/null || {
        echo >&2 "${script_name:-} requires 'jq' but it's not installed: https://github.com/stedolan/jq/wiki/Installation"
        exit 1
    }

    test -f "${script_dir:-}/token.json" || {
        echo >&2 "$script_name requires '$script_dir/token.json' but it was not found."
        exit 1
    }

    token=$( jq --raw-output '.token' "$script_dir/token.json" )

    test "$token" = "null" && {
        echo >&2 "'$script_dir/token.json' did not contain a value under the 'token' key."
        exit 1
    }
}
