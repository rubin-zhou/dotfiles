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
map <F7> :make<CR>
" F2 to show/hide NERDTree
nmap <F2> :NERDTreeToggle<CR>

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

" cscope settings
if has('cscope')
  set cscopetag cscopeverbose

  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif

  cnoreabbrev csa cs add
  cnoreabbrev csf cs find
  cnoreabbrev csk cs kill
  cnoreabbrev csr cs reset
  cnoreabbrev css cs show
  cnoreabbrev csh cs help
  "command -nargs=0 Cscope cs add $VIMSRC/src/cscope.out $VIMSRC/src
endif
