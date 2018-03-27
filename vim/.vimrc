""" Bare necessities
" Disallow security holes
set exrc
set secure

" Be improved! Disable plain Vi mode.
set nocompatible

" Enable Pathogen plugin manager
execute pathogen#infect()

syntax on           " Turn on syntax highlighting
filetype plugin on  " Detect type of file for certain Vim plugins
filetype indent on

" Display
set number          " Enable line numbering
set ruler           " Show current position
set cmdheight=2     " Height of command bar
set cursorline      " Show cursor line

""" Select colorscheme
colorscheme monokai

" Tabs and indentation
set expandtab       " Spaces instead of hard tabs
set smarttab        " Enable smart tabs
set softtabstop=2   " Set soft tab size
set shiftwidth=2    " Set indentation size
set lbr             " Set linebreak
set tw=300

" Show invisible characters
set list
set listchars=tab:►-,space:•,trail:$

" Invisible character colors
highlight NonText ctermfg=darkgray guifg=gray20
highlight SpecialKey ctermfg=darkgray guifg=gray20 ctermbg=NONE guibg=NONE

" Columns
set colorcolumn=80  " Set color column to 80 character limit
highlight ColorColumn ctermbg=darkgray

set ai              " Auto indent
set si              " Smart indent
set wrap            " Wrap lines

" Enable autocompletion of Vim commands
set wildmenu

" Highlight search results
set hlsearch

" Enable mouse
if has('mouse')
    set mouse=a
endif

" When there's encoding failure, remove Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

""" NERDTree - File explorer plugin
let g:NERDTreeWinPos="left"                 " Align NERDTree panel to the left
let g:NERDTreeShowHidden=1                  " Show hidden files
" let g:NERDTreeDirArrowExpandable="+"      " Workaround for NERDTree special
" let g:NERDTreeDirArrowCollapsible="~"     " characters
nmap <F2> :NERDTreeToggle<CR>               " Enable F2 shortcut for NERDTree

""" Tagbar - C tag browser plugin
let g:tagbar_usearrows=1

" Show green fonts with Monokai colorscheme
highlight TagbarSignature guifg=Green ctermfg=Green

" Enable F8 shortcut for Tagbar
nmap <F8> :TagbarToggle<CR>

""" Airline - Statusbar plugin
set laststatus=2                            " Enable statusline by default
"set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%h\ \ \ Line:\ %l
let g:airline_exclude_preview=1
let g:airline#extensions#csv#enabled=1
let g:airline#extensions#hunks#enabled=1
let g:airline#extensions#syntastic#enabled=1
let g:airline#extensions#bufferline#enabled=1
let g:airline#extensions#tabline#enabled=1

let g:airline#extensions#tagbar#enabled=1
let g:airline#extensions#tagbar#flags=''
let g:airline#extensions#tagbar#flags='f'
let g:airline#extensions#tagbar#flags='s'
let g:airline#extensions#tagbar#flags='p'

""" Syntastic - Syntax checker plugin
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0           " Disable syntax checking when quitting

""" YouCompleteMe
" Specify global YCM configuration file
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

" Build commands
nnoremap <F4> :make!<cr>
