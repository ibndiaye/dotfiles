#!/bin/bash
#
#initially created 2 dec 2022

#main folders
LIST=("cava" "fish" "rofi" "neofetch" "kitty" "i3" "MangoHud" "ranger" "polybar" "starship.toml")

#install yay if not present

if ! command -v yay &> /dev/null
then
    echo "yay could not be found, installing yay..."
    sudo pacman -Syyu --noconfirm yay-bin
    # cd && pacman -S --needed git base-devel
    # git clone https://aur.archlinux.org/yay.git
    # cd yay
    # makepkg -si
fi

 #install fish dependency
    # yay -S --noconfirm fish exa bat lolcat 
    # curl -sS https://starship.rs/install.sh | sh


    printf "Quick Setup Script\n 1) Clone Dotfiles move to direcotry\n 2) Symlink Preconfigured Configs\n 3) Install yay and pkgs\n 4) Virt-Man setup\n 5) Backup + Push to Github\n"
echo "Selection:" 
read input



GIT_DIR="$HOME/Documents/GitHub"
mydots="$HOME/Documents/GitHub/dotfiles/config"
mywp="$HOME/Documents/GitHub/dotfiles/wallpapers"
CONFIG_PATH="$HOME/.config"

if (($input==1))
then
    echo "cloning git repo - dotfiles, and moving to the right path"
    if [[ -d "$GIT_DIR" ]]
    then
        #echo "exists"
        cd && git clone https://github.com/ibndiaye/dotfiles && mv dotfiles $mydots
    else
        echo "Creating directory"
        mkdir $GIT_DIR
        echo "cloning"
        cd && git clone https://github.com/ibndiaye/dotfiles && mv dotfiles $mydots
    fi
fi

if (($input==2))
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
    # ln -nsf $mydots/cava $CONFIG_PATH
    # ln -nsf $mydots/fish $CONFIG_PATH
    # ln -nsf $mydots/rofi $CONFIG_PATH
    # ln -nsf $mydots/neofetch $CONFIG_PATH
    # ln -nsf $mydots/kitty $CONFIG_PATH
    # ln -nsf $mydots/i3 $CONFIG_PATH
    # ln -nsf $mydots/MangoHud $CONFIG_PATH
    # ln -nsf $mydots/ranger $CONFIG_PATH
    # ln -nsf $mydots/polybar $CONFIG_PATH  
    # ln -nsf $mydots/starship.toml $CONFIG_PATH  

     echo "done symlinking"
fi


if (($input==3))
then
    echo "installing packages..."
    yay -S --noconfirm flatpak flameshot-git ranger polybar fish cava kitty neofetch nerd-fonts-source-code-pro nvidia-dkms nvidia-settings spotify-adblock-git timeshift timeshift-autosnap tldr grub-btrfs grub-btrfs
fi

#virt man setup
if (($input==4))
then
    echo "Installing and setting up virt-manager..."
    sudo pacman -S --needed virt-manager qemu-base libvirt edk2-ovmf dnsmasq vde2 bridge-utils iptables-nft dmidecode
    sudo systemctl enable --now libvirtd.service
    systemctl status libvirtd.service
    sudo virsh net-autostart default 
    yay -S --noconfirm libguestfs qemu-emulators-full qemu-block-gluster qemu-block-iscsi samba
    echo "all done"
fi

if (($input==5))
then
    source scripts/backup.sh
fi


# export $LIST="/scripts/backup.sh"
