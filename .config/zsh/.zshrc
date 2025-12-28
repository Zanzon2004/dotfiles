# main zsh settings. env in ~/.zprofile

# --- Paths to config files ---
ZSH_OPTS="$XDG_CONFIG_HOME/zsh/opts.zsh"
ZSH_PROMPT="$XDG_CONFIG_HOME/zsh/prompt.zsh"
ZSH_HIGHLIGHT="$XDG_CONFIG_HOME/zsh/highlighting.zsh"
ALIASRC="$XDG_CONFIG_HOME/shell/aliasrc"

# --- Environment & Aliases ---
# To ensure XDG_CONFIG_HOME always has a value if not specified in the profile
: "${XDG_CONFIG_HOME:=$HOME/.config}"
[ -f "$ALIASRC" ] && source "$ALIASRC"

# --- Zsh Modules and Opts---
zmodload zsh/complist
autoload -U compinit && compinit
autoload -U colors && colors
[ -f "$ZSH_OPTS" ] && source "$ZSH_OPTS" # main opts

# --- fzf Integration ---
command -v fzf &>/dev/null && source <(fzf --zsh)

# --- Keybindings ---
bindkey -v # vim binds
bindkey '^R' fzf-history-widget # cycle hist with fzf

# --- zoxide ---
command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# --- Prompt / Banner ---
[ -f "$ZSH_PROMPT" ] && source "$ZSH_PROMPT"

# --- Plugins ---
# source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
[ -f "$ZSH_HIGHLIGHT" ] && source "$ZSH_HIGHLIGHT"
