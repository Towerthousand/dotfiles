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

" will only do case sensitive search if a capital letter is present in the
" search term. You can override this with \C or \c anywhere in the term
" if in the need to do case sensitive replacements, use the I flag for :s
set ignorecase
set smartcase

let g:enable_bold_font = 1

" kill that nasty backup which will probably save my life but annoys me to
" death everytime I commit to a new project
set noswapfile

" mouse mode everything
set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" good ol %% expansion
" this will expand %% to the current file's path, so if you want to open a
" file in the same dir, just :e %%/otherfile
cabbr <expr> %% expand('%:p:h')

" HERE COMES NEOBLUNDLE
" This is the basic stuff for setting up NeoBundle to install all the extensions
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required, neobundle start
call neobundle#begin(expand('~/.vim/bundle/'))

" My Bundles here
" Neobundle will manage these by itself
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'tpope/vim-rhubarb'
NeoBundle 'jmcantrell/vim-virtualenv'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'vim-syntastic/syntastic'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'artoj/qmake-syntax-vim'
NeoBundle 'a.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'benmills/vimux'
NeoBundle 'benmills/vimux-golang'
NeoBundle 'fatih/vim-go'
NeoBundle 'shutnik/jshint2.vim'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'edkolev/tmuxline.vim'
NeoBundle 'majutsushi/tagbar'
" Not needed unless you're doing heavy C/C++
NeoBundle 'Valloric/YouCompleteMe', {
     \ 'build'      : {
        \ 'mac'     : './install.py',
        \ 'unix'    : './install.py',
        \ 'windows' : 'install.py',
        \ 'cygwin'  : './install.py'
        \ }
     \ }

" Required:
" Tell Neobundle we're done specifying bundles
call neobundle#end()

" Required:
" because everyone seems to use the filetype plugin
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Vim identation settings 101:
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
autocmd FileType sh setlocal smartindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType python setlocal smartindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType go setlocal smartindent tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
autocmd FileType cpp setlocal smartindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType javascript setlocal smartindent tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType html setlocal smartindent tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType htmldjango setlocal smartindent tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType php setlocal smartindent tabstop=2 softtabstop=2 shiftwidth=2 expandtab
autocmd FileType css setlocal smartindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab
autocmd FileType scss setlocal smartindent tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Tagbar alias
nmap <F8> :TagbarToggle<CR>

" Airline stuff
let g:airline_theme = "hybrid"
let g:airline#extensions#ycm#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0

" Noob settings for syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_python_checkers = ['pylint']
" If you're using django:
"let g:syntastic_python_pylint_args = '--load-plugins pylint_django'

" YCM STUFF: (Only C and C++)
" Erasing cpp checkers since we use YouCompleteMe
let g:syntastic_cpp_checkers = []
" No need to confirm extra conf, who needs security amirite
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_auto_trigger = 1
let g:ycm_goto_buffer_command = 'horizontal-split'
" command to jump to definition with YCM on new vsplit
command Yg execute "YcmComplete GoTo"
command Ci execute "%s/    /\t/g"

" COMMANDS:
command Gt execute "GolangTestFocused"

" Install heavier stuff without worrying (i.e. YCM)
let g:neobundle#install_process_timeout = 1500
" Search paths for the YouCompleteMe HPP/CPP switcher plugin a.vim
let g:alternateSearchPath = 'reg:/src/include//,reg:/include/src//,sfr:../source,sfr:../src,sfr:../include,sfr:../inc'

" Nice colors:
" This affects colors in a weird way. Try both, but light>dark imho
set background=dark
" Use the colors from the terminal
let g:hybrid_custom_term_colors = 1
" let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
" Enable bold fonts
let g:enable_bold_font = 1
" Color scheme
colorscheme hybrid

" In case syntastic is misbehaving, use this setting to debug it.
" let g:syntastic_debug = 63

" jshint
let jshint2_read = 1
let jshint2_save = 1

" If you wanna use the Golang linter, install golang/lint and uncomment these
" set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
" autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow

let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#F',
      \'c'    : '#W',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '#(battery -t)',
      \'y'    : '%b %d %R',
      \'z'    : '#H'}

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
