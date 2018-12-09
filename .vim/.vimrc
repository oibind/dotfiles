" vundle plugin manager guff
set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" plugins
Plugin 'Valloric/YouCompleteMe'		" automatic tab complete for coding
Plugin 'itchyny/lightline.vim'		" status bar
Plugin 'itchyny/vim-gitbranch'		" git support for status bar
Plugin 'jiangmiao/auto-pairs'		" automatic parentheses completion

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required


" actual config stuff

set encoding=utf-8

set background=dark

syntax on

set number
set relativenumber

" specific plugin config 

" YouCompleteMe config
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

" lightline config
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

" specify tab spacing for filetypes

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
