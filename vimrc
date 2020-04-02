set nocompatible

call plug#begin('~/.vim/plugged')
"NERDTree
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
"vim-go
Plug 'fatih/vim-go'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'fatih/molokai'
Plug 'ctrlpvim/ctrlp.vim'
"fugitive
Plug 'tpope/vim-fugitive'
call plug#end()

"General
let mapleader = " "

filetype plugin indent on

set number

set hidden
set nobackup
set noswapfile

set smartindent
 
set title
set titlestring=%t
 
set ruler 
set cursorline
set showmode
set wrap
 
set incsearch
set ignorecase
set showmatch 
set hlsearch
set wrapscan
 
set tabstop=4 
set shiftwidth=4 
set noexpandtab 
 
set wildmenu wildmode=list:full
set undolevels=100 
 
"NERDTree
nmap <C-n> :NERDTreeTabsToggle<CR>
"let g:nerdtree_tabs_open_on_console_startup = 1
 
"vim-go
let g:go_fmt_command = "goimports"
let g:go_metalinter_enabled = ['vet', 'golint', 'errcheck']
let g:go_metalinter_autosave = 1
 
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
 
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
 
autocmd Filetype go map <leader>f :GoDecls<enter>

" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1
"let g:molokai_original = 1
"colorscheme molokai
