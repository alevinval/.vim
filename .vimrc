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
Plugin 'nvie/vim-flake8'

call vundle#end()

syntax on
filetype plugin indent on

set backspace=2 "
set clipboard=unnamed
set directory-=.
set expandtab
set grepprg=ag\ --nogroup\ --nocolor
set hidden
set hls
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
set noswapfile
set number
set scrolloff=5
set showcmd
set showmatch
set smartcase
set synmaxcol=128
set tabstop=4
set updatetime=250
set wildignore+=*/node_modules/*,*/.git/*,*/.idea/*,*/vendor
set wildignore+=tmp/*,*.so,*.swp,*.zip
set wildmenu

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep=' '
let g:airline#extensions#tabline#left_alt_sep='|'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#branch#enabled=1

" Make CtrlP fast again.
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

let g:go_fmt_command = "goimports"

command FixTrailingWhitespace %s/\s\+$//e
command FixIndent normal! mzgg=G`z

let mapleader = "\<Space>"

au Filetype go nnoremap <leader>ga :GoAlternate<CR>
au Filetype go nnoremap <leader>gt :GoTest<CR>
au FileType go nnoremap <leader>gc :GoCoverage<CR>

au FileType python noremap <leader>b oimport ipdb; ipdb.set_trace()<esc>
autocmd BufWritePost *.py call Flake8()

nnoremap <leader>f viw:<C-U>CtrlSF<CR>
nnoremap <leader>ll :FixTrailingWhitespace<CR>
nnoremap <leader>li :FixIndent<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>

nnoremap <Tab> :bn<CR>
nnoremap <leader><Tab> :bp<CR>
nnoremap <C-c> :bd<CR>
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

colorscheme delek
