#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
EXTRA_DIR="$HOME/.extra"

# Update dotfiles itself first
[ -d "$DOTFILES_DIR/.git" ] && git --work-tree="$DOTFILES_DIR" --git-dir="$DOTFILES_DIR/.git" pull origin master

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/tmux/.tmux-powerline" ~
ln -sfv "$DOTFILES_DIR/ctags/.ctags" ~

# Package managers & packages
if [ "$(uname)" == "Linux" ]; then
  OS="$(lsb_release -i | cut -f 2-)"
  if [ $OS ==  "Ubuntu" ]; then 
    ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~/.bashrc
    . "$DOTFILES_DIR/install/ubuntu/bash.sh"
    . "$DOTFILES_DIR/install/ubuntu/npm.sh"
    . "$DOTFILES_DIR/install/ubuntu/pip.sh"
    export JAVA_HOME=/usr/bin
    export PATH=$JAVA_HOME:$PATH

    # Download and set powerline fonts
    wget https://github.com/powerline/powerline/raw/develop/font/PowerlineSymbols.otf
    mkdir -p ~/.fonts
    mv PowerlineSymbols.otf ~/.fonts/
    fc-cache -vf ~/.fonts/
  else 
    OS="CentOS7"
    ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~/.bashrc
    . "$DOTFILES_DIR/install/centos7/bash.sh"
    . "$DOTFILES_DIR/install/centos7/npm.sh"
    . "$DOTFILES_DIR/install/centos7/pip.sh"
    # Set JAVA_HOME manually on CentOS7
  fi
fi

if [ "$(uname)" == "Darwin" ]; then
  ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
  . "$DOTFILES_DIR/install/macos/bash.sh"
  . "$DOTFILES_DIR/install/macos/npm.sh"
  . "$DOTFILES_DIR/install/macos/brew.sh"
  . "$DOTFILES_DIR/install/macos/brew-cask.sh"
  export JAVA_HOME=$(/usr/libexec/java_home) 
fi


# Install Vim Plugins from vim/.vimrc
vim +PluginInstall +qall
