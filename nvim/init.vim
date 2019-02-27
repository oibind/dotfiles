" vim-plug plugin manager guff

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" plugins will be downloaded under the specified directory.
call plug#begin('~/.local/share/nvim/site/plugged')

" plugins

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-racer'
Plug 'jiangmiao/auto-pairs'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'tomtom/tcomment_vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'vim-scripts/indentpython.vim'
Plug 'takac/vim-hardtime'
Plug 'airblade/vim-gitgutter'

call plug#end()

" actual config stuff

set encoding=utf-8

set title
set number
set relativenumber

set expandtab
set list
set listchars=tab:›—,trail:␣,extends:▶,precedes:◀

set cursorline
highlight Cursorline cterm=bold

" specific plugin config

" hardtime
let g:hardtime_default_on = 1

" markdown-preview
let g:mkdp_auto_start = 0

" tcomment
nmap <C-m> gcc

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

" ncm2
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

" python beautification
" augroup autocom
        " autocmd!

        " auto beautification of python files
        " autocmd VimLeave *.py !autopep8 --in-place --aggressive --aggressive %

        " execute the command on write
        " autocmd BufWritePost,FileWritePost *.py !autopep8 --in-place --aggressive
                \ --aggressive %
        " autocmd BufWritePost,FileWritePost *.py :edit
" augroup END

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

" tab spacing for filetypes
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
