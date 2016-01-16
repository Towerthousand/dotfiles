" line number
set number
" delimiter (?)
set ruler
" syntax highlighting
syntax enable
" always display statusbar
:set laststatus=2
" make backspace work like most other apps
set backspace=2
" extra scroll lines
set scrolloff=4


" kill that nasty backup which will probably save my life but annoys me to
" death everytime I commit to a new project
set noswapfile

" mouse mode everything
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" Color scheme
" Use the colors from the terminal
let g:hybrid_use_Xresources = 1
"This affects colors in a weird way. Try both, but light>dark imho
set background=light
colorscheme hybrid

" good ol %% expansion
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
NeoBundle 'artoj/qmake-syntax-vim'
NeoBundle 'a.vim'
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.py',
        \ 'unix'    : './install.py',
        \ 'windows' : 'install.py',
        \ 'cygwin'  : './install.py'
        \ }
     \ }

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
call neobundle#end()

" Required:
" because everyone seems to use the filetype plugin
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

"I need to write that paper on vim identation at some point
"
" tabstop: how many columns a tab is displayed as
"
" expandtab: if set, will replace entered tabs with spaces
"
" shiftwidth: how many columns to move when reindenting
"
" softtabstop: WTF: Set softtabstop to control how many columns vim
" uses when you hit Tab in insert mode. If softtabstop is less
" than tabstop and expandtab is not set, vim will use a combination
" of tabs and spaces to make up the desired spacing. If softtabstop
" equals tabstop and expandtab is not set, vim will always use tabs.
" When expandtab is set, vim will always use the appropriate number
" of spaces. JUST WTF.
autocmd FileType python setlocal smartindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType cpp setlocal smartindent tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Have branch in vim-airline
let g:airline#extensions#branch#enabled=1

" Noob settings for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" Erasing cpp checkers since we use YouCompleteMe
let g:syntastic_cpp_checkers = []
" No need to confirm extra conf, who needs security amirite
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_trigger = 1
" command to jump to definition with YCM on new vsplit
command Yvs execute "vs | YcmComplete GoTo"
command Ysp execute "sp | YcmComplete GoTo"
command CI execute "%s/    /\t/g"
" Install heavier stuff without worrying
let g:neobundle#install_process_timeout = 1500
" Search paths for the YouCompleteMe HPP/CPP switcher plugin a.vim
let g:alternateSearchPath = 'reg:/src/include//,reg:/include/src//,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'
