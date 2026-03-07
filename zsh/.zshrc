# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set to no theme as Starship will set this 
ZSH_THEME=""

# Be able to use - or _ while searching
HYPHEN_INSENSITIVE="true"

# Disable automatic window titles
DISABLE_AUTO_TITLE="true"

# Will surface real commands when similar typos are inputted
ENABLE_CORRECTION="false"

# Show ... when waiting for auto-complete to render
COMPLETION_WAITING_DOTS="true"

# Show mm-dd under history command entries
HIST_STAMPS="%m-%d"

# Standard plugins go here
# Custom plugins get added to $ZSH_CUSTOM/plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-bat
  zsh-completions
  you-should-use
)

# Source our config
source $ZSH/oh-my-zsh.sh

# Catppuccin Mocha setup for fzf
export FZF_DEFAULT_OPTS=" \
--color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
--color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
--color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
--color=selected-bg:#45475A \
--color=border:#6C7086,label:#CDD6F4 \
--bind='up:ignore,down:ignore,left:ignore,right:ignore'"

# Setup fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Setup zoxide for smarter cd
eval "$(zoxide init zsh)"

# Use vim over SSH but neovim locally
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='nvim'
fi

# Re-export PATH
export PATH="$HOME/.local/bin:$PATH"

# Enable VI mode
bindkey -v

# Setup 'v' key to open command in $EDITOR
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd 'v' edit-command-line

# Accept zsh-autosuggestions suggestions with Ctrl+E in VI mode
bindkey -M viins '^E' end-of-line

# Lower mode switch timeout from insert to normal
export KEYTIMEOUT=1

# Unbind arrow keys to force hjkl usage
noop() { }
zle -N noop

# Disable arrow keys in normal and insert mode (SS3 and CSI formats)
bindkey -M vicmd '\eOA' noop
bindkey -M vicmd '\eOB' noop
bindkey -M vicmd '\eOC' noop
bindkey -M vicmd '\eOD' noop
bindkey -M viins '\eOA' noop
bindkey -M viins '\eOB' noop
bindkey -M viins '\eOC' noop
bindkey -M viins '\eOD' noop
bindkey -M vicmd '\e[A' noop
bindkey -M vicmd '\e[B' noop
bindkey -M vicmd '\e[C' noop
bindkey -M vicmd '\e[D' noop
bindkey -M viins '\e[A' noop
bindkey -M viins '\e[B' noop
bindkey -M viins '\e[C' noop
bindkey -M viins '\e[D' noop

# Vi mode indicator for Starship right prompt
function _set_vi_mode() {
  case $KEYMAP in
    vicmd)
      export STARSHIP_VI_NORMAL="N"
      export STARSHIP_VI_INSERT=""
      ;;
    *)
      export STARSHIP_VI_NORMAL=""
      export STARSHIP_VI_INSERT="I"
      ;;
  esac
}

# Show VI mode on the prompt
function zle-keymap-select {
  _set_vi_mode
}
function zle-line-init {
  export STARSHIP_VI_NORMAL=""
  export STARSHIP_VI_INSERT="I"
}
zle -N zle-keymap-select
zle -N zle-line-init
function _reset_vi_mode_precmd() {
  export STARSHIP_VI_NORMAL=""
  export STARSHIP_VI_INSERT="I"
}
precmd_functions+=(_reset_vi_mode_precmd)

# Setup Starship
# Needs to be last to avoid race conditions
eval "$(starship init zsh)"

# Aliases
alias cl='clear'
alias oc='opencode'
