" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'

au FileType xml setlocal equalprg=xmllint\ --format\ --recover\ -\ 2>/dev/null
let mapleader="," "change leader

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

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
" Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
" Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree'
"Plug 'vim-vdebug/vdebug'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
"Plug 'roblillack/vim-bufferlist'
Plug 'kien/ctrlp.vim'
Plug 'davidhalter/jedi-vim'

" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
" Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()


map <leader>nt :NERDTreeToggle<CR>
map <leader>b :call BufferList()<CR>
set nofoldenable            " no folding damnit!
