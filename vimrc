" Put
" source ~/.vim/vimrc
" in ~/.vimrc
"
" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 

" Vundler ----------------------- {{{
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..


" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-dispatch'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-vividchalk'
Bundle 'godlygeek/tabular'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kana/vim-textobj-user'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'tpope/vim-liquid'
Bundle 'vim-scripts/tComment'
Bundle "wannesm/wmgraphviz.vim"
Bundle "stefanoverna/vim-i18n"
Bundle 'kchmck/vim-coffee-script'
Bundle 'mileszs/ack.vim'
Bundle 'groenewege/vim-less'
Bundle 'thoughtbot/vim-rspec'
Bundle 'swalberg/developerworks-vim'
Bundle 'kien/ctrlp.vim'
Bundle 'skammer/vim-css-color'
Bundle 'cakebaker/scss-syntax.vim'

filetype plugin on
Bundle "MarcWeber/vim-addon-mw-utils"
Bundle "tomtom/tlib_vim"
Bundle "garbas/vim-snipmate"

Bundle "honza/vim-snippets"
"}}}

set tags=/tags;
set t_Co=256
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set ruler
":colorscheme zenburn
:colorscheme vividchalk
syntax on

set hls is

:set autowrite
let mapleader = ","
let maplocalleader = "\\"
nnoremap <leader>ev :vsplit ~/.vim/vimrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>


ab newpara <p style="font-size: 16px; padding: 0; margin: 0 0 15px 0;">
ab emaillink <a style="color: #008ad7;" href="https://payroll.waveaccounting.com/employees/">adding your employees</a>

runtime macros/matchit.vim
set nocompatible
if has("autocmd")
  filetype indent plugin on
endif

"folding settings
set foldmethod=syntax   "fold based on Ruby syntax
let ruby_fold = 1
"set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use

" display whitespace after last character as dots
set list listchars=tab:\ \ ,trail:·
if has('gui_running')
  set guifont=Source\ Code\ Pro:h12
endif

" Run tests within vim ---------------------------- {{{
"cnoremap runt Rake test:recent TEST=%
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
if filereadable('../../Vagrantfile')
  let g:rspec_command = "Dispatch vagrant rspec {spec}"
else
  let g:rspec_command = "Dispatch bin/rspec {spec}"
endif
let g:rspec_command_launcher = "iterm"

" Overwriting the one from vim-rspec
function! InSpecFile()
  return match(expand("%"), "_spec.rb$") != -1 || match(expand("%"), "_feature.rb$") != -1
endfunction

function! CorrectTestRunner()
  if match(expand('%'), '\.feature$') != -1
    return "cucumber"
  elseif match(expand('%'), '_spec\.rb$') != -1
    return "vagrant rspec"
  else
    return "ruby"
  endif
endfunction
"}}}

vmap <Leader>z :call I18nTranslateString()<CR>

" Disabling bad habits ---------------------- {{{
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
" }}}

" c-u UPPERCASES current word
"inoremap <c-u> <esc>viwUea
"nnoremap <c-u> viwUe
"nnoremap <c-p> df(f)cl.to_date<esc>2F"
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

autocmd Filetype markdown setlocal spell wrap linebreak nolist
autocmd Filetype gitcommit setlocal spell textwidth=72

autocmd Filetype ruby set number
autocmd Filetype python set shiftwidth=4
autocmd Filetype python set number
let ruby_no_identifiers = 1
let ruby_no_expensive = 1

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

autocmd FileType sass,scss,stylus syn cluster sassCssAttributes add=@cssColors
