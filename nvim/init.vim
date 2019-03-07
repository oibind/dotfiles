" init.vim

" automatically install vim-plug if not already installed and download plugins

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins will be downloaded under the specified directory
call plug#begin('~/.local/share/nvim/site/plugged')

" plugins

Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'airblade/vim-gitgutter'

" actual config stuff

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
highlight Cursorline cterm=bold

" searching
set ignorecase " case insensitive searching
set smartcase " case-sensitive if expresson contains a capital letter
set hlsearch " highlight search results
set incsearch " set incremental search, like modern browsers

" shortcuts

let mapleader = ','

" shortcut to save
nmap <leader>, :w<cr>
" shortcut to quit without saving
nmap <leader>. :q!<cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
nnoremap <silent> ^ g^
nnoremap <silent> $ g$

" specific plugin config

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


" autocomplete
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi' " python
Plug 'ncm2/ncm2-racer' " rust

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

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab

call plug#end()
