# ───────────────────────────────────────────────────────────────
# Powerlevel10k instant prompt
# ───────────────────────────────────────────────────────────────

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ───────────────────────────────────────────────────────────────
# Oh My Zsh
# ───────────────────────────────────────────────────────────────

export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    sudo
    command-not-found
    docker
    kubectl
    terraform
    ansible
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source "$ZSH/oh-my-zsh.sh"


# ───────────────────────────────────────────────────────────────
# Powerlevel10k
# ───────────────────────────────────────────────────────────────

[[ -f "$HOME/.p10k.zsh" ]] && source "$HOME/.p10k.zsh"


# ───────────────────────────────────────────────────────────────
# Environment
# ───────────────────────────────────────────────────────────────

export EDITOR="nano"
export VISUAL="nano"

export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

export PATH="$HOME/.local/bin:$HOME/bin:$PATH"


# ───────────────────────────────────────────────────────────────
# Completion
# ───────────────────────────────────────────────────────────────

autoload -Uz compinit
compinit


# ───────────────────────────────────────────────────────────────
# History
# ───────────────────────────────────────────────────────────────

HISTFILE="$HOME/.zsh_history"
HISTSIZE=100000
SAVEHIST=100000

setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_save_no_dups
setopt inc_append_history
setopt share_history


# ───────────────────────────────────────────────────────────────
# Shell behavior
# ───────────────────────────────────────────────────────────────

setopt auto_cd
setopt multios
setopt pushd_ignore_dups


# ───────────────────────────────────────────────────────────────
# FZF
# ───────────────────────────────────────────────────────────────

if command -v fzf >/dev/null 2>&1; then
    source <(fzf --zsh)
fi


# ───────────────────────────────────────────────────────────────
# Zoxide
# ───────────────────────────────────────────────────────────────

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh)"
fi


# ───────────────────────────────────────────────────────────────
# Minimal aliases
# ───────────────────────────────────────────────────────────────

alias c='clear'
alias q='exit'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias ll='ls -lah'
alias la='ls -A'
alias l='ls -CF'

alias grep='grep --color=auto'


# ───────────────────────────────────────────────────────────────
# Better CLI tools
# ───────────────────────────────────────────────────────────────

if command -v eza >/dev/null 2>&1; then
    alias ls='eza --icons'
    alias ll='eza -lah --icons --git'
    alias la='eza -a --icons'
fi

if command -v bat >/dev/null 2>&1; then
    alias cat='bat --paging=never'
elif command -v batcat >/dev/null 2>&1; then
    alias cat='batcat --paging=never'
fi


# ───────────────────────────────────────────────────────────────
# Small useful functions
# ───────────────────────────────────────────────────────────────

mkcd() {
    mkdir -p -- "$1" && cd -- "$1"
}

# Docker Desktop
if [[ -n "${WSL_DISTRO_NAME:-}" ]]; then
    export PATH="/mnt/c/Users/itsmahammad/AppData/Local/Programs/DockerDesktop/resources/bin:$PATH"
fi

# ───────────────────────────────────────────────────────────────
# Reload config
# ───────────────────────────────────────────────────────────────

alias reload='source ~/.zshrc'

eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv zsh)"
# Быстрый переход к дискам и папкам Windows
alias cdc="cd /mnt/c"
if [[ -n "${WSL_DISTRO_NAME:-}" ]]; then
    alias cdwin="cd /mnt/c/Users/itsmahammad"
    alias cddesk="cd /mnt/c/Users/itsmahammad/Desktop"
    alias cddown="cd /mnt/c/Users/itsmahammad/Downloads"
fi
