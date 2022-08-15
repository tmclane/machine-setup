#!/bin/bash

if [ ! -f /swapfile ]; then
    RAMSIZE=$(cat /proc/meminfo | grep MemTotal | awk '{print $2}')
    size=$(expr $RAMSIZE / 1024 + 1024)
    sudo dd if=/dev/zero of=/swapfile bs=1M count=${size} status=progress
    sudo chmod 600 /swapfile
    sudo mkswap /swapfile
    sudo swapon /swapfile
    echo '/swapfile none    swap    defaults 0 0' | sudo tee -a /etc/fstab
fi

#offset=$(filefrag -v /swapfile | awk '$1=="0:" {print substr($4, 1, length($4)-2)}')
#UUID=$(sudo findmnt -no UUID -T /swapfile)

# Save our grub before updating
sudo cp /etc/default/grub /etc/default/grub.backup
if [ ! which hibernator ]; then
    sudo pacman -S hibernator
fi
sudo hibernator

sudo cp auto-hibernate.conf /etc/systemd/logind.conf.d/auto-hibernate.conf
sudo cp hibernate-timeout.conf /etc/systemd/sleep.conf.d/hibernate-timeout.conf
