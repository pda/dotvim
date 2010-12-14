set nocompatible " vi is dead, long live vim

set background=dark
colorscheme ir_black

" Enable mouse in xterm etc.
set mouse=a

set number
set tabstop=4 shiftwidth=4
set smartindent
" Ruby whitespace: two spaces, no tabs
autocmd FileType ruby setlocal sts=2 ts=2 sw=2 et
autocmd FileType cucumber setlocal sts=2 ts=2 sw=2 et

" highlight trailing whitespace etc
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+\%#\@<!$/

" see http://items.sjbach.com/319/configuring-vim-right
" essential
set hidden
runtime macros/matchit.vim
set wildmenu
set wildmode=list:longest
" recommended
set ignorecase
set smartcase
set scrolloff=3
set backupdir=~/.vim/swap
set directory=~/.vim/swap
set ruler
set visualbell
" The following will make tabs and trailing spaces visible when requested
set listchars=tab:>-,trail:·,eol:$
nmap <silent> <leader>s :set nolist!<CR>
" short info tokens, short command line messages, no intro.
set shortmess=atI

" see http://stevelosh.com/blog/2010/09/coming-home-to-vim/
filetype off
filetype plugin indent on
set history=1000
" Prevent exploits re modelines in files.
set modelines=0
" Make things better
set encoding=utf-8
set cursorline
set ttyfast
set laststatus=2

" Make j & k sane, instead of archaic “movement by file line instead of screen line”
nnoremap j gj
nnoremap k gk
" save on losing focus
autocmd FocusLost \f\+ :wa
" Strip trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
" Quick-edit .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" Alternate exit from insert mode
inoremap jj <ESC>

" http://stackoverflow.com/questions/2968548
" A bug prevents this from working: autocmd FocusLost * stopinsert
autocmd! FocusLost * call feedkeys("\<C-\>\<C-n>")

" auto-reload .vimrc after save.
autocmd! bufwritepost .vimrc source %

""""""""""
" Plugins

" Command-T
let g:CommandTMaxHeight = 16

" Ack (deliberate trailing whitespace)
nnoremap <leader>a :Ack 

" NERDTree
nmap <silent> <leader>n :NERDTreeToggle<CR>

