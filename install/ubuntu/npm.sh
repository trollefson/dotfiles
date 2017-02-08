# Update npm
npm install npm@latest -g

# Globally install with npm
packages=(
  gulp
  http-server
)

npm install -g "${packages[@]}"
