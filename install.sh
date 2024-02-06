#!/bin/env bash

# Hyprland configurator
# Written by D.Sánchez 
# usage: install.sh [ -s, --sync | -i, --install ]

VALID_ARGS=$(getopt -o is --long install,sync -- "$@")
if [[ $? -ne 0 ]]; then
    exit 1;
fi

eval set -- "$VALID_ARGS"

while [ : ]; do
  case "$1" in
    -i | --install)
        echo "Installing dotfiles..."
        shift
        git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1 && nvim

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
    --) shift; 
        break 
        ;;
  esac
done

echo "Usage: install.sh [ -i,--install | -s,--sync ]"
