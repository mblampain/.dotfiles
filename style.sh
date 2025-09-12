#!/usr/bin/env sh

## Theme

mkdir -p $HOME/.themes

# Download Nordic Polar theme.
git clone https://github.com/EliverLara/Nordic-Polar.git $HOME/.themes/Nordic-Polar

gsettings set org.gnome.desktop.interface gtk-theme "Nordic-Polar"
gsettings set org.gnome.desktop.wm.preferences theme "Nordic-Polar"

## Icons

mkdir -p $HOME/.icons

# Download Flatery icon pack.
git clone https://github.com/cbrnix/Flatery.git $HOME/.icons/Flatery

mv $HOME/.icons/Flatery/Flatery-Teal $HOME/.icons/Flatery-Teal

rm -rf $HOME/.icons/Flatery


# Get Noto font

# Temporary directory
TMP_DIR=$(mktemp -d)
ZIP_FILE="$TMP_DIR/Noto.zip"

curl -L "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.4.0/Noto.zip" -o "$TMP_DIR"

FONT_DIR="/usr/local/share/fonts/custom"
sudo mkdir -p "$FONT_DIR"

# Move all font files (ttf, otf) to the fonts directory
echo "Installing fonts..."
sudo find "$TMP_DIR" -type f \( -iname "*.ttf" -o -iname "*.otf" \) -exec mv {} "$FONT_DIR/" \;

# Set permissions
sudo chmod 644 "$FONT_DIR"/*

# Refresh font cache
echo "Refreshing font cache..."
sudo fc-cache -f

# Clean up
rm -rf "$TMP_DIR"