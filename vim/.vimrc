""" Bare necessities
" Disallow security holes
set exrc
set secure

" Be improved! Disable plain Vi mode.
set nocompatible

" Enable Pathogen plugin manager
execute pathogen#infect()
syntax on                                           " Turn on syntax highlighting
filetype plugin on                                  " Detect type of file for certain Vim plugins
filetype indent on

" Display
set number          " Enable line numbering
set ruler           " Show current position
set cmdheight=2     " Height of command bar

""" Select colorscheme
colorscheme monokai

" Tabs and indentation
set expandtab       " Spaces instead of hard tabs
set smarttab        " Enable smart tabs
set softtabstop=4   " Set soft tab size
set shiftwidth=4    " Set indentation size
set lbr             " Set linebreak
set tw=300

" Columns
set colorcolumn=110
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
let g:NERDTreeWinPos="left"                           " Align NERDTree panel to the left
" let g:NERDTreeDirArrowExpandable="+"                " Workaround for NERDTree special characters
" let g:NERDTreeDirArrowCollapsible="~"
nmap <F2> :NERDTreeToggle<CR>                         " Enable F2 shortcut for NERDTree

""" Tagbar - C tag browser plugin
let g:tagbar_usearrows=1
highlight TagbarSignature guifg=Green ctermfg=Green " Show green fonts with Monokai colorscheme
nmap <F8> :TagbarToggle<CR>                         " Enable F8 shortcut for Tagbar

""" Airline - Statusbar plugin
set laststatus=2                                    " Enable statusline by default
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
let g:syntastic_check_on_wq=0                       " Disable checking when quitting

""" YouCompleteMe
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'   " Specify global YCM configuration file

" Build commands
nnoremap <F4> :make!<cr>
