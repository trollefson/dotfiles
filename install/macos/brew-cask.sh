# Install Caskroom

brew tap caskroom/cask
brew install brew-cask
brew tap caskroom/versions

# Install packages

apps=(
  colloquy
  firefox
  gimp
  google-chrome
  java
  rstudio
  virtualbox
)

brew cask install "${apps[@]}"
