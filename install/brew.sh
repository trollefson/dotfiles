# Install Homebrew

ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew tap homebrew/dupes
brew tap Goles/battery
brew update
brew upgrade

# Install packages

apps=(
  battery
  coreutils
  cmake
  dockutil
  gimp
  git
  git-extras
  gnu-sed --with-default-names
  grep --with-default-names
  postgresql
  python
  the_silver_searcher
  tig
  tmux
  vim
  wget
)

brew install "${apps[@]}"
