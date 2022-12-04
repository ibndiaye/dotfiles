#!/bin/bash

#listNames=("cava"  "conky" "fish" "rofi" "nvim" "neofetch" "kitty" "i3" "picom")

echo "Backing up..."

CONFIG_PATHS="$HOME/.config"
WP_PATH="$HOME/Pictures/wallpapers"


CONFIG_SAVE_PATH="$HOME/Documents/GitHub/dotfiles/config/"
GIT_REPO="$HOME/Documents/GitHub/dotfiles/"
WP_SAVE_PATH="$HOME/Documents/GitHub/dotfiles/"

#backup configs


# cp -r "$ CONFIG_PATHS/conky" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/cava" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/fish" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/rofi" $CONFIG_SAVE_PATH
# sudo cp -r "$CONFIG_PATHS/nvim" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/neofetch" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/kitty" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/i3" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/MangoHud" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/polybar" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/ranger" $CONFIG_SAVE_PATH
cp -r "$CONFIG_PATHS/starship.toml" $CONFIG_SAVE_PATH

#backup wp
cp -r "$WP_PATH/" $WP_SAVE_PATH


echo "Backup with success to $CONFIG_SAVE_PATH"

printf "push to github? y/n: "
read answer
if [[ "$answer" == "y" ]]
then
  read -p "Commit message: " commitMsg
  read -p "are you sure? " verif
  if [["$verif" == "y" ]] 
  then
    cd $GIT_REPO && git add . && git commit -m "$commitMsg" && git pull && git push origin main
    "pushed with success"
  fi
else
  echo "wont backup...exiting"
fi
