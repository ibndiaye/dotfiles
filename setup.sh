#!/bin/bash
#
#1 is to install stuff
#2 to to clone repo
#3 is to symlink cloned repo

mkdir "$HOME/Documents/GitHub/"
mydots="$HOME/Documents/GitHub/dotfiles/config"
CONFIG_PATH="$HOME/.config/"

# clone dots
echo "cloning git repo - dotfiles, and moving to the right path"
cd && git clone https://github.com/ibndiaye/dotfiles
mv dotfiles $mydots


echo "symlinking..."
cd $mydots
ln -nsf $mydots/cava $CONFIG_PATH
ln -nsf $mydots/fish $CONFIG_PATH
ln -nsf $mydots/rofi $CONFIG_PATH
ln -nsf $mydots/neofetch $CONFIG_PATH
ln -nsf $mydots/kitty $CONFIG_PATH
ln -nsf $mydots/i3 $CONFIG_PATH
ln -nsf $mydots/MangoHud $CONFIG_PATH
ln -nsf $mydots/ranger $CONFIG_PATH
ln -nsf $mydots/polybar $CONFIG_PATH  
echo "done symlinking"



if ! command -v yay &> /dev/null
then
    echo "yay could not be found, installing yay..."
    sudo pacman -Syyu yay-bin
    # cd && pacman -S --needed git base-devel
    # git clone https://aur.archlinux.org/yay.git
    # cd yay
    # makepkg -si
elif [[ $1 -eq 1 ]]
then
    echo "installing packages..."
    yay -S flatpak flameshot-git git neofetch nerd-fonts-source-code-pro nitrogen nvidia-dkms nvidia-settings spotify-adblock-git timeshift timeshift-autosnap tldr grub-btrfs dmenu grub-btrfs rofi
else
    exit
fi

