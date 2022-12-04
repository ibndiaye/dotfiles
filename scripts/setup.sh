#!/bin/bash
#

#main folders
LIST=("cava" "fish" "rofi" "neofetch" "kitty" "i3" "MangoHud" "ranger" "polybar" "starship.toml")

GIT_DIR="$HOME/Documents/GitHub"
mydots="$HOME/Documents/GitHub/dotfiles/config"
mywp="$HOME/Documents/GitHub/dotfiles/wallpapers"
CONFIG_PATH="$HOME/.config"


printf "Setup Section\n 1) Clone Git Repo and relocate it\n 2) Symlink cloned configs"
read -p "Selection: " input

if (($input==1))
then
    echo "cloning git repo - dotfiles, and moving to the right path"
    if [[ -d "$GIT_DIR" ]]
    then
        #echo "exists"
        cd && git clone https://github.com/ibndiaye/dotfiles && mv -f dotfiles $mydots
    else
        echo "Creating directory"
        mkdir $GIT_DIR
        echo "cloning"
        cd && git clone https://github.com/ibndiaye/dotfiles && mv -f dotfiles $mydots
    fi
fi

if (( $input == 2 ))
then
  echo "symlinking..."

    cd $mydots
    
    for d in "${LIST[@]}"
    do
        if [[ -d $CONFIG_PATH/$d ]]
        then 
            echo "$d already exists, removing and replacing"
            rm -r $CONFIG_PATH/$d
        fi
        ln -nsf $mydots/"$d" $CONFIG_PATH/
    done

    ln -nsf $mywp/ "$HOME/Pictures/wallpapers"

     echo "done symlinking"
fi


