#!/bin/sh

apt-get install software-properties-common
add-apt-repository ppa:neovim-ppa/stable
apt-get update
apt install neovim
apt-get install python-dev python-pip python3-dev python3-pip
apt install python3-neovim
git clone --depth 1 https://github.com/wbthomason/packer.nvim\
 		~/.local/share/nvim/site/pack/packer/start/packer.nvim
