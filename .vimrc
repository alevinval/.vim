set encoding=utf-8
set nocompatible

filetype plugin indent off
syntax off

call plug#begin('~/.vim/plugged')

Plug 'editorconfig/editorconfig-vim'
Plug 'fatih/vim-go'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mileszs/ack.vim'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'w0rp/ale'

call plug#end()

syntax on
filetype plugin indent on

set autoindent
set autoread
set backspace=2 "
set clipboard=unnamed
set directory-=.
set display+=lastline
set expandtab
set grepprg=ag\ --nogroup\ --nocolor
set hidden
set hls
set ignorecase
set incsearch
set laststatus=2
set list
set listchars=tab:▸\ ,trail:▫
set mouse=a
set noswapfile
set number
set scrolloff=5
set shiftwidth=4
set showcmd
set showmatch
set smartcase
set smarttab
set synmaxcol=128
set tabstop=4
set updatetime=250
set wildignore+=*/node_modules/*,*/.git/*,*/.idea/*,*/vendor
set wildignore+=tmp/*,*.so,*.swp,*.zip
set wildmenu

let g:airline#extensions#ale#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#left_sep=''
let g:airline_theme='dark'

let g:ale_lint_on_save=1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:go_fmt_command = "goimports"

command FixTrailingWhitespace %s/\s\+$//e
command FixIndent normal! mzgg=G`z

let mapleader = "\<Space>"

au Filetype go nnoremap <leader>ga :GoAlternate<CR>
au Filetype go nnoremap <leader>gt :GoTest<CR>
au FileType go nnoremap <leader>gc :GoCoverage<CR>

au FileType python noremap <leader>b oimport ipdb; ipdb.set_trace()<esc>

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

nnoremap <leader>a :Ack!<Space>
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
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
