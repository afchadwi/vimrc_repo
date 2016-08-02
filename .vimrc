" .vimrc configuration file
" Alex Chadwick
" afchadwi@umich.edu

set ttymouse=xterm2

set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'MattesGroeger/vim-bookmarks'
Plugin 'scrooloose/syntastic'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'LaTeX-Box-Team/LaTeX-Box'
Bundle 'majutsushi/tagbar'
Plugin 'tpope/vim-fugitive'
Plugin 'mbbill/undotree'
Plugin 'Shougo/unite.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'gregsexton/gitv'

" Colorschemes
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'nanotech/jellybeans.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'shaond/vim-guru'
Plugin 'NLKNguyen/papercolor-theme'
Plugin 'chriskempson/base16-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


filetype on
filetype indent on
filetype plugin on
let fortran_free_source=1
syntax on
set title
set ruler
set nowrap
set wrapmargin=0
set hidden
set tabstop=2
set backspace=indent,eol,start
set autoindent
set smartindent
set copyindent
set number
set shiftwidth=2
set shiftround
set showmatch
set ignorecase
set smartcase
set smarttab
set expandtab
set hlsearch
set incsearch
set tw=0

set lines=99
set columns=206

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell
set noerrorbells

set nobackup

let fortran_do_enddo=1

" Plugin config
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

"let g:nerdtree_tabs_open_on_console_startup = 1
"Toggle for NERDTree
map <F5> :NERDTreeToggle<CR>
"Toggle for Tagbar
nmap <F8> :TagbarToggle<CR>
"Toggles to cycle open buffers
map <F9> :bnext<CR>
map <F7> :bprevious<CR>
"Toggle for paste mode
set pastetoggle=<F2>
"Toggle for line numbers
nnoremap <F4> :set nonumber!<CR>
"Toggle for UndoTree
nnoremap <F6> :UndotreeToggle<CR>
"Toggle key to highlight lines past 132 characters
nnoremap <F3> :/\%>132v.\+<CR>
" Fix behavior of home key (go to bol, not first column, but go to first column if at bol)
"map <Home> ^
"imap <Home> <Esc>0I
function ExtendedHome()
	let column = col('.')
	normal! ^
	if column == col('.')
		normal! 0
	endif
endfunction
noremap <silent> <Home> :call ExtendedHome()<CR>
inoremap <silent> <Home> <C-O>:call ExtendedHome()<CR>


colorscheme molokai

" Enable mouse support
set mouse=a

set guifont=Monaco:h10

""""""""""""""""""""""""""""""
" airline
""""""""""""""""""""""""""""""
let g:airline_theme             = 'dark'
let g:airline_enable_branch     = 1
let g:airline_enable_syntastic  = 1


" Configure GitGutter
let g:gitgutter_max_signs=16000
