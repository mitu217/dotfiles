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
    log_pass "brew: already installed"
    exit
fi

# Install dependencies
sudo apt install build-essential curl file git

# Install brew
echo "export PATH=\"/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH\"" >> ~/.profile
source ~/.profile
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
if ! has "brew"; then
    log_fail "error: brew: failed to install"
    exit 1
fi

log_pass "brew: installed successfully"
