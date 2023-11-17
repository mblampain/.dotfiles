#!/usr/bin/env sh

DOTFILES="$HOME/.dotfiles"

# Install everything i need to run correctly this dotfile repo
# I'm based on PopOS! so feel free to adapt it
# This script must be launched from a zsh shell !

# move config files into the .config folder
rm -rf  $HOME/.config/neofetch \
        $HOME/.config/alacritty

cp -rl $DOTFILES/alacritty $HOME/.config/alacritty
cp -rl $DOTFILES/neofetch $HOME/.config/neofetch

# copy the MX Master binds into the right place
ln -s $DOTFILES/.xbindkeysrc $HOME/.xbindkeysrc

# Install Volta - a node version manager
curl https://get.volta.sh | bash

# remove the zsh base file and replace it
rm -f $HOME/.zshrc
ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc

source $HOME/.zshrc

# add autosuggestions plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# copy the theme into the ZSH folder
ln -s $DOTFILES/zsh/oxide.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/
