#!/bin/bash
#

mydots="$HOME/Documents/GitHub/dotfiles/config"
CONFIG_PATH="$HOME/.config/"

if ! command -v yay &> /dev/null
then
    echo "yay could not be found, installing yay..."
    sudo pacman -Syyu yay-bin
    # cd && pacman -S --needed git base-devel
    # git clone https://aur.archlinux.org/yay.git
    # cd yay
    # makepkg -si
else
    echo "installing packages..."
    yay -S flameshot-git git neofetch nerd-fonts-source-code-pro nitrogen nvidia-dkms nvidia-settings spotify-adblock-git timeshift timeshift-autosnap tldr grub-btrfs dmenu grub-btrfs rofi
    
fi


# clone dots
echo "cloning git repo - dotfiles"
cd && git clone https://github.com/ibndiaye/dotfiles

mv dotfiles $mydots

cd $mydots
ln -s $mydots/cava $CONFIG_PATH
 

