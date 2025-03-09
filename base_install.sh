#!/bin/bash

# Update package list
echo "Updating repos"
sudo apt update

echo "Installing base packages"
sudo apt install -y \
    wayland-protocols \
    libwayland-dev \
    wayland-utils \
    xwayland \
    sddm \
    sway \
    swaybg \
    swaylock \
    swayidle \
    sway-notification-center \
    waybar \
    nwg-look \
    fonts-dejavu \
    wofi \
    gnome-terminal \
    pulseaudio \
    pulseaudio-utils \
    nautilus \
    wget \
    grim \
    fonts-font-awesome \
    fonts-recommended 

echo "Done installing base packages"

echo "Adding external repositories"
sudo install -y -d -m 0755 /etc/apt/keyrings

wget -q https://packages.mozilla.org/apt/repo-signing-key.gpg -O- | sudo tee /etc/apt/keyrings/packages.mozilla.org.asc > /dev/null
echo "deb [signed-by=/etc/apt/keyrings/packages.mozilla.org.asc] https://packages.mozilla.org/apt mozilla main" | sudo tee -a /etc/apt/sources.list.d/mozilla.list > /dev/null

sudo apt update && sudo apt install firefox

echo creating symbolic links for configs
mkdir -p ~/.config
# Create symbolic links for config directories
ln -s "$(pwd)/sway" ~/.config/sway
ln -s "$(pwd)/wallpapers" ~/.config/wallpapers
ln -s "$(pwd)/waybar" ~/.config/waybar
ln -s "$(pwd)/wofi" ~/.config/wofi

