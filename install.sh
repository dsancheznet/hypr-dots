#!/bin/env bash

# Hyprland configurator
# Written by D.Sánchez 
# usage: install.sh [ -s, --sync | -i, --install ]

VALID_ARGS=$(getopt -o isp --long install,sync,prepare -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1;
fi

eval set -- "$VALID_ARGS"

while [ : ]; do
  case "$1" in
    -i | --install)
        echo "Installing dotfiles..."
        shift
        # Installing neovim conigurations
        git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim
        # Installing waybar configurations
        rsync -avhr ./waybar ~/.config/waybar --progress
        # Installing hypr configurations
        rsync -avhr ./hypr ~/.config/hypr --progress
        # Installing nwg-bar configurations
        rsync -avhr ./nwg-bar ~/.config/nwg-bar --progress
        # Installing kitty configurations
        rsync -avhr ./kitty ~/.config/kitty --progress
        # Installing system fonts
        rsync -avhr ./fonts ~/.local/share/fonts --progress
        # Installing system images
        rsync -avhr ./System ~/Imágenes/System --progress
        exit 0
        ;;
    -s | --sync)
        echo "Syncing Repo..."
        shift
        # Copy waybar files
        rsync -avhr ~/.config/waybar . --progress --delete
        # Copy hyprland files
        rsync -avhr ~/.config/hypr . --progress --delete
        # Copy nwg-bar configuration
        rsync -avhr ~/.config/nwg-bar . --progress --delete
        # Copy kitty configurations
        rsync -avhr ~/.config/kitty . --progress --delete
        # Copy fonts
        rsync -avhr ~/.local/share/fonts . --progress --delete
        # Copy images
        rsync -avhr ~/Imágenes/System . --progress --delete
        # Add all new or changed files
        git add .
        # Commit all changes
        git commit -a -m "Automatic changes."
        # Now push everything
        git push
        exit 0
        ;;
    -p | --prepare)
        echo "This option is not working yet. Coming soon ;)"
        exit 0
        ;;
    --) shift; 
        break 
        ;;
  esac
done

echo "Usage: install.sh [ -i,--install | -s,--sync | -p, --prepare ]"
