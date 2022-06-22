#!/bin/bash

# Add 3 finger drag support

git clone https://aur.archlinux.org/libinput-gestures.git
cd libinput-gestures
makepkg
sudo pacman -S wmctrl xdotool
sudo pacman -U libinput-gestures-2.73-1-any.pkg.tar.zst
git clean -dfX

echo "gesture swipe up  4  xdotool key super+Page_Down" >> ~/.config/libinput-gestures.conf
libinput-gestures-setup autostart start
