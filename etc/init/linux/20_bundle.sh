#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Load vital library that is most important and
# constructed with many minimal functions
. "$DOTPATH"/etc/lib/vital.sh

# This script is only supported with Linux
if ! is_linux; then
    log_fail "error: this script is only supported with linux"
    exit 1
fi

if has "brew"; then
    builtin cd "$DOTPATH"/etc/init/linux/assets
    if [ ! -f Brewfile ]; then
        brew bundle dump
    fi

    brew bundle
else
    log_fail "error: require: brew"
    exit 1
fi

log_pass "brew: tapped successfully"
