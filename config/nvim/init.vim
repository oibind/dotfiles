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

set shell=dash

" 256 colours
set t_Co=256

set noswapfile

filetype plugin indent on

set encoding=UTF-8

set autoread " detect when a file is changed

set title
set number
set relativenumber
set ttyfast " faster redrawing

set expandtab
set smarttab " tab respects 'tabstop', 'shiftwidth', and 'softtabstop'

" disable automatic commenting on a newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" toggle invisible characters
set list
set listchars=tab:›—,trail:␣,extends:▶,precedes:◀

set backspace=indent,eol,start " make backspace behave in a sane manner
set clipboard=unnamed

set cursorline
highlight Cursorline cterm=bold,underline
call matchadd('ColorColumn', '\%81v', 100)
highlight ColorColumn ctermbg=magenta
set guicursor=n-v:blinkwait700-blinkon400-blinkoff250
set guicursor=i:ver1-blinkwait700-blinkon400-blinkoff250
autocmd VimLeave * set guicursor=n:ver1-blinkwait700-blinkon400-blinkoff250

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

" sprunge.us
Plug 'javier-lopez/sprunge.vim'

" hexcode colours
Plug 'ap/vim-css-color'

" list of numbers
Plug 'triglav/vim-visual-increment'

" motion for vim
Plug 'justinmk/vim-sneak'
let g:sneak#label = 1

" range, pattern, and substitute preview for neovim
Plug 'markonm/traces.vim'

" highlight and remove whitespace
Plug 'bronson/vim-trailing-whitespace'
nmap <leader><space> :FixWhitespace<cr>

" auto close HTML tags
Plug 'alvan/vim-closetag', { 'for': 'html' }

" class outline viewer for effective code navigation
" requires ctags to be installed
Plug 'majutsushi/tagbar'
nmap <F8> :TagbarToggle<CR>

" easy markdown tables
Plug 'dhruvasagar/vim-table-mode'
let g:table_mode_corner="|"

" file browser in vim
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight', { 'on': 'NERDTreeToggle' }
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
map <C-n> :NERDTreeToggle<CR>

" git stuff
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
" requires neovim 0.4 or later for floating windows support
Plug 'rhysd/git-messenger.vim'

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
highlight! link SignColumn LineNr

" markdown-preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
let g:mkdp_auto_start = 0

" auto un/comment
Plug 'preservim/nerdcommenter'

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
      \   'gitbranch': 'gitbranch#name',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat'
      \ },
      \ 'colorscheme': 'wombat',
      \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
endfunction

set laststatus=2

" linting/fixing
Plug 'dense-analysis/ale'

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

" python ide
Plug 'Vimjas/vim-python-pep8-indent', { 'for': 'python' }
Plug 'hdima/python-syntax', { 'for': 'python' }
Plug 'ncm2/ncm2-jedi', { 'for': 'python' } " requires flake8 and jedi
Plug 'davidhalter/jedi-vim', { 'for': 'python' }

let g:jedi#auto_initialization = 1
let g:jedi#completions_enabled = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#smart_auto_mappings = 0
let g:jedi#popup_on_dot = 0
let g:jedi#completions_command = ""
let g:jedi#show_call_signatures = "1"
let g:jedi#show_call_signatures_delay = 0
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#show_call_signatures_modes = 'i'  " ni = also in normal mode
let g:jedi#enable_speed_debugging=0

" filetypes
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'kballard/vim-fish', { 'for': 'fish' }
Plug 'tpope/vim-git', { 'for': 'git' }

au FileType markdown,text setlocal spell textwidth=0 linebreak
au FileType gitcommit setlocal colorcolumn+=51

call plug#end()
