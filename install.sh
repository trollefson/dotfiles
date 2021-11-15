#!/usr/bin/env bash

# Get current dir (so run this script from anywhere)
DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Bunch of symlinks
ln -sfv "$DOTFILES_DIR/runcom/.inputrc" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
ln -sfv "$DOTFILES_DIR/vim/.vimrc" ~
ln -sfv "$DOTFILES_DIR/vim/flake8" ~/.config/flake8
ln -sfv "$DOTFILES_DIR/tmux/.tmux.conf" ~
ln -sfv "$DOTFILES_DIR/tmux/.tmux-powerline" ~
ln -sfv "$DOTFILES_DIR/ctags/.ctags" ~

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
