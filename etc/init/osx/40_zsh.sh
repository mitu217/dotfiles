#!/bin/bash

# Stop script if errors occur
trap 'echo Error: $0:$LINENO stopped; exit 1' ERR INT
set -eu

# Load vital library that is most important and
# constructed with many minimal functions
. "$DOTPATH"/etc/lib/vital.sh

# exit with true if you have zsh command
if has "zsh"; then
    log_pass "go: already installed"
    exit
fi

if has "brew"; then
    log_echo "Install zsh with Homebrew"
    brew install zsh
else
    log_fail "error: require: Homebrew or MacPorts"
    exit 1
fi