#!/bin/bash
set -e

echo "==> Installing dotfiles with chezmoi..."

# Install Homebrew if not present
if ! command -v brew &> /dev/null; then
    echo "==> Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" < /dev/tty

    # Add Homebrew to PATH for Apple Silicon
    if [[ -d /opt/homebrew ]]; then
        eval "$(/opt/homebrew/bin/brew shellenv)"
    fi
fi

# Install chezmoi if not present
if ! command -v chezmoi &> /dev/null; then
    echo "==> Installing chezmoi..."
    brew install chezmoi
fi

# Initialize and apply dotfiles
echo "==> Applying dotfiles..."
chezmoi init --apply mitu217

echo "==> Done!"
