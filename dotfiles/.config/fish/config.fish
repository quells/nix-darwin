devbox global shellenv --init-hook | source

source (starship init fish --print-full-init | psub)

set fish_greeting # Disable greeting
set -x BC_ENV_ARGS $HOME/.bc

alias bc='bc -lq'
alias gpu='git push -u origin (git branch --show-current)'
alias vim=(which nvim)

