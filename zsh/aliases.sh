#!/usr/bin/env zsh

CONFIG="$HOME/.config"
ZSH_CONFIG="$CONFIG/zsh"

alias vim="nvim"
alias jvim="nvim"

alias Rprofile="vim $ZSH_CONFIG/aliases.sh"
alias Rsource="source $ZSH_CONFIG/aliases.sh"

alias say_done="say done -v Flo"

for f in $(ls $ZSH_CONFIG/aliases/*.sh); do source $f; done
