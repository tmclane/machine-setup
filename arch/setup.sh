#!/bin/bash

PACKAGES=(emacs gnupg go)

#Install Packages
sudo pacman -S "${PACKAGES}"

# Install Go programs
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
