#!/usr/bin/env bash

# Exit immediately if we hit any errors
set -e

# Figure out where dotfiles were cloned
DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "Configuring system from $DOTFILES_DIR..."

# Install Homebrew if not found
if ! command -v brew &>/dev/null; then
  echo "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Install Brew packages (includes stow)
echo "Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# Stow all config packages and setup symlinks
cd "$DOTFILES_DIR"
for dir in */; do
  dir=${dir%/}
  # Skip non-stow directories
  [[ "$dir" == ".git" ]] && continue
  echo "Stowing $dir..."
  stow -v --target="$HOME" "$dir"
done

echo "Configuration complete!"
