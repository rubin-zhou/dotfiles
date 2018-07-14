#!/bin/bash

# WARNING: this script is to overwrite existing .vimrc config file, overwrite and install plugins
# in the .vim folders. Backup your original files if needed.

# update vim to latest
git clone https://github.com/vim/vim.git


# YouCompleteme plugin requires Vim compliled with Python 2.x support, build vim from source and install
cd vim/src && make distclean
cd ..
./configure --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu
cd src && make -j8 && sudo make install
cd ../../


# copy vimrc and install vundle plugins
cp .vimrc ~/
sudo rm -rf ~/.vim/bundle
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
source ~/.bashrc
vim +PluginInstall +qall # If this get stuck during plugin install, run this in terminal

# compile YouCompleteMe

#cd ~/.vim/bundle/YouCompleteMe
sudo python ~/.vim/bundle/YouCompleteMe/install.py --clang-completer

cp .ycm_extra_conf.py ~/.vim/.ycm_extra_conf.py
source ~/.bashrc
