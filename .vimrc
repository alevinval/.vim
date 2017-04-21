set encoding=utf-8
set nocompatible

filetype plugin indent off
syntax off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'dyng/ctrlsf.vim'
Plugin 'fatih/vim-go'

call vundle#end()

syntax on
filetype plugin indent on

set grepprg=ag\ --nogroup\ --nocolor
set backspace=2 "
set clipboard=unnamed
set cursorline
set directory-=.
set expandtab
set hidden
set hls
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
set number
set scrolloff=5
set showcmd
set showmatch
set smartcase
set synmaxcol=250
set tabstop=4
set updatetime=250
set wildmenu
set wildignore+=tmp/*,*.so,*.swp,*.zip
set wildignore+=*/node_modules/*,*/.git/*,*/.idea/*,*/vendor

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

let g:go_fmt_command = "goimports"

au BufNewFile,BufRead *.php set filetype=php
au BufRead,BufNewFile *.php,*.py setlocal tabstop=4 shiftwidth=4 expandtab softtabstop=4

command FixTrailingWhitespace %s/\s\+$//e
command FixIndent normal! mzgg=G`z

let mapleader = "\<Space>"

au Filetype go nnoremap <leader>ga :GoAlternate<CR>
au Filetype go nnoremap <leader>gt :GoTest<CR>
au FileType go nnoremap <leader>gc :GoCoverage<CR>

nnoremap <leader>b oimport ipdb; ipdb.set_trace()<esc>
nnoremap <leader>f viw:<C-U>CtrlSF<CR>
nnoremap <leader>l :FixIndent<CR>:FixTrailingWhitespace<CR>
nnoremap <leader>w :w<CR>

nnoremap q :q
nnoremap qq :q<CR>
nnoremap <Tab> :bn<CR>
nnoremap <C-c> :bd<CR>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

colorscheme delek
