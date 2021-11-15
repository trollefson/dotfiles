# If not running interactively, don't do anything
# [ -z "$PS1" ] && return

# Source configs
source ~/alias

# Export
export EDITOR=vim
export GIT_EDITOR=vim
export LSCOLORS="gxfxcxdxbxegedabagacad"
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTCONTROL=ignoredups:erasedups

# Add git status to tmux powerline
# export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Setting minimum Mac OS Version for clang builds
export MACOSX_DEPLOYMENT_TARGET=10.14
