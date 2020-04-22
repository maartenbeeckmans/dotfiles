" Enabled Plugins
call plug#begin('~/.vim/plugged')
	Plug 'arcticicestudio/nord-vim'
  Plug 'itchyny/lightline.vim'
  Plug 'vimwiki/vimwiki'
call plug#end()

" Enable Nord Colorscheme
colorscheme nord

set number
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set laststatus=2
set showtabline=2
set t_Co=256
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
set noshowmode
set relativenumber
set hlsearch

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:lightline = {
  \ 'colorscheme': 'nord',
  \ }
let g:vimwiki_list = [{
  \ 'path': '~/vimwiki/',
  \ }]

"Disable arrow keys in Normal mode
no <Up> <Nop>
no <Down> <Nop>
no <Left> <Nop>
no <Right> <Nop>

"Disable arrow keys in Insert mode
ino <Up> <Nop>
ino <Down> <Nop>
ino <Left> <Nop>
ino <Right> <Nop>

