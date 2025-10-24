#/usr/bin/env bash

CONFIG="$HOME/.config"

# Check that git is installed
if ! which git >/dev/null; then
  echo "Git is required for the installation!"
  exit 1
fi

# Check that the script is run using sudo but the user is not root
if [[ $(whoami) != "root" ]]; then
  echo "Sudo is required for the installation!"
  exit 1
fi
if [[ $USER == "root" ]]; then
  echo "Cannot use the installer for root, please use a regular user!"
  exit 1
fi

# Clone the repo, top level only
git clone https://github.com/DoubleDotStudios/onix-dots.git

# Change into onix-dots directory
cd onix-dots

# Make tar archive backup of existing home-manager config if it exists
if [ -d "$CONFIG/home-manager" ]; then
  tar -czf $CONFIG/home-manager.tar.gz $CONFIG/home-manager
fi

# Replace `vaelixd` username and home with users
sed -i "s!/home/vaelixd!$HOME!g" home-manager/home.nix
sed -i "s/vaelixd/$USER/g" home-manager/home.nix

# Move home-manager config to `~/.config/home-manager`
mv home-manager $CONFIG/home-manager

# Move `etc/system.nix` and `etc/flake.nix` to `/etc/nixos`
mv /etc/nixos/flake.nix /etc/nixos/flake.nix.bak
mv etc/* /etc/nixos/

# Instruct user how to complete installation
echo "To finish installing please go to https://github.com/DoubleDotStudios/onix-dots and follow steps 2, 6, 7 and 9"
echo "Have fun!"
