# Update npm
npm install npm@latest -g

# Globally install with npm
packages=(
  http-server
)

sudo npm install "${packages[@]}" -g
