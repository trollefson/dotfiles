# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)
READLINK=$(which greadlink)
CURRENT_SCRIPT=$BASH_SOURCE
if [[ -n $CURRENT_SCRIPT && -x "$READLINK" ]]; then
  SCRIPT_PATH=$($READLINK -f "$CURRENT_SCRIPT")
  DOTFILES_DIR=$(dirname "$(dirname "$SCRIPT_PATH")")
elif [ -d "$HOME/.dotfiles" ]; then
  DOTFILES_DIR="$HOME/.dotfiles"
else
  echo "Unable to find dotfiles, exiting."
  return # `exit 1` would quit the shell itself
fi

# Source the dotfiles
for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.osx; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export
export DOTFILES_DIR
export EDITOR=vim
export GIT_EDITOR=vim
export LSCOLORS="gxfxcxdxbxegedabagacad"
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTCONTROL=ignoredups:erasedups

# Add git status to tmux powerline
export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Setting minimum Mac OS Version for clang builds
export MACOSX_DEPLOYMENT_TARGET=10.14
