au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
let mapleader="," "change leader
set nocp
set bs=indent,eol,start
syntax on
set nocompatible               " be iMproved
map Q <Nop>
set isk+=_,$,@,%,#,-        " Make these characters count as part of a word.
set viminfo+=!              " Make sure we can save viminfo.
set ignorecase              " Ignore case in searches
set laststatus=2            " Keep status line one
"no swaps
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

" UI Themes and colors
"syntax enable               " enable syntax highlighting
syntax on                   " syntax checking
set ruler                   " show info bar on bottom row
set noerrorbells            " disable visual bells
set visualbell t_vb=        " disable bells
set number                  " show line numbers
set t_Co=256                " enable 256 colors
set wildmenu                " enable wildmenu   Enter :e  in the command line and press ^D.

" Visual Cues
set showmatch               " show matching braces and brackets
set mat=2                   " 1/10's of a second to show match
set nohlsearch              " dont highlight searches
set incsearch               " highlight searches as you type them
set hidden                  " allow buffer nav without save

set paste "let paste happen.

" ctag stuff
" dynamic tag load
set tags=./php.tags;/.
filetype off                   " required!
filetype plugin indent on     " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
" original repos on github
Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'FindInNERDTree'
Bundle 'NERD_tree-Project'
Bundle 'The-NERD-tree'
Bundle 'The-NERD-Commenter'
Bundle 'ack.vim'
Bundle 'PIV'
"Bundle 'Syntastic'
Bundle 'joonty/vdebug.git'
Bundle 'dbext.vim'
Bundle 'scratch.vim'
Bundle 'surround.vim'
Bundle 'L9'
Bundle 'FuzzyFinder'



autocmd BufRead *.thtml      set filetype=php
autocmd BufRead *.html       set filetype=php
autocmd BufRead *.htm        set filetype=php
autocmd BufRead *.ctp        set filetype=php
autocmd BufRead *.zcml       set filetype=xml
autocmd BufRead *.inc        set filetype=php
autocmd BufRead *.pm         set filetype=perl
autocmd BufRead *.pp         set filetype=ruby
autocmd BufRead Vagrantfile  set filetype=ruby
autocmd BufRead *.t          set filetype=perl
autocmd BufRead *.py         set filetype=python
autocmd BufRead *.mako       set filetype=html

" Syntastic
"if has("gui_running")
"    "SyntasticEnable php
"    SyntasticEnable javascript
"    SyntasticEnable xhtml
"    SyntasticEnable python
"    let g:syntastic_enable_signs=1        " Enable marks on side if errors.
"    let g:syntastic_auto_loc_list=0       " Turn off loc list coming up automatically.
"let g:syntastic_quiet_warnings=1     " Turn off warn msgs, doesn't work
"    let g:syntastic_auto_jump=1           " Jump to errors.
"endif



" Text formatting/layout
set tabstop=4               " tabspacing
set softtabstop=4           " unify?
set shiftwidth=4            " indent by 4 spaces
set shiftround              " indent to nearest tabstop
set expandtab               " use spaces instead of tabs
set foldlevel=10            " disable code folding

" Nerd Tree binding
map <leader>nt :NERDTreeToggle<CR>
map <leader>ft :NERDTreeFind<CR>
" send to extern mappings
map <leader>xp :w !phpsh<CR>
map <leader>fb :FufBuffer<CR>
map <leader>ff :FufFile<CR>

set nofoldenable            " no folding damnit!
let g:DisableAutoPHPFolding = 1

source ~/.vimdbext
