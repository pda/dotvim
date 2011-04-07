" Pathogen: manage plugins in separate directories by manipulating runtimepath.
filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

" Color scheme
set background=dark
colorscheme ir_black

" vi is dead, long live vim
set nocompatible

" Show line numbers
set number

" Visual width of tabs
set tabstop=2 shiftwidth=2

" Smart indenting when starting new line
set smartindent

" Ruby whitespace: two spaces, no tabs
autocmd FileType ruby setlocal sts=2 ts=2 sw=2 et
autocmd FileType cucumber setlocal sts=2 ts=2 sw=2 et

" Highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" Make tabs and trailing spaces visible when requested
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Something to do with editing multiple files..?
set hidden

" Jump to matching HTML tag, if/else/endif etc using "%"
runtime macros/matchit.vim

" Navigatable tab completion from Vim command line
set wildmenu
set wildmode=list:longest

" Ignore case in searches, unless search contains upper case
set ignorecase
set smartcase

" Minimum number of lines to keep above/below cursor when scolling
set scrolloff=3

" Swap files in a central location, no swap files amongst project.
" Can be a bad idea when editing several files of the same name.
set backupdir=~/.vim/swap
set directory=~/.vim/swap

" Show line and column number, relative scroll position etc.
set ruler

" Use visual bell instead of beeping.
set visualbell

" short info tokens, short command line messages, no intro.
set shortmess=atI

" Number of commands remembered.
set history=1000

" Disable modelines; not used, risk of security exploits.
set modelines=0

" Default to Unicode/UTF-8 rather than latin1
set encoding=utf-8

" Highlight the screen line of the cursor, easier to find the cursor.
set cursorline

" Terminals are plenty fast these days.
set ttyfast

" The last window will have a status line: always.
set laststatus=2

" Make j & k sane, instead of archaic “movement by file line instead of screen line”
nnoremap j gj
nnoremap k gk

" save on losing focus
autocmd FocusLost \f\+ :wa

" Quick-edit .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Exit insert mode when Vim loses focus.
" A bug prevents this from working: autocmd FocusLost * stopinsert
" See http://stackoverflow.com/questions/2968548
autocmd! FocusLost * call feedkeys("\<C-\>\<C-n>")

" auto-reload .vimrc after save.
autocmd! bufwritepost .vimrc source %

""""""""""
" Plugins

" Command-T
let g:CommandTMaxHeight = 16

" Ack (deliberate trailing whitespace)
" nnoremap <leader>a :Ack 

" NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>
