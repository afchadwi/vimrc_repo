" --------------------
" .vimrc configuration file
" optimized for vim 8.x, i.e. using native plugin handling instead of Vundle
" Alex Chadwick
" afchadwi@umich.edu

set ttymouse=xterm2

set nocompatible

" --------------------
"  The following plugins should be installed in order for this .vimrc to work
"  correctly...
"  -> vim-airline/vim-airline
"  -> vim-airline/vim-airline-themes
"  -> majutsushi/tagbar
"  -> mbbill/undotree
"  -> airblad/vim-gitgutter
"  -> gregsexton/gitv
"  -> tpope/vim-fugitive

" --------------------
"  Basic configurations
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
set noswapfile
set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell
set noerrorbells
set nobackup

let fortran_do_enddo=1

" --------------------
"  Graphics configuration
" Speed up vim graphics a bit
set lazyredraw
set ttyfast

" Disable background colors
if &term =~ '256color'
  set t_ut=
endif

" --------------------
"  GUI settings
set guioptions=
set guifont=Fira\ Mono\ Medium\ for\ Powerline:h12

" --------------------
"  Color scheme settings
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" --------------------
" Enable mouse support
set mouse+=a
if &term =~ '^screen'
  " tmux knows the extended mouse mode
  set ttymouse=xterm2
endif

" --------------------
"  Define settings for "smart" home key function. Goes to bol on first press,
"  otherwise it goes to the first column
function ExtendedHome()
	let column = col('.')
	normal! ^
	if column == col('.')
		normal! 0
	endif
endfunction
noremap <silent> <Home> :call ExtendedHome()<CR>
inoremap <silent> <Home> <C-O>:call ExtendedHome()<CR>

" --------------------
"  Configuratioin for netrw

" Toggle for netrw as a vertical split
map <F5> :Lexplore<CR>

" Disable the netrw banner
let g:netrw_banner=0
" Open new buffers in previous window
let g:netrw_browse_split=4
" Set the column width
let g:netrw_winsize=20
" List style
let g:netrw_liststyle=3
" Other settings
let g:netrw_altv=1

" --------------------
"  Configure keys for convenience toggles

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

"Toggle key to clear all highlighting and the search pattern
nnoremap <M-F3> :let @/ = ""<CR>

" --------------------
" Airline configuration
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
let g:airline_theme             = 'gruvbox'
let g:airline_enable_branch     = 1

" --------------------
" Configure GitGutter
let g:gitgutter_max_signs=16000

" --------------------
"  Setup to have vimrc automatically reload on changes
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END
