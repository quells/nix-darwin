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
    trash "$HOME/$DST"
    ln -s "$DIR/$SRC" "$HOME/$DST"
    return
}

copy 'dotfiles/.bc' '.bc'
