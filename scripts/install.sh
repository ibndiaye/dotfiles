#!/bin/bash
#
#
DIR=`pwd`
FDIR="$HOME/.local/share/fonts"


#install yay if not present
echo "Checking if yay is present..."
if ! command -v yay &> /dev/null
then
    echo "yay could not be found, installing yay..."
    sudo pacman -Syyu --noconfirm yay-bin
    # cd && pacman -S --needed git base-devel
    # git clone https://aur.archlinux.org/yay.git
    # cd yay
    # makepkg -si
  else
    printf "Install Section\n 1) Install Pkgs\n 2) Install Virt-Manager\n 3) Install Flatpaks\n"
    read -p "Selection: " input
fi



#program installation
pkglist=("xfce4-clipman" "flatpak" "flameshot-git" "ranger" "polybar" "polybar" "bpytop" "fish" "exa" "bat" "lolcat"
  "cava" "kitty" "neofetch" "nerd-fonts-source-code-pro" "nvidia-dkms" "nvidia-settings" "spotify-adblock-git" "timeshift" "timeshift-autosnap" "tldr" "grub-btrfs")
if (( $input == 1))
then
    echo "installing packages..."
    for p in "${pkglist[@]}"
    do
      echo "installing $p"
      yay -S --noconfirm "$p"
      echo "$p installed"
    done
    #get starship for fish
    echo "installing starship.."
    curl -sS https://starship.rs/install.sh | sh
    echo "done"
    
    #install fonts for polybar-themes
    echo -e "\n[*] Installing fonts..."
    cd "$HOME/Documents/" && git clone https://github.com/adi1090x/polybar-themes
	[[ ! -d "$FDIR" ]] && mkdir -p "$FDIR"
	cp -rf $HOME/Documents/polybar-themes/fonts/* "$FDIR"
	rm -r $HOME/Documents/polybar-themes/
fi

#virt man setup
if (($input==2))
then
    echo "Installing and setting up virt-manager..."
    sudo pacman -S --needed virt-manager qemu-base libvirt edk2-ovmf dnsmasq vde2 bridge-utils iptables-nft dmidecode
    sudo systemctl enable --now libvirtd.service
    systemctl status libvirtd.service
    sudo virsh net-autostart default 
    yay -S --noconfirm libguestfs qemu-emulators-full qemu-block-gluster qemu-block-iscsi samba
    echo "all done"
fi

#flatpak install
flatpakProgramList=("com.discordapp.Discord" "com.github.tchx84.Flatseal" "com.jetbrains.IntelliJ-IDEA-Community"
  "com.microsoft.Teams" "net.brinkervii.grapejuice" "org.telegram.desktop")
if (($input == 3))
then
  for p in "${flatpakProgramList[@]}"
  do
    echo "installing $p"
    flatpak install -y --noninteractive "$p"
    echo "$p installed"
  done
fi
