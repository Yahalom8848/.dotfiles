# ===================================================================
# * Environment variables
# ===================================================================

export EDITOR="vim"

export KEYTIMEOUT=1

export LESS="-R"
export FZF_DEFAULT_OPTS="
    --color=info:#7aa2f7,prompt:#7aa2f7,pointer:#7dcfff
    --bind=ctrl-p:toggle-preview
    --preview 'less {}'"

# ===================================================================
# * Sources
# ===================================================================

[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh

source "/usr/share/zsh-antidote/antidote.zsh"
antidote load

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# ===================================================================
# * Configuration
# ===================================================================

bindkey -v

# ===================================================================
# * Aliases
# ===================================================================

alias ls="eza --icons=always"
alias ll="ls -lha"
alias lt="ls -T"

alias cat="bat"

alias vim="nvim"

alias clear="clear && neofetch"
alias cd..="cd .."

# ===================================================================
# * Commands
# ===================================================================

neofetch
