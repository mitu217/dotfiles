#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Load vital library that is most important and
# constructed with many minimal functions
. "$DOTPATH"/etc/lib/vital.sh

if ! has "python3"; then
    log_fail "error: python3 is not installed"
    exit 1
fi

# Install dein.vim
if [ -e ~/.vim ]; then
    log_pass "dein.vim: already installed"
else
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh)" -- ~/.vim
fi
