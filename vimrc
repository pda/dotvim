" Pathogen: manage plugins in separate directories by manipulating runtimepath.
" Note: 'filetype off' when already off causes a non-zero exit code from vim.
filetype on
filetype off
call pathogen#infect()
filetype plugin indent on

" Color scheme
set background=dark
colorscheme jellybeans_pda
syntax enable

" Indicator after 80 characters.
set colorcolumn=81

" vi is dead, long live vim
set nocompatible

" Show line numbers
set number

" Smart indenting when starting new line
set smartindent

" Indent with two spaces
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Allow backspacing over indents and start of insertion point.
set backspace=indent,start

" PHP whitespace: tabs, with visual width of 4 characters.
autocmd FileType php setlocal sts=4 ts=4 sw=4 noexpandtab

" Default assembler syntax
let asmsyntax = "armasm"

" Highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" Leader of '\' is too far from home row.
let mapleader = ";"
let g:mapleader = ";"

" Make tabs and trailing spaces visible when requested
set listchars=tab:>-,trail:-,eol:$
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

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['n', 'v']
  for key in ['<Up>', '<Down>', '<Left>', '<Right>']
    exe prefix . "noremap " . key . " <Nop>"
  endfor
endfor

" Arrow keys navigate split windows!
nmap <Up> <C-W><Up>
nmap <Down> <C-W><Down>
nmap <Left> <C-W><Left>
nmap <Right> <C-W><Right>

" Mouse for scrolling etc in console.
set mouse=a

" Resize split panes with mouse within tmux.
" Also get live-updated text selection with mouse drag.
set ttymouse=xterm2

" Mapping and escape timeouts.
set timeout
set timeoutlen=1000 " mapped sequences
set ttimeoutlen=10  " escape sequence delay

set clipboard=unnamed

""""""""""
" Shortcuts

" Convert to Ruby 1.9 hash syntax
noremap <leader>9 :s/:\(\S\+\)\s\+=>\s\+/\1: /g<cr>


""""""""""
" Abbreviations

abbreviate pry! require "pry"; binding.pry

""""""""""
" Plugins

" ctrlp.vim
let g:ctrlp_max_height = 16
let g:ctrlp_custom_ignore = ''
let g:ctrlp_custom_ignore .= '/\..*/\|'
let g:ctrlp_custom_ignore .= '/tmp/\|'
let g:ctrlp_custom_ignore .= 'REGEX_TERMINATOR'
nnoremap <leader>gs :CtrlP spec/<cr>
nnoremap <leader>gm :CtrlP app/models/<cr>
nnoremap <leader>gv :CtrlP app/views/<cr>
nnoremap <leader>gc :CtrlP app/controllers/<cr>

" Ack (deliberate trailing whitespace)
" nnoremap <leader>a :Ack 

" NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>

" checksyntax: auto-check Ruby files on save.
if !exists('g:checksyntax')
	let g:checksyntax = {}
	let g:checksyntax['ruby'] = {'auto': 1, 'prepare': 'compiler ruby', 'cmd': 'ruby -c', 'okrx': 'Syntax OK\|No Errors'}
endif

" Hammer
map <leader>h :Hammer<cr>

" Powerline
" Powerline_symbols = 'fancy' requires a patched font.
" let g:Powerline_symbols = 'fancy'
