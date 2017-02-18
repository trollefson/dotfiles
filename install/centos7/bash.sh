# Update apt-get
sudo yum update

# Install packages

apps=(
  ant
  cmake
  java-1.8.0-openjdk
  java-1.8.0-openjdk-devel
  ctags
  git
  git-all
  maven
  nodejs
  npm
  postgresql
  python
  python-pip
  the_silver_searcher
  tig
  tmux
  vim
)

sudo yum install epel-release
sudo yum install "${apps[@]}"
