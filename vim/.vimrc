set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'mhinz/vim-startify'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'flazz/vim-colorschemes'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'dense-analysis/ale'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

colorscheme badwolf " set my colorscheme

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
set ruler " show row and column position
set modelines=0 " avoid https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12735
set nomodeline " avoid https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-12735
set re=0 " use new regex engine for syntax highlighting - issue with typescript files

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

" ignore files in NERDTree
let NERDTreeIgnore = ['\.pyc$', 'tags']

" ale configuration
let g:ale_linters_explicit = 1
let g:ale_fixers = {'javascript': ['prettier'], 'python': ['black']}
let g:ale_linters = {'javascript': ['eslint'], 'typescript': ['eslint'], 'python': ['pylint']}
