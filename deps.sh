#!/usr/bin/env sh

DOTFILES="$HOME/.dotfiles"

# Install apt deps
sudo apt install \
    git curl bat  \
    gnome-tweaks gnome-shell-extension-manager

# Create a shortcut for batcat and name it "bat" as the original bin
mkdir -p ~/.local/bin
ln -s /usr/bin/batcat ~/.local/bin/bat

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# add autosuggestions plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

rm -f $HOME/.zshrc
cp -l $DOTFILES/.zshrc $HOME/.zshrc

rm -f $HOME/.zsh_aliases
cp -l $DOTFILES/.zsh_aliases $HOME/.zsh_aliases

source $HOME/.zshrc

curl -sS https://starship.rs/install.sh | sh

rm -f $HOME/.config/starship.toml
cp -l $DOTFILES/starship.toml $HOME/.config/starship.toml

# Install Homebrew
sh -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install Volta - a node version manager
curl https://get.volta.sh | sh


# Install gcloud cli
curl -O https://dl.google.com/dl/cloudsdk/channels/rapid/downloads/google-cloud-cli-linux-x86_64.tar.gz
tar -xf google-cloud-cli-linux-x86_64.tar.gz
sudo mv ./google-cloud-sdk /opt/google-cloud-sdk
sh /opt/google-cloud-sdk/install.sh

rm -rf google-cloud-cli-linux-x86_64.tar.gz

