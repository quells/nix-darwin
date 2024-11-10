#!/usr/bin/env bash

set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

function trash() {
    F=$1; shift;
    set +e
    rm "$F" 2>/dev/null
    set -e
}

function copy() {
    SRC=$1; shift
    DST=$1; shift
    echo "copy $DST"
    trash "$DST"
    ln -s "$SRC" "$DST"
    return
}

mkdir -p "$HOME/.config/fish/completions"
mkdir -p "$HOME/.config/fish/conf.d"
mkdir -p "$HOME/.config/fish/functions"

TRIM="$DIR/dotfiles/"
for f in $(find dotfiles -type f)
do
    f="$( realpath "$f" )"
    copy "$f" "$HOME/${f#"$TRIM"}"
done
