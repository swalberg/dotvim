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

:set autowrite
cmap <F4> !xmlwf < %
imap <C-\> <code type="inline">
ab heading1 <heading alttoc="" refname="" type="major" back-to-top="no"></heading>
ab heading2 <heading alttoc="" refname="" type="minor" back-to-top="no"></heading>
ab codelisting <code type="section" width="100%"><heading refname="listX" type="code">Listing X. Description</heading>
ab imagecode <figure><heading refname="figure1" type="figure" alttoc="">Figure 1.  </heading><img src="figure1.jpg" width="1" height="1" alt=""/></figure>
ab sidebarcode <sidebar width=""><heading refname="" type="sidebar">SIDEBAR</heading></sidebar>
ab tablecode       <heading refname="table1" type="table">Table 1. Table using a heading tag for the caption, all columns left-aligned (recommended style)</heading> <table border="0" cellpadding="0" cellspacing="0" class="data-table-1" width="100%" summary="Table using a heading tag for the caption, all columns left-aligned">

runtime macros/matchit.vim
set nocompatible
if has("autocmd")
  filetype indent plugin on
  endif
