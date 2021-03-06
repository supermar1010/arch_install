#!/bin/bash

func_install() {
    if pacman -Qi $1 &> /dev/null; then
	tput setaf 2
  	echo "###############################################################"
  	echo "# The package " $1 " is already installed"
      	echo "###############################################################"
      	echo
	tput sgr0
    else
    	tput setaf 3
    	echo "###############################################################"
    	echo "# Installing package " $1
    	echo "###############################################################"
    	echo
    	tput sgr0
    	sudo pacman -S --noconfirm --needed $1
    fi
}

package_list=(
    network-manager-applet
    xorg-server
    xorg-xinit
    xf86-video-intel
#    xf86-video-amdgpu
    xorg-server-xwayland
    wayland
    gdm
    gnome-shell
    gnome-keyring
    gnome-control-center
    gnome-tweaks
    gnome-terminal
    nautilus
    xdg-user-dirs-gtk
    evince
    eog
    papirus-icon-theme
    firefox
    thunderbird
    libreoffice-fresh
    libreoffice-fresh-de
#    ntfs-3g
    keepassxc

)

count=0

for name in "${package_list[@]}" ; do
    count=$[count+1]
    tput setaf 3;echo "Installing package nr. " $count " " $name;tput sgr0;
    func_install $name
done

systemctl enable gdm

tput setaf 11;
echo "################################################################"
echo "# Desktop has been installed"
echo "################################################################"
echo;tput sgr0
