#!/bin/bash

# update vim to latest
git clone https://github.com/vim/vim.git


# YouCompleteme plugin requires Vim compliled with Python 2.x support, build vim from source and install
cd vim/src && make distclean && cd ../
cd ..
./configure --enable-pythoninterp --with-python-config-dir=/usr/lib/python2.7/config-x86_64-linux-gnu
cd src && make && sudo make install


# copy vimrc and install vundle plugins
cp .vimrc ~/
mkdir -p ~/.vim/bundle
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
source ~/.bashrc
vim +PluginInstall +qall

# compile YouCompleteMe
cd ~/.vim/bundle/YouCompleteMe
./install.py --clang-completer
source ~/.bashrc
