# Install Caskroom

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
  firefox
  flux
  gimp
  google-chrome
  google-drive
  java
  opera
  slack
  spotify
  virtualbox
)

brew cask install "${apps[@]}"
