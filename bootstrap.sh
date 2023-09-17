#!/usr/bin/env sh

# Update repositories before starting
sudo apt update -y

# Install the following packages :
# zsh: main shell
# curl: to query some of the bootstrap files
# neofetch: did i really have to explain what neofetch is?
# flameshot: an easy to use screenshot software
# rofi: app launcher
# sway: window manager
sudo apt install -y \
	zsh \
	curl \
	neofetch \
	flameshot \
	rofi \
	sway

# Install rustup for alacritty
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Install alacritty
cargo install alacritty

# Install Volta for node/npm/yarn/pnpm versionning
curl https://get.volta.sh | bash

