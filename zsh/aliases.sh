#!/usr/bin/env zsh

CONFIG="$HOME/.config"
ZSH_CONFIG="$CONFIG/zsh"
NVIM_CONFIG="$CONFIG/nvim"

alias vim="nvim"

alias Rprofile="vim $ZSH_CONFIG/aliases.sh"
alias Rvim="cd $NVIM_CONFIG/; vim $NVIM_CONFIG/; cd -"
alias Rsource="source $ZSH_CONFIG/aliases.sh"

alias say_done="say done -v Flo"

# Mistypes
alias claer=clear

# Canonically in /Users/robinef/.config/zsh/aliases/
for f in $(ls $ZSH_CONFIG/aliases/*.sh); do source $f; done
