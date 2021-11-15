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
  ln -sfv "$DOTFILES_DIR/runcom/.zshrc" ~
  . "$DOTFILES_DIR/install/macos/brew.sh"
fi

# Install Vim Plugins from vim/.vimrc
vim +PluginInstall +qall
