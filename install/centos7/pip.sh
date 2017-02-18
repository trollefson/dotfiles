# Update system pip
sudo pip install --upgrade pip

# Install packages

system_apps=(
  virtualenv
  virtualenvwrapper
)

user_apps=(
  powerline-status 
)

sudo pip install "${system_apps[@]}"
pip install --user "${user_apps[@]}"
