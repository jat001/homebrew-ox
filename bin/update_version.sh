#!/usr/bin/env bash

set -euxo pipefail

cd "$(dirname "$(dirname "$(realpath "$0")")")"

PUSH=0

while :; do
    case "${1-}" in
        -p | --push) PUSH=1 ;;

        -h | --help)
        echo "Usage: $0 [options]"
        echo 'Options:'
        echo '  -p, --push    Push changes to remote'
        echo '  -h, --help    Display this help message'
        exit
        ;;

        *)
        [ -z "${1-}" ] && break

        echo "Unknown option: $1" >&2
        echo "For help, run: $0 -h" >&2
        exit 1
        ;;
    esac
    shift
done

brew livecheck --tap jat001/ox --newer-only --cask

brew livecheck --tap jat001/ox --newer-only --json --quiet --cask |
        jq -c '.[]' | while read -r cask; do
    name="$(jq -r '.cask' <<<"$cask")"
    version="$(jq -r '.version.latest' <<<"$cask")"

    brew bump-cask-pr --write-only --commit --version "$version" "jat001/ox/$name"
done

[ "$PUSH" -gt 0 ] && git push origin master

echo 'Done'
