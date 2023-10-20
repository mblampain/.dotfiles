#!/usr/bin/env sh

DOTFILES="$HOME/.dotfiles"

# Install everything i need to run correctly this dotfile repo
# I'm based on PopOS! so feel free to adapt it
sudo apt update -y && sudo apt upgrade -y

# Add alacritty PPA
sudo add-apt-repository ppa:aslatter/ppa -y

# Install all packages needed
sudo apt install -y zsh \
                    neofetch \
                    curl \
                    gnome-shell-extension-manager \
                    gnome-tweaks \
                    alacritty

# move config files into the .config folder
rm -rf  $HOME/.config/neofetch \
        $HOME/.config/alacritty

cp -rl $DOTFILES/alacritty $HOME/.config/alacritty
cp -rl $DOTFILES/neofetch $HOME/.config/neofetch

# Install Volta - a node version manager
curl https://get.volta.sh | bash

# Install oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# remove the zsh base file and replace it
rm -f $HOME/.zshrc
ln -s $DOTFILES/zsh/.zshrc $HOME/.zshrc

source $HOME/.zshrc

# add autosuggestions plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# copy the theme into the ZSH folder
ln -s $DOTFILES/zsh/oxide.zsh-theme ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/

# add binding for my MX Master mouse
sudo apt install -y build-essential cmake pkg-config libevdev-dev libudev-dev libconfig++-dev libglib2.0-dev

# clone the logiops repo
git clone https://github.com/PixlOne/logiops.git

# build and install it
cd logiops && mkdir build && cd build && cmake -DCMAKE_BUILD_TYPE=Release .. && make && sudo make install

# put the config in the right place
sudo ln -s $DOTFILES/logid.cfg /etc/logid.cfg

# enable the service / start it right now
sudo systemctl enable --now logid

ln -s $DOTFILES/.xbindkeysrc $HOME/.xbindkeysrc
