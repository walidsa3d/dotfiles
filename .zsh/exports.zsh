# Currently this path is appended to dynamically when picking a ruby version
# zshenv has already started PATH with rbenv so append only here
export PATH="/home/walid/bin/localbin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"
export CDPATH='~/Desktop:/mnt/store'
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export SSH_KEY_PATH="~/.ssh/dsa_id"

export ZSH=$HOME/ohmyzsh

# Setup terminal, and turn on colors
#export TERM=xterm-256color
#export CLICOLOR=1
#export LSCOLORS=Gxfxcxdxbxegedabagacad

# Enable color in grep
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='3;33'

export LESS='--ignore-case --raw-control-chars'
export PAGER='less -e'
export EDITOR='vim'

# Compilation flags
export ARCHFLAGS="-arch x86_64"
export LANG=en_US.UTF-8
export PYTHONSTARTUP="$HOME/.pythonrc"
