lua require('plugins')

let mapleader=" "

set nocompatible

" Syntax highlighting
syntax on
filetype plugin on

" Display
set cc=80,120
set number
set clipboard=unnamedplus
set cmdheight=2
set cursorline
set cursorcolumn

" Select colorscheme
colorscheme monokai

" Tabs and whitespace
set expandtab
set mouse=a
set shiftwidth=4
set softtabstop=4
set tabstop=2

" Remove trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" Search
set ignorecase
set smartcase
set hlsearch


" Set encoding
set encoding=utf-8

" Show invisible characters
set list
set listchars=tab:►-

" Shortcutting split navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

" Splitting
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>
set splitbelow splitright

" Auto-completion
set wildmode=longest,list,full

" When there's encoding failure, remove Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

""" NERDTree - File explorer plugin
let g:NERDTreeWinPos="left"                 " Align NERDTree panel to the left
let g:NERDTreeShowHidden=1
nmap <F2> :NERDTreeToggle<CR>               " Enable F2 shortcut for NERDTree

