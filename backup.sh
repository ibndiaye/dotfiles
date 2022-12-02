#!/bin/bash

#listNames=("cava"  "conky" "fish" "rofi" "nvim" "neofetch" "kitty" "i3" "picom")

printf "Backing up..."

CONFIG_PATHS="$HOME/.config"
WP_PATH="$HOME/Pictures/wallpapers/"


CONFIG_SAVE_PATH="$HOME/Documents/GitHub/dotfiles/config/"
WP_SAVE_PATH="$HOME/Documents/GitHub/dotfiles/wallpapers"

#backup configs
# cp -r "$ CONFIG_PATHS/conky" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/cava" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/fish" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/rofi" $CONFIG_SAVE_PATH
sudo cp -r "$CONFIG_PATHS/nvim" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/neofetch" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/kitty" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/i3" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/MangoHud" $CONFIG_SAVE_PATH

#backup wp
cp -r "$WP_PATH/" $WP_SAVE_PATH


printf "everythings backed up"
