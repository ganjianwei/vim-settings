cd /Users/jianweigan/tellapart

syntax enable
set background=dark
"colorscheme solarized
colorscheme slate

if !&diff && has('gui_running')
  " Don't show toolbar
  set guioptions=egmrt
  set guioptions=ace
  set guifont=Menlo:h13
  set colorcolumn=80

  " Only run pathogen in MacVim
  filetype off

  call pathogen#infect()

  call pathogen#runtime_append_all_bundles()
  call pathogen#helptags()
  filetype plugin indent on " Enable filetype-specific indenting and plugins
endif

" Statusline formatting + always on
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set laststatus=2

set nocompatible          " We're running Vim, not Vi!
syntax on                 " Enable syntax highlighting

" Load matchit (% to bounce from do to end, etc.)
runtime! macros/matchit.vim

augroup myfiletypes
    " Clear old autocmds in group
    autocmd!
    " autoindent with two spaces, always expand tabs
    autocmd FileType ruby,eruby,yaml set ai sw=2 sts=2 et
augroup END

" Python from http://wiki.python.org/moin/Vim
autocmd BufRead,BufNewFile *.py syntax on
autocmd BufRead,BufNewFile *.py set ai
" Smart indenting screws up comments
"autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,with,try,except,finally,def,class
autocmd BufRead *.py set nosmartindent
au FileType python setl autoindent tabstop=2 expandtab shiftwidth=2 softtabstop=2
au FileType java setl colorcolumn=100

cabbr <expr> %% expand('%:p:h')
nnoremap <Leader>e :e <C-R>=expand('%:p:h') . '/'<CR>

" Thrift syntax highlighting
au BufRead,BufNewFile *.thrift set filetype=thrift

" Use spaces not tabs, default width of 2 spaces
set tabstop=2
set expandtab
set shiftwidth=2
set softtabstop=2

"set guifont=Bitstream\ Vera\ Sans\ Mono:h14
set guifont=Ubuntu\ Mono:h16
set number
set guicursor=n-v-c:block-Cursor/lCursor,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175

"" Solarized color scheme
let g:solarized_termcolors=16
set background=light
colorscheme solarized

" Toggle between dark and light backgrounds with F5
function! ToggleBackground()
    if (g:solarized_style=="dark")
    let g:solarized_style="light"
    colorscheme solarized
else
    let g:solarized_style="dark"
    colorscheme solarized
endif
endfunction
command! Togbg call ToggleBackground()
nnoremap <F5> :call ToggleBackground()<CR>
inoremap <F5> <ESC>:call ToggleBackground()<CR>a
vnoremap <F5> <ESC>:call ToggleBackground()<CR>

set smarttab
set textwidth=80
set number
set hls
set ic
set noautochdir

" Delete trailing whitespace on file write
autocmd BufWritePre * :%s/\s\+$//e

" Only show 15 lines for CommandT
let g:CommandTMaxHeight = 15

" CommandT max should be set to > no. of files in TA directory.
let g:CommandTMaxFiles=20000

" :W and quit variants should do the same thing as :w since it's so easy to mistype
"command! W w
"command! Wq wq
"command! WQ wq

" Key mappings
imap jj <Esc>

" python-mode plugin settings
"     https://github.com/klen/python-mode
let g:pymode_rope = 0
let g:pymode_lint = 0
let g:pymode_lint_write = 0
let g:pymode_virtualenv = 0
let g:pymode_options_other = 0
let g:pymode_options_indent = 0
" Load breakpoints plugin
let g:pymode_breakpoint = 0
" Autoremove unused whitespaces
let g:pymode_utils_whitespaces = 0

command! PytestOff %s/def test/def xtest/g
command! PytestOn %s/def xtest/def test/g
