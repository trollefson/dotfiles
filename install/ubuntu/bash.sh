# Update apt-get
sudo apt-get update

# Install packages

apps=(
  ant
  cmake
  default-jre
  exuberant-ctags
  git
  git-extras
  maven
  nodejs
  npm
  postgresql
  python
  python-pip
  silversearcher-ag 
  tig
  tmux
  vim
)

sudo apt-get install "${apps[@]}"
