"line number
set number
"delimiter (?)
set ruler
"syntax highlighting
syntax enable
"always display statusbar
:set laststatus=2

"I need to write that paper on vim identation at some point
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set backspace=2 " make backspace work like most other apps

"kill that nasty backup which will probably save my life but annoys me to
"death everytime I commit to a new project
set noswapfile

"mouse mode everything
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

"Color scheme
"Use the colors from the terminal
let g:hybrid_use_Xresources = 1
"This affects colors in a weird way. Try both, but light>dark imho
set background=light
colorscheme hybrid

"good ol %% expansion
cabbr <expr> %% expand('%:p:h')

" HERE COMES NEOBLUNDLE
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'bling/vim-airline'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"Have branch in vim-airline
let g:airline#extensions#branch#enabled=1
