#!/bin/bash

set -e

echo 'Downloading nvim'
cd $HOME/tools
curl -L -o nvim.tar.gz https://github.com/neovim/neovim/releases/download/v0.10.1/nvim-linux64.tar.gz
mkdir -p nvim
tar -xf nvim.tar.gz --strip-components=1 -C nvim
echo 'export PATH=$PATH:$HOME/tools/nvim/bin' >> $HOME/.bashrc

echo 'Downloading nvim config'           
mkdir -p $HOME/.config                
cd $HOME/.config                      
git clone https://github.com/pigfall/nvimc2.git nvim
$HOME/tools/nvim/bin/nvim -u nvim/plugins.vim --headless -c 'PlugInstall' -c "qa"
