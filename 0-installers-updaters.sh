#!/usr/bin/env sh

DOTFILES="$HOME/.dotfiles"

# Install everything i need to run correctly this dotfile repo
# I'm based on PopOS! so feel free to adapt it

# Add alacritty PPA
sudo add-apt-repository ppa:aslatter/ppa -y

# Updating repos
sudo apt update -y && sudo apt upgrade -y

# Install all packages needed
sudo apt install -y zsh \
                    neofetch \
                    curl \
                    gnome-shell-extension-manager \
                    gnome-tweaks \
                    alacritty
                    xbindkeys \
                    xautomation
