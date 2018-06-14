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
Plug 'rakr/vim-one'
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
set completeopt=longest,menuone

let g:airline#extensions#ale#enabled=1
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep=''
let g:airline#extensions#tabline#left_sep=''
let g:airline_theme='one'

let g:ale_lint_on_save=1

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
  let $FZF_DEFAULT_COMMAND = 'ag -l -g "" --ignore .git --hidden'
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

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set background=dark
colorscheme one
