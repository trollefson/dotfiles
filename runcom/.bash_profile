# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# Get OS
if [ "$(uname -s)" = "Darwin" ]; then
  OS="OSX"
elif [ "$(lsb_release -i | cut -f 2-)" == "Ubuntu" ]; then
  OS="Ubuntu"
else
  OS="CentOS7"
fi

# Resolve DOTFILES_DIR (assuming ~/.dotfiles on distros without readlink and/or $BASH_SOURCE/$0)

if [ "$OS" == "OSX" ]; then
    READLINK=$(which greadlink)
    PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
else
    READLINK=$(which readlink)
fi

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

# Finally we can source the dotfiles (order matters)
for DOTFILE in "$DOTFILES_DIR"/system/.{function,function_*,path,env,alias,prompt,nvm,custom}; do
  [ -f "$DOTFILE" ] && . "$DOTFILE"
done

if [ "$OS" = "OSX" ]; then
  for DOTFILE in "$DOTFILES_DIR"/system/.{env,alias,function}.osx; do
    [ -f "$DOTFILE" ] && . "$DOTFILE"
  done
fi

# Hook for extra/custom stuff
EXTRA_DIR="$HOME/.extra"
if [ -d "$EXTRA_DIR" ]; then
  for EXTRAFILE in "$EXTRA_DIR"/runcom/*.sh; do
    [ -f "$EXTRAFILE" ] && . "$EXTRAFILE"
  done
fi

# Clean up
unset READLINK CURRENT_SCRIPT SCRIPT_PATH DOTFILE

# Export
export OS DOTFILES_DIR EXTRA_DIR
export WORKON_HOME=$HOME/.virtualenvs
export EDITOR=vim
export GIT_EDITOR=vim
export LSCOLORS="gxfxcxdxbxegedabagacad"
export HISTFILESIZE=20000
export HISTSIZE=10000
export HISTCONTROL=ignoredups:erasedups

# shopt -s histappend
# Add git status to tmux powerline
export PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# Enable virtualenvwrapper
if [ "$OS" == "CentOS7" ]; then
    source /usr/bin/virtualenvwrapper.sh
else
    source /usr/local/bin/virtualenvwrapper.sh
fi

# Setting PATH for Python 3.6
PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:${PATH}"
export PATH

# Setting PATH for Python 3.6 user installs
PATH="/Users/trollefson/Library/Python/3.6/bin:${PATH}"
export PATH

# Setting minimum Mac OS Version for clang builds
export MACOSX_DEPLOYMENT_TARGET=10.14

# Include gem installs on path
PATH="/usr/local/lib/ruby/gems/2.6.0/bin/:${PATH}"
export PATH

# Include sphinx-doc on path
PATH="/usr/local/opt/sphinx-doc/bin:$PATH"
export PATH


# libarchive-c path
export LIBARCHIVE=/usr/local/Cellar/libarchive/3.4.0/lib/libarchive.13.dylib
