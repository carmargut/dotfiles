set ttyfast
set showmode
set showcmd
set title
set number
set hidden

" This is what files look like
set ffs=unix,dos,mac

" Update find path to search subdirectories
set path=$PWD/**

" Set history/undo
set undolevels=1000


" Files to ignore
" Temp files
set wildignore+=*.swp,~*
" Archives
set wildignore+=*.zip,*.tar

set t_Co=256
colorscheme molokai

" Tab sanity
set expandtab
set tabstop=4
set shiftwidth=4

" Show hidden characters, tabs, trailing whitespace
set list
set listchars=tab:→\ ,trail:·,nbsp:·

" Remap escape
inoremap jk <Esc>
