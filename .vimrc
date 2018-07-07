set nocompatible              " be iMproved, required
filetype off                  " required by vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"plugins by mrbing
" file system explorer
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'

" tab completion with anything defined in the text before
Plugin 'Valloric/YouCompleteMe'

Plugin 'vim-utils/vim-cscope'
"color schemes
Plugin 'flazz/vim-colorschemes'
call vundle#end()            " required

filetype plugin indent on    " required, re-enable filetype auto-detection
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=120   "wrap lines at 120 chars.

" turn syntax highlighting on
syntax on
set t_Co=256

" turn line numbers on
set number
set ruler

" highlight matching braces
set showmatch

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>