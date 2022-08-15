#!/bin/bash

#Install Packages
pacman -S go emacs

# Install Go programs
go install golang.org/x/tools/gopls@latest
go install golang.org/x/tools/cmd/goimports@latest
