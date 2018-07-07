#!/bash/bin

# copy .vimrc to ~/

mkdir -p ~/.vim/bundle

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/vundle.vim

source ~/.bashrc

vim +PluginInstall +qall
