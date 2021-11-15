# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew update
brew upgrade

# Install packages
apps=(
  git
  tig
  tmux
)

brew install "${apps[@]}"
