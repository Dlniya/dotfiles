#!/bin/sh

sudo apt-get install -y unzip

mkdir -f $HOME/Downloads
mkdir -f $HOME/.local/share/fonts

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip -O $HOME/Downloads/FiraCode.zip

unzip $HOME/Downloads/FiraCode.zip -d $HOME/.local/share/fonts