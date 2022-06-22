#!/bin/bash

if ! command -v add-apt-repository &> /dev/null
then
    sudo apt install -y software-properties-common
fi

# PPA Addition(s)

## Go Backports for 1.18
sudo add-apt-repository -y ppa:longsleep/golang-backports


## Update and install packages
sudo apt update
sudo apt install -y git cmake golang-go emacs curl
