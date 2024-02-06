# ===================================================================
# * Environment variables
# ===================================================================

EDITOR="vim"

# ===================================================================
# * Sources
# ===================================================================

source "/usr/share/zsh-antidote/antidote.zsh"
antidote load

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===================================================================
# * Aliases
# ===================================================================

alias vim="nvim"
alias clear="clear && neofetch"
alias cd..="cd .."

# ===================================================================
# * Commands
# ===================================================================

neofetch
