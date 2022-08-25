#!/bin/bash

PACKAGES=(docker emacs gnupg go pkgconf openssh)

#Install Packages
sudo pacman -S "${PACKAGES}"

# Install Go programs
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest

# Activate OpenSSH Server
sudo systemctl enable sshd.service
sudo systemctl start sshd.service
