" init.vim
" automatically install vim-plug if not already installed and download plugins
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins will be downloaded under the specified directory
call plug#begin('~/.local/share/nvim/site/plugged')

" actual config stuff

set noswapfile

filetype plugin indent on

set encoding=utf-8

set autoread " detect when a file is changed

set title
set number
set relativenumber
set ttyfast " faster redrawing

set noexpandtab " insert tabs rather than spaces for <Tab>
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'

" toggle invisible characters
set list
set listchars=tab:›—,trail:␣,extends:▶,precedes:◀

set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed

set cursorline
highlight Cursorline cterm=bold,underline
call matchadd('ColorColumn', '\%81v', 100)
highlight ColorColumn ctermbg=magenta

" searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expression contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers

" shortcuts

let mapleader = ','

" shortcut to save
nmap <leader>, :w<cr>
" shortcut to quit without saving
nmap <leader>. :q!<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" use hl to move left and right in the cmd buffer
cnoremap <C-h> <left>
cnoremap <C-l> <right>

" move lines around
nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

" specific plugin config

" highlight and remove whitespace
Plug 'bronson/vim-trailing-whitespace'
nmap <leader><space> :FixWhitespace<cr>

"auto close HTML tags
Plug 'alvan/vim-closetag'

" class outline viewer for effective code navigation
" requires ctags to be installed
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" easy markdown tables
Plug 'dhruvasagar/vim-table-mode'
let g:table_mode_corner="|"

" go support for vim
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" file browser in vim
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" use ag to search and open files containing specific words
" requires the_silver_searcher or ack to also be installed on the system
Plug 'mileszs/ack.vim'
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" tmux and vim harmony
Plug 'christoomey/vim-tmux-navigator'

" auto [] () {} "" '', etc...
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'

" git diff in gutter
Plug 'airblade/vim-gitgutter'

" markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
let g:mkdp_auto_start = 0

" auto un/comment
Plug 'tpope/vim-commentary'

nmap <C-m> gcc
vmap <C-m> gc

" status bar
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name'
      \ },
      \ 'colorscheme': 'wombat',
      \ }

set laststatus=2

" linting/fixing
Plug 'w0rp/ale'

let g:ale_set_highlights = 0
let g:ale_change_sign_column_color = 0
let g:ale_sign_column_always = 1
let g:ale_lint_on_text_changed = 'always'
let g:ale_warn_about_trailing_whitespace = 1

" autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi' " python, will require flake8 to be installed on the system.
Plug 'ncm2/ncm2-racer' " rust, will additionally require rust-racer to be installed.
Plug 'ncm2/ncm2-go' "go, will require gocode to be installed.

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noselect,noinsert
set shortmess+=c
inoremap <c-c> <ESC>
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" make it fast
let ncm2#popup_delay = 5
let ncm2#complete_length = [[1, 1]]
" Use new fuzzy based matches
let g:ncm2#matcher = 'substrfuzzy'

" skeleton files
autocmd BufNewFile *.py 0r ~/.config/nvim/skel/skeleton.py

" tab spacing for filetypes
Plug 'vim-scripts/indentpython.vim'

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.fish
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

autocmd Filetype gitcommit setlocal spell textwidth=72
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab

call plug#end()
