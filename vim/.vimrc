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
Plugin 'davidhalter/jedi-vim'

" flake8-vim config
let g:PyFlakeOnWrite = 1
let g:PyFlakeCheckers = 'pep8,mccabe,frosted'
let g:PyFlakeDefaultComplexity = 4
let g:PyFlakeSigns = 1
let g:PyFlakeMaxLineLength = 120
let g:PyFlakeCWindow = 0

" jedi-vim config
let g:jedi#goto_command="<leader>gt"

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

colorscheme 1989 " set my colorscheme

syntax enable " allow syntax processing
filetype indent on " load file type specific formatting

set tabstop=4 " four spaces per tab when reading
set softtabstop=4 " four spaces per tab when editing
set expandtab " tabs just create spaces according to softtabstop
set wildmenu " GUI for autocompletes
set showmatch " show matching opening/closing characters
set incsearch " search as you type
set hlsearch " highlight search matches
set foldenable " allow folding of content
set foldlevelstart=10 " default expanded folds
set foldmethod=indent "fold based on identation

let mapleader="\<Space>" " set leader to space

" map silver searcher to sp
nnoremap <leader>sp :Ag

" map nerdtree to gr
map <leader>gr :NERDTreeToggle<CR>

" map buffer list to b
map <leader>b :ls<CR>

" switch buffers with leader leader
map <leader><leader> :b#<CR>
