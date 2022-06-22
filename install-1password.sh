#!/bin/bash

# Install 1Password
if [[ ! -f /usr/share/keyrings/1password-archive-keyring.gpg ]]; then
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/keyrings/1password-archive-keyring.gpg
fi

if [[ ! -f /etc/apt/sources.list.d/1password.list ]]; then
    echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/1password-archive-keyring.gpg] https://downloads.1password.com/linux/debian/amd64 stable main' | sudo tee /etc/apt/sources.list.d/1password.list

fi

if [[ -f /etc/debsig/policies/AC2D62742012EA22/1password.pol ]]; then
    sudo mkdir -p /etc/debsig/policies/AC2D62742012EA22/
    curl -sS https://downloads.1password.com/linux/debian/debsig/1password.pol | sudo tee /etc/debsig/policies/AC2D62742012EA22/1password.pol
fi

if [[ -f /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg ]]; then
    sudo mkdir -p /usr/share/debsig/keyrings/AC2D62742012EA22
    curl -sS https://downloads.1password.com/linux/keys/1password.asc | sudo gpg --dearmor --output /usr/share/debsig/keyrings/AC2D62742012EA22/debsig.gpg
fi

sudo apt update && sudo apt install -y 1password 1password-cli
