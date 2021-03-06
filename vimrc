""""""""""
" Pathogen:
" Manage plugins in separate directories by manipulating runtimepath.
" https://github.com/tpope/vim-pathogen
runtime bundle/pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype plugin indent on


""""""""""
" Color scheme

set background=dark
colorscheme jellybeans_pda
syntax enable


""""""""""
" Settings

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

" (1s: indent 1 * shiftwidth within parentheses; default 2 * shiftwidth.
" m1: closing parenthesis on new line matches indentation of opening line.
set cinoptions=(1s,m1

" Allow backspacing over indents and start of insertion point.
set backspace=indent,start

" Highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" Make tabs and trailing spaces visible when `list` is set.
set listchars=tab:>-,trail:-

" Allow unsaved buffers to be hidden (backgrounded).
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

" Mouse for scrolling etc in console.
" a = normal + visual + insert + command-line + help files
set mouse=a

" Resize split panes with mouse within tmux.
" Also get live-updated text selection with mouse drag.
" sgr: backwards compatible with xterm2 mode but works beyond 223 columns.
set ttymouse=sgr


" Mapping and escape timeouts.
set timeout
set timeoutlen=1000 " mapped sequences
set ttimeoutlen=10  " escape sequence delay

" Link vim's default delete/yank register to the system clipboard.
" unnamed     = "* = PRIMARY buffer in X.
" unnamedplus = "+ = CLIPBOARD buffer in X.
set clipboard=unnamed


""""""""""
" File types

" Front-end whitespace: four space indentation
autocmd FileType javascript setlocal sts=4 ts=4 sw=4 expandtab
autocmd FileType scss setlocal sts=4 ts=4 sw=4 expandtab

" PHP whitespace: four space indentation
" https://github.com/php-fig/fig-standards/blob/master/accepted/PSR-2-coding-style-guide.md
autocmd FileType php setlocal sts=4 ts=4 sw=4 expandtab

" Python whitespace: four space indentation.
" http://legacy.python.org/dev/peps/pep-0008/#tabs-or-spaces
autocmd FileType python setlocal sts=4 ts=4 sw=4 expandtab

" Ruby ERB template whitespace: four space indentation
" (99designs style guide)
autocmd FileType eruby setlocal sts=4 ts=4 sw=4 expandtab

" Flex: lex-style syntax, indentation as 4 spaces.
autocmd BufRead,BufNewFile *.flex setlocal ft=lex sts=4 ts=4 sw=4 expandtab

" Shell scripts are posix (same as ksh mode, similar to bash mode)
" Fixes some syntx highlighting errors like A=$(subcommand)
" See: https://github.com/b4winckler/vim/blob/9592d73105979470e22662bc21fe7433f13626c0/runtime/syntax/sh.vim#L269-L274
let g:is_posix=1


""""""""""
" Keyboard and Shortcuts

" Leader of '\' is too far from home row.
let mapleader = ";"
let g:mapleader = ";"

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

" Show hidden chars as specified by listchars (e.g. tabs, trailing space)
nmap <silent> <leader>s :set list!<CR>

" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" Quick-edit .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>

" Convert to Ruby 1.9 hash syntax
noremap <leader>9 :s/:\(\S\+\)\s\+=>\s\+/\1: /g<cr>

" Convert Ruby hash from Symbol keys to String keys
noremap <leader>hs :s/\([A-Za-z0-9_]\+\):\(\s\+\)/"\1" =>\2/g<cr>

" Convert CSS `squished:rule;  ` into `nice: rule;`
noremap <leader>c :s/^\(\s*\)\([a-z-]\+\):\([^ \t].*\);\s*$/\1\2: \3;/<cr>

" Send "!!" to tmux, to repeat last shell command.
map <leader>!! :wall \| call Send_to_Tmux("!!\n")<cr>

map <leader>m :wall \| :call Send_to_Tmux("make\n")<CR>

" Set a current spec file with R, execute it via tmux with r.
map <leader>R :let g:specFile = @% \| echo "RSpec file: " . g:specFile<CR>
map <leader>r :wall \| :call Send_to_Tmux("time rspec -f d " . g:specFile . "\n")<CR>

" Reselect visual block after indent (thanks @twe4ked)
vnoremap < <gv
vnoremap > >gv


""""""""""
" Abbreviations

abbreviate goerr if err != nil {return err}
abbreviate pry! require "pry"; binding.pry

""""""""""
" Plugins

" ctrlp.vim
let g:ctrlp_arg_map = 1 " prompt for open mode
let g:ctrlp_max_height = 16
let g:ctrlp_custom_ignore = ''
let g:ctrlp_custom_ignore .= '/\..*/\|'
let g:ctrlp_custom_ignore .= '/tmp/\|'
let g:ctrlp_custom_ignore .= '/assets/\|'
let g:ctrlp_custom_ignore .= '/node_modules/\|'
let g:ctrlp_custom_ignore .= 'REGEX_TERMINATOR'
nnoremap <leader>ga :CtrlP app/<cr>
nnoremap <leader>gs :CtrlP spec/<cr>
nnoremap <leader>gm :CtrlP app/models/<cr>
nnoremap <leader>gv :CtrlP app/views/<cr>
nnoremap <leader>gc :CtrlP app/controllers/<cr>

" NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>

" checksyntax: auto-check Ruby files on save.
if !exists('g:checksyntax')
	let g:checksyntax = {}
	let g:checksyntax['ruby'] = {'auto': 1, 'prepare': 'compiler ruby', 'cmd': 'ruby -c', 'okrx': 'Syntax OK\|No Errors'}
endif

" Airline
" https://github.com/bling/vim-airline
" https://github.com/bling/vim-airline/blob/master/doc/airline.txt
let g:airline_left_sep = '▚'
let g:airline_right_sep = '▞'
let g:airline_mode_map = {
  \ 'n' : 'N',
  \ 'i' : 'I',
  \ 'R' : 'REPLACE',
  \ 'v' : 'VISUAL',
  \ 'V' : 'V-LINE',
  \ 'c' : 'CMD   ',
  \ '': 'V-BLCK',
  \ }

" vim-json
" Disable crazy quote concealing. Show the actual file.
let g:vim_json_syntax_conceal = 0

" vim-go
if executable("goimports")
  let g:go_fmt_command = "goimports"
endif
