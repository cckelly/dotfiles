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

# Add Homebrew to PATH for the current session (needed after a fresh install)
if [[ -x /opt/homebrew/bin/brew ]]; then
  eval "$(/opt/homebrew/bin/brew shellenv zsh)"
elif [[ -x /usr/local/bin/brew ]]; then
  eval "$(/usr/local/bin/brew shellenv zsh)"
fi

# Install Brew packages (includes stow)
echo "Installing Homebrew packages..."
brew bundle --file="$DOTFILES_DIR/Brewfile"

# Install Oh My Zsh if not already installed
if [[ ! -d "$HOME/.oh-my-zsh" ]]; then
  echo "Installing Oh My Zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Install Oh My Zsh custom plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

OMZ_PLUGINS=(
  "zsh-autosuggestions|https://github.com/zsh-users/zsh-autosuggestions"
  "zsh-syntax-highlighting|https://github.com/zsh-users/zsh-syntax-highlighting"
  "zsh-bat|https://github.com/fdellwing/zsh-bat"
  "zsh-completions|https://github.com/zsh-users/zsh-completions"
  "you-should-use|https://github.com/MichaelAquilina/zsh-you-should-use"
)

for entry in "${OMZ_PLUGINS[@]}"; do
  plugin="${entry%%|*}"
  url="${entry##*|}"
  plugin_dir="$ZSH_CUSTOM/plugins/$plugin"
  if [[ ! -d "$plugin_dir" ]]; then
    echo "Installing Oh My Zsh plugin: $plugin..."
    git clone "$url" "$plugin_dir"
  fi
done

# Install TPM (Tmux Plugin Manager) if not already installed
TPM_DIR="$HOME/.tmux/plugins/tpm"
if [[ ! -d "$TPM_DIR" ]]; then
  echo "Installing Tmux Plugin Manager (TPM)..."
  git clone https://github.com/tmux-plugins/tpm "$TPM_DIR"
fi

# Stow all config packages and setup symlinks
cd "$DOTFILES_DIR"
for dir in */; do
  dir=${dir%/}
  # Skip non-stow directories
  [[ "$dir" == ".git" ]] && continue
  echo "Stowing $dir..."
  stow -v --target="$HOME" "$dir"
done

# Install tmux plugins via TPM (non-interactive)
echo "Installing tmux plugins..."
"$TPM_DIR/bin/install_plugins"

echo "Configuration complete!"

