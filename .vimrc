set nocompatible
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Let Vundle manage Vundle
Bundle 'gmarik/vundle'

" Plugin bundles
Bundle 'ervandew/supertab'
Bundle 'garbas/vim-snipmate'
Bundle 'honza/vim-snippets'
Bundle 'kana/vim-textobj-user'
Bundle 'kien/ctrlp.vim'
Bundle 'MarcWeber/vim-addon-mw-utils'
Bundle 'mileszs/ack.vim'
Bundle 'nelstrom/vim-textobj-rubyblock'
Bundle 'scrooloose/nerdtree'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'tomtom/tlib_vim'
Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-eunuch'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-rake'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-sensible'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-powerline'
Bundle 'rstacruz/sparkup', {'rtp': 'vim'}

" Language bundles
Bundle 'cakebaker/scss-syntax.vim'
Bundle 'kchmck/vim-coffee-script'
Bundle 'pangloss/vim-javascript'
Bundle 'slim-template/vim-slim'
Bundle 'sunaku/vim-ruby-minitest'
Bundle 'tpope/vim-git'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'vim-ruby/vim-ruby'
Bundle 'leafo/moonscript-vim'

" Color scheme
Bundle 'nanotech/jellybeans.vim'

filetype plugin indent on

let mapleader=","

color jellybeans

set cursorline
set expandtab
set modelines=0
set shiftwidth=2
set clipboard=unnamed
set synmaxcol=256
set ttyscroll=3
set encoding=utf-8
set tabstop=2
set nowrap
set number
set expandtab
set nowritebackup
set noswapfile
set nobackup
set nohlsearch
set noundofile
set incsearch
set ignorecase
set smartcase
set lazyredraw
set splitright
set scrolloff=4
set noshowmode
set list listchars=tab:▸\ ,trail:·,extends:>,precedes:<
set omnifunc=syntaxcomplete#Complete

autocmd FileType * if &completefunc != '' | let &omnifunc=&completefunc | endif

" Automatic formatting
autocmd BufWritePre *.rb :%s/\s\+$//e
autocmd BufWritePre *.haml :%s/\s\+$//e
autocmd BufWritePre *.html :%s/\s\+$//e
autocmd BufWritePre *.scss :%s/\s\+$//e
autocmd BufWritePre *.slim :%s/\s\+$//e

nnoremap :whitespace :%s/\s\+$//e

au BufNewFile * set noeol

" No show command
autocmd VimEnter * set nosc

" Use space for :
noremap <space> :

" Quick ESC
imap jj <ESC>

" Jump to the next row on long lines
map <Down> gj
map <Up>   gk
nnoremap j gj
nnoremap k gk

" format the entire file
nmap <leader>fef ggVG=

" Open new buffers
nmap ö<left>   :leftabove  vnew<cr>
nmap ö<right>  :rightbelow vnew<cr>
nmap ö<up>     :leftabove  new<cr>
nmap ö<down>   :rightbelow new<cr>

" Tab between buffers
noremap <tab> <c-w><c-w>

" Switch between last two buffers
nnoremap <leader><leader> <C-^>

" Resize buffers
if bufwinnr(1)
  nmap ä <C-W><<C-W><
  nmap å <C-W>><C-W>>
  nmap Ä <C-W>-<C-W>-
  nmap Å <C-W>+<C-W>+
endif

" NERDTree
nmap <leader>n :NERDTreeToggle<CR>

let NERDTreeMapOpenInTab='\t'
let NERDTreeHighlightCursorline=1
let NERDTreeIgnore = ['tmp', '.yardoc', 'pkg']

" SuperTab
let g:SuperTabDefaultCompletionType = "context"

" CtrlP
nnoremap <silent> t :CtrlP<cr>
nnoremap <silent><leader>t :CtrlP<cr>
nnoremap <silent><leader>r :CtrlPMRUFiles<cr>
nnoremap <silent><leader>b :CtrlPBuffer<cr>

let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0

let g:ctrlp_working_path_mode = 2
let g:ctrlp_by_filename = 0
let g:ctrlp_max_files = 1000
let g:ctrlp_max_depth = 6
let g:ctrlp_root_markers = ['.git']
let g:ctrlp_user_command = {
  \ 'types': { 1: ['.git/', 'cd %s && git ls-files'] },
  \ 'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
  \ }

" Ack
nmap <leader>a :Ack! 
set shellpipe=>

" Go programming
set rtp+=/usr/local/Cellar/go/1.2/libexec/misc/vim

au BufRead,BufNewFile *.go set filetype=go nolist noexpandtab syntax=go
au BufWritePre *.go silent Fmt
autocmd BufWritePre *.go :%s/\s\+$//e
autocmd FileType go autocmd BufWritePre <buffer> Fmt

" Sass
au BufRead,BufNewFile *.scss set filetype=sass
