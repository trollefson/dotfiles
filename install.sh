# Create symlinks to home dir
ln -sfv /Users/tanner/Personal/Projects/dotfiles/inputrc ~
ln -sfv /Users/tanner/Personal/Projects/dotfiles/git/.gitconfig ~
ln -sfv /Users/tanner/Personal/Projects/dotfiles/git/.gitignore_global ~
ln -sfv /Users/tanner/Personal/Projects/dotfiles/vim/.vimrc ~
ln -sfv /Users/tanner/Personal/Projects/dotfiles/vim/flake8 ~/.config/flake8
ln -sfv /Users/tanner/Personal/Projects/dotfiles/tmux/.tmux.conf ~
ln -sfv /Users/tanner/Personal/Projects/dotfiles/tmux/.tmux-powerline ~
ln -sfv /Users/tanner/Personal/Projects/dotfiles/ctags/.ctags ~
ln -sfv /Users/tanner/Personal/Projects/dotfiles/.zshrc ~
ln -sfv /Users/tanner/Personal/Projects/dotfiles/alias ~

# Install Vim Plugins from vim/.vimrc
vim +PluginInstall +qall
