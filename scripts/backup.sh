#!/bin/bash


# source $(. ./setup.sh export)

LIST=("cava" "fish" "rofi" "neofetch" "kitty" "i3" "MangoHud" "ranger" "polybar" "starship.toml")

echo "Backing up..."

CONFIG_PATHS="$HOME/.config"
WP_PATH="$HOME/Pictures/wallpapers"


CONFIG_SAVE_PATH="$HOME/Documents/GitHub/dotfiles/config"
GIT_REPO="$HOME/Documents/GitHub/dotfiles/"
WP_SAVE_PATH="$HOME/Documents/GitHub/dotfiles/"

#backup configs

for d in "${LIST[@]}" 
do
  cp -r "$CONFIG_PATHS/$d" $CONFIG_SAVE_PATH
done


#backup wp
cp -r "$WP_PATH/" $WP_SAVE_PATH


echo "Backup with success to $CONFIG_SAVE_PATH"


#Github section
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
