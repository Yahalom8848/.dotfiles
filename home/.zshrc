# ===================================================================
# * Environment variables
# ===================================================================

export PATH="$HOME/.cargo/bin:$PATH"

export EDITOR="nvim"

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

alias clear="clear && fastfetch"
alias cd..="cd .."
alias e="exit"

# ===================================================================
# * Commands
# ===================================================================

fastfetch
