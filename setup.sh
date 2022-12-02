#!/bin/bash
#

mydots="$HOME/dots"

if ! command -v yay &> /dev/null
then
    echo "yay could not be found, installing yay..."
    cd && pacman -S --needed git base-devel
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
else
    echo "nothui"

fi
