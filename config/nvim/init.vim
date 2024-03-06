"                _                               _____
"    ____ _   __(_)___ ___     _________  ____  / __(_)___ ______
"   / __ \ | / / / __ `__ \   / ___/ __ \/ __ \/ /_/ / __ `/ ___/
"  / / / / |/ / / / / / / /  / /__/ /_/ / / / / __/ / /_/ (__  )
" /_/ /_/|___/_/_/ /_/ /_/   \___/\____/_/ /_/_/ /_/\__, /____/
"                                                  /____/
"
"
" ============================= General Config ================================

" Unicode support
set encoding=utf-8

" Use Vim settings, rather then Vi settings
set nocompatible

" Fixes common backspace problems
set backspace=indent,eol,start

" Allows mouse integration
set mouse=a

" No sounds
set visualbell

" Enable true colors
set termguicolors

" Displays the file name in the terminal window
set title

" Buffers can exist in the background without being in a window
set hidden
" Reload files changed outside vim
set autoread


" ================================= Editor ====================================

" Show relative line numbers
set nu rnu
" Line number width
set numberwidth=1

" Highlight the current line
set cursorline

" Max line length column
set colorcolumn=80

" Turn on syntax highlighting
syntax on

" ----------------------------------- Wrap ------------------------------------
"Don't wrap lines
set nowrap
"Wrap lines at convenient points
set linebreak


" -------------------------------- Indentation --------------------------------
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab

" ================================= Search ====================================

" Highlight matches
set hlsearch
" Incremental searching
set incsearch
" Searches are case insensitive...
set ignorecase
" ... Unless they contain at least one capital letter
set smartcase 


" ====================== Turn Off Swap Files & backups ========================

set noswapfile
set nobackup
set nowb


" ============================= Command window ================================

" Height to 2 lines
set cmdheight=2

" Don't give ins-completion-menu messages
set shortmess+=c

" Many milliseconds nothing is typed the swap file will be written to disk
set updatetime=750


" ================================= splits ====================================

" Open splits on the right and below
set splitbelow
set splitright

" VertSplit character
:set fillchars+=vert:\█


" ================================ Keymaps ====================================

so ~/.config/nvim/nvim-configs/maps.vim


" ============================== Python hosts =================================

so ~/.config/nvim/nvim-configs/providers.vim


" ================================ Plugins ====================================

so ~/.config/nvim/nvim-configs/plugins.vim


" ============================= Plugins config ================================

so ~/.config/nvim/nvim-configs/plugins-config.vim
