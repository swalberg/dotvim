" Put
" source ~/.vim/vimrc
" in ~/.vimrc
"
" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
call pathogen#helptags()
call pathogen#runtime_append_all_bundles()


set t_Co=256
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set ruler
:colorscheme zenburn
syntax on

set hls is

:set autowrite
let mapleader = ","


ab newpara <p style="font-size: 16px; padding: 0; margin: 0 0 15px 0;">
ab emaillink <a style="color: #008ad7;" href="https://payroll.waveaccounting.com/employees/">adding your employees</a>

runtime macros/matchit.vim
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif

"folding settings
set foldmethod=syntax   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
