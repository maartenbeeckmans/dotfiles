""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""  __     _____ __  __                    __ _         ""
""  \ \   / /_ _|  \/  |   ___ ___  _ __  / _(_) __ _   ""
""   \ \ / / | || |\/| |  / __/ _ \| '_ \| |_| |/ _` |  ""
""    \ V /  | || |  | | | (_| (_) | | | |  _| | (_| |  ""
""     \_/  |___|_|  |_|  \___\___/|_| |_|_| |_|\__, |  ""
""                                              |___/   ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Made by: Maarten Beeckmans                           ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" General settings                                     ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable vi-compatibility mode (use all functions)
set nocompatible
" Enable options for filetype or different options same filetype
set modeline
" Enable line numbers
set number
" Enable relative numbers
set relativenumber
" Disable startup message
set shortmess+=I
" Enable <Backspace> over anything
set backspace=indent,eol,start
" Buffer becomes hidden when it is abandoned
set hidden
" Search is case-insensitive when all characters are lowercase
set ignorecase
" Search becomes case-sensitive it it contains capital letters
set smartcase
" Enable searching as you type
set incsearch
" Enable search highlighting
set hlsearch
" Disable bell sound
set noerrorbells visualbell t_vb=
" Add mouse support
set mouse+=a
" Insert spaces instead of tabs when <Tab> is pressed
set expandtab
" <Tab> insters spaces to go to next indent of the next tabsto
set smarttab
" Set width indent to 2 spaces
set shiftwidth=2
" Set width tabstop to 2 spaces
set tabstop=2
" Always display status bar (bottom)
set laststatus=2
" Don't show VIM mode, is displayed by lightline status bar
set noshowmode
" Only show tab bar if more than 1 tab is opened
set showtabline=1
" Enable 256 colors in vim
set t_Co=256
" Enable syntax highlighting
syntax on
" Remove swap file after save
set nobackup
" Enable wayland copy
noremap Y y:call system("wl-copy", @")<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim Alliasses                                        ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable english spell check
command Spellen set spell spelllang=en_us

" Enable dutch spell check
command Spellnl set spell spelllang=nl_be

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim Function                                         ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight Evilchars ctermbg=red guibg=red
autocmd ColorScheme * highlight Evilchars ctermbg=red guibg=red
"autocmd ColorScheme * highlight Tabs ctermbg=red guibg=red
match Evilchars /\(\s\+$\|\t\)/
"match Tabs /\t/
"
" Disable line numbers
function DisableNumbers()
  set nonumber
  set norelativenumber
  echom "Numbers disabled"
endfunction
" Use allias to call function
command NoNumber call DisableNumbers()

" Enable Line numbers
function EnableNumbers()
  set number
  set relativenumber
  echom "Numbers enabled"
endfunction
" Use allias to call function
command Number call EnableNumbers()

" Save as sudo
command W execute ":w !sudo tee %"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Vim plugins                                          ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable plugins with Vim-Plug
" Automatic installation of Vim-Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocomd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" To install the plugins, run the command PlugInstall
" To update the pligins, run the command PlugUpdate
" To upgrade Vim-Plug, run the command PlugUpgrade
" To check the status of plugins, run the command PlugStatus
call plug#begin('~/.vim/plugged')
" Nord color theme plugin
Plug 'arcticicestudio/nord-vim'
" Ayu color them plugin
Plug 'ayu-theme/ayu-vim'
" Lightline status bar plugin
Plug 'itchyny/lightline.vim'
" Vimwiki plugin
Plug 'vimwiki/vimwiki'
" Disable jamming jklm
Plug 'takac/vim-hardtime'
" Git plugin
Plug 'tpope/vim-fugitive'
" Surrond plugin
Plug 'tpope/vim-surround'
" Fuzzy finder
Plug 'junegunn/fzf.vim'
" Ale plugin
Plug 'w0rp/ale'
call plug#end()
set termguicolors     " enable true colors support
let ayucolor="light"  " for light version of theme

" Enable file type plugins in ~/.vim
filetype plugin on

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Plugin settings                                      ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable nord colorscheme on lightline
let g:lightline = {
      \ 'colorscheme': 'ayu',
      \ }
" Set vimwiki files location
let g:vimwiki_list = [{
      \ 'path': '~/vimwiki/',
      \ }]

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Colorscheme                                          ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable Ayu Colorscheme
colorscheme ayu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Syntastic                                            ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax checking with syntastic
" To install syntastic, run the following command
" > yay -S vim-syntastic
" Syntastic recommended settings:
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Disable keys                                         ""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable arrow keys in Normal mode
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>

" Disable arrow keys in Insert mode
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

" Disable Q entering EX mode
nmap Q <Nop>
" Disable q entering Macro mode
nmap q <nop>
