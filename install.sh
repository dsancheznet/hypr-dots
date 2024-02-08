#!/bin/env bash

# Hyprland configurator
# Written by D.Sánchez 
# usage: install.sh [ -s, --sync | -i, --install ]

CURRENT_USER=`whoami`

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
        git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1
        # Installing powerline
        git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.config/powerlevel10k
        echo 'source ~/.config/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc
        # Installing waybar configurations
        rsync -avhr ./waybar ~/.config --progress
        # Installing hypr configurations
        rsync -avhr ./hypr ~/.config --progress
        # Installing nwg-bar configurations
        rsync -avhr ./nwg-bar ~/.config --progress
        # Installing kitty configurations
        rsync -avhr ./kitty ~/.config --progress
        # Installing system fonts
        rsync -avhr ./fonts ~/.local/share --progress
        fc-cache -f -v
        # Installing system images
        rsync -avhr ./System ~/Imágenes --progress
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

        echo "Installing 3rd party repos"
        sudo zypper ar -f https://download.opensuse.org/repositories/home:/Dead_Mozay/openSUSE_Tumbleweed Dead_Mozay
        echo "Refreshing repos"
        sudo zypper refresh
        echo "Update all packets"
        sudo zypper update
        echo "Install neccessary hyprland packages"
        sudo zypper install hyprland ulauncher neovim swayidle waybar swaylock swaylock-zsh-completion kitty kitty-shell-integration swaybg go gtk3-devel gtk-layer-shell-devel make mc eza duf zsh
        echo "Compile nwg-bar"
      	cd ~
      	git clone https://github.com/nwg-piotr/nwg-bar.git
      	cd nwg-bar
      	make get
      	make build 
      	sudo make install
      	cd .. && rm -rf nwg-bar

        flatpak install joplin

        flatpak install kodi

        flatpak install jdownloader

        sudo chsh -s /usr/bin/zsh $CURRENT_USER

        exit 0

        ;;
    --) shift; 
        break 
        ;;
  esac
done
echo "Hyprland installer for OpenSuSE v0.1 Written by D.Sánchez (c)2024 "
echo "Usage:    install.sh [ -i,--install | -s,--sync | -p, --prepare ]"


/*

  Pick a nice Wallpaper from 
  https://wallpaperswide.com/

*/
