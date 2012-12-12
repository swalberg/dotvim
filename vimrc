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
set foldmethod=syntax   "fold based on Ruby syntax
let ruby_fold = 1
"set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
"set foldlevel=1         "this is just what i use

"cnoremap runt Rake test:recent TEST=%
cnoremap runt !vagrant run_test %
map <Leader>o :call RunCurrentLineInTest()<CR>
map <Leader>t :call RunCurrentTest()<CR>

" display whitespace after last character as dots
set list listchars=tab:\ \ ,trail:·
if has('gui_running')
  set guifont=Source\ Code\ Pro:h12
endif
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Test-running stuff
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RunCurrentTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFile()

    if match(expand('%'), '\.feature$') != -1
      call SetTestRunner("!cucumber")
      exec g:bjo_test_runner g:bjo_test_file
    elseif match(expand('%'), '_spec\.rb$') != -1
      call SetTestRunner("!vagrant rspec")
      exec g:bjo_test_runner g:bjo_test_file
    else
      call SetTestRunner("!ruby -Itest")
      exec g:bjo_test_runner g:bjo_test_file
    endif
  else
    exec g:bjo_test_runner g:bjo_test_file
  endif
endfunction

function! SetTestRunner(runner)
  let g:bjo_test_runner=a:runner
endfunction

function! RunCurrentLineInTest()
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
  if in_test_file
    call SetTestFileWithLine()
  end

  exec "!vagrant rspec" g:bjo_test_file . ":" . g:bjo_test_file_line
endfunction

function! SetTestFile()
  let g:bjo_test_file=@%
endfunction

function! SetTestFileWithLine()
  let g:bjo_test_file=@%
  let g:bjo_test_file_line=line(".")
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

