set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/Projects/dotfiles/vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'mhinz/vim-startify'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'andviro/flake8-vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'vim-scripts/L9'
Plugin 'vim-scripts/FuzzyFinder'
Plugin 'vim-syntastic/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

colorscheme 1989 " set my colorscheme

syntax enable " allow syntax processing
filetype indent on " load file type specific formatting

set tabstop=4 " four spaces per tab when reading
set softtabstop=4 " four spaces per tab when editing
set shiftwidth=4 " indent command is 4 spaces
set expandtab " tabs just create spaces according to softtabstop
set wildmenu " GUI for autocompletes
set showmatch " show matching opening/closing characters
set incsearch " search as you type
set hlsearch " highlight search matches
set foldenable " allow folding of content
set foldlevelstart=10 " default expanded folds
set foldmethod=indent " fold based on identation
set backspace=indent,eol,start " allow more deletions

let mapleader="\<Space>" " set leader to space

" map silver searcher to sp
nnoremap <leader>sp :Ag

" map substitue to fr
map <leader>fr :%s/

" map nerdtree to gr
map <leader>gr :NERDTreeToggle<CR>

" map buffer list to b
map <leader>b :ls<CR>

" switch buffers with leader leader
map <leader><leader> :b#<CR>

" map ctags goto functionality to gt
map <leader>gt <C-]> 

" map pane switching keys
map <NUL>j :wincmd j<CR> 
map <NUL>k :wincmd k<CR>
map <NUL>h :wincmd h<CR>
map <NUL>l :wincmd l<CR>

" map fuzzy finder to ff
map <leader>ff :FufFile 

" ignore files in NERDTree
let NERDTreeIgnore = ['\.pyc$', 'tags']

" hide flake-8 quickfix list
let g:flake8_show_quickfix = 0

" syntastic settings
let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=0
