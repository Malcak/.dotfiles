" ============================ Plugin Directory ===============================

call plug#begin('~/.local/share/nvim/plugged')

" ---------------------------------- IDE --------------------------------------
Plug 'editorconfig/editorconfig-vim'
Plug 'Yggdroot/indentLine'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" --------------------------------- Syntax ------------------------------------
" Plug 'sheerun/vim-polyglot'

" ------------------------------- Completion ----------------------------------
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" ---------------------------------- Tree -------------------------------------
Plug 'scrooloose/nerdtree'
" Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'kyazdani42/nvim-tree.lua'

" ------------------------------- Status bar ----------------------------------
Plug 'vim-airline/vim-airline'
" Plug 'itchyny/lightline.vim'
" Plug 'pacha/vem-tabline'

" --------------------------------- Themes ------------------------------------
" # Editor themes
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
" # Tree themes
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" # Status bar themes
" Plug 'shinchu/lightline-gruvbox.vim'
Plug 'vim-airline/vim-airline-themes'

call plug#end()
