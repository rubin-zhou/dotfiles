""""""""""""""""""""""""""""""""common vim settings start""""""""""""""""""""""""""""'''""""
set nocompatible       " be iMproved, required, no compatible to old version
set autoread           " auto update buffer
set number             " show line number
set ruler
set hlsearch           " highlight search results
set cursorline         " highlight current line
set incsearch          " recursive search

set showmatch          " highlight matching braces
set matchtime=1        " highlight show time, unit 0.1s.
set encoding=utf-8     " set UTF-8 encoding
set laststatus=2       " display status  in bottom 2 lines

" turn syntax highlighting on
syntax enable
syntax on
set t_Co=256

"let mapleader="\<Space>" "leader key
let mapleader=":"  "leader key

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=100   "wrap lines at 100 chars.
""""""""""""""""""""""""""""""""common vim settings end""""""""""""""""""""""""""""'''""""
"""""""""""""""""""""""""""""Plugins by vundle manager start"""""""""""""""""""""""""""""""
filetype off                  " required by vundle
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'      " file system explorer
Plugin 'flazz/vim-colorschemes'   " color schemes
Plugin 'Valloric/YouCompleteMe'   " auto completer
Plugin 'scrooloose/syntastic'     " syntax checker
Plugin 'Raimondi/delimitMate'     " bracket, marker auto complete and match
Plugin 'ctrlpvim/ctrlp.vim'       " fuzzy file search
Plugin 'Lokaltog/vim-powerline'   " status line display.
"Plugin 'majutsushi/tagbar'
"Plugin 'vim-utils/vim-cscope'

call vundle#end()

filetype plugin indent on    " required, re-enable filetype auto-detection
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

""""""""""""""""""""""""Plugins by vundle manager end"""""""""""""""""""""""""""""""'''"

"""""""""""""""""""""""""""""""""Plugins settings""""""""""""""""""""""""""""""""""""""'''"
" plugin delimitMate extra setting
let g:delimitMate_expand_cr=1
" use indentation of previous line
set autoindent
" use intelligent indentation for C
set smartindent

"display color when exceed 100
let &colorcolumn=join(range(100,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

" NERDTree keymaps
map <F7> :make<CR>
" F2 to show/hide NERDTree
nmap <F2> :NERDTreeToggle<CR>
" visit windows in NERDTree
" nnoremap nw <C-W><C-W>        "one by one
" nnoremap <Leader>lw <C-W>l    "jump to right window
" nnoremap <Leader>hw <C-W>h    "jump to left window
" nnoremap <Leader>kw <C-W>k    "jump to up window
" nnoremap <Leader>jw <C-W>j    "jump to down window

" Goto for YouCompleteMe
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoToDefinitionElseDeclaration<CR>
"let g:ycm_show_diagnostics_ui = 1
"let g:ycm_error_symbol = '>>'
"let g:ycm_warning_symbol = '>*'

" Ctrlp file search
" 打开ctrlp搜索
let g:ctrlp_map = '<leader>ff'
let g:ctrlp_cmd = 'CtrlP'
" 相当于mru功能，show recently opened files
map <leader>fp :CtrlPMRU<CR>
"set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux"
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz)$',
    \ }
"\ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1

" vim_powerline plugin settings
let g:Powerline_symbols = 'fancy'


"""""""""""""""""""""""""""""""""Other settings""""""""""""""""""""""""""""""""""""""'''"
" no indent for namespace
function! IndentNamespace()
  let l:cline_num = line('.')
  let l:pline_num = prevnonblank(l:cline_num - 1)
  let l:pline = getline(l:pline_num)
  let l:retv = cindent('.')
  while l:pline =~# '\(^\s*{\s*\|^\s*//\|^\s*/\*\|\*/\s*$\)'
    let l:pline_num = prevnonblank(l:pline_num - 1)
    let l:pline = getline(l:pline_num)
  endwhile
  if l:pline =~# '^\s*namespace.*'
    let l:retv = 0
  endif
  return l:retv
endfunction

setlocal indentexpr=IndentNamespace()

