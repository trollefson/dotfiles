# Install Homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> /Users/tanner/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"
brew update
brew upgrade

# Install packages
apps=(
  git
  tig
  tmux
)

brew install "${apps[@]}"
