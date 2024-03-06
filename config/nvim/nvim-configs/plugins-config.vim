" ================================ Gruvbox ====================================

let g:gruvbox_contrast_dark = 'hard'
colorscheme gruvbox


" ================================ Onedark ====================================

" colorscheme onedark


" ================================ Onedark ====================================

" let g:material_theme_style = 'darker-community'
" colorscheme material


" ================================== ayu ======================================

" let ayucolor="dark"   " for dark version of theme
" colorscheme ayu


" ================================ Nerdtree ===================================

" Use arrows in directories
let NERDTreeDirArrows = 1
" Hide help text
let g:NERDTreeMinimalUI = 1
" Change current directory to current parent node
let g:NERDTreeChDirMode = 2
" Automatically delete the buffer of the file you just deleted with NerdTree
let g:NERDTreeAutoDeleteBuffer = 1
" Automatically close NerdTree when you open a buffer
let NERDTreeQuitOnOpen = 1
" Ignore node_modules folder
let g:NERDTreeIgnore = ['^node_modules$']
" Map the <leader> + n to open / close Nerdtree
nnoremap <leader>b :NERDTreeToggle<CR>
" Open NerdTree on the buffer you’re editing
nnoremap <silent> <Leader>B :NERDTreeFind<CR>
" Open a NerdTree if no file is given as CLI argument
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''


" ================================ NvimTree ===================================

" nnoremap <silent> <leader>n :LuaTreeToggle<CR>
" nnoremap <silent> <leader>N :LuaTreeFindFile<CR>

" let g:lua_tree_side = 'right'
" let g:lua_tree_show_icons = {'git': 1, 'icons': 0, 'folders': 1}
" let g:lua_tree_ignore = [
"       \ '.git', 'node_modules', '.cache', '\.pyc$', '__pycache__', 'tags', 
"       \ '.nox', '.pytest_cache',
"       \]
" let g:lua_tree_icons = {
"       \ 'default': '  ',
"       \ 'folder': {'default': 'TODO: icon', 'open': 'TODO: icon'},
"       \}
" let g:lua_tree_auto_open = 1
" let g:lua_tree_auto_close = 1
" let g:lua_tree_quit_on_open = 1
" let g:lua_tree_git_hl = 1

" highlight link LuaTreeSpecialFile Normal


" ============================== vem-tabline ==================================

" let g:vem_tabline_show = 2


" ================================ Airline ====================================

set noshowmode
" Show open buffers (as tabs)
let g:airline#extensions#tabline#enabled = 1
" Show only file name
let g:airline#extensions#tabline#fnamemod = ':t'
" Load Powerline font and symbols
let g:airline_powerline_fonts = 1
" Set Airline theme
let g:airline_theme='gruvbox'
" Set separators
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
" Remove file encoding section
let g:airline_section_y = ''



" ================================ Lightline ====================================

" set noshowmode
" let g:lightline = {'colorscheme': 'gruvbox'}
" let g:lightline.enable = {'tabline': 0}
" let g:lightline.separator = {'left': '', 'right': ''}
" let g:lightline.component_function = {'gitbranch': 'FugitiveHead'}
" let g:lightline.active = {}
" let g:lightline.active.left = [
"       \ ['mode', 'paste'],
"       \ ['gitbranch', 'readonly', 'filename', 'modified'],
"       \]
" let g:lightline.active.right = [
"       \ ['lineinfo'], ['percent'], ['filetype'],
"       \]


" ================================== fzf ======================================

let g:fzf_command_prefix = 'Fz'
let g:fzf_commands_expect = 'alt-enter'
let g:fzf_history_dir = '~/.local/share/fzf-history'

noremap <leader>ff :FzFiles<CR>
noremap <leader>fo :FzBuffers<CR>
noremap <leader>fl :FzBLines<CR>
noremap <leader>fs :FzGFiles?<CR>
noremap <leader>fg :FzGBranches<CR>

" =============================== IndentLine ==================================

let g:indentLine_fileTypeExclude = [
      \ 'text', 'man', 'rst', 'vader', 'help',
      \ 'markdown', 'startify', 'tsplayground',
      \]
let g:indentLine_bufNameExclude = ['NERD_tree.*', 'term:.*']
let g:indentLine_char = '|'


" ================================ CloseTag ===================================

let g:closetag_filenames = '*.html,*.xhtml,*.tmpl,*.md'


" ======================== Conquer of completation ============================

" " Use tab for trigger completion with characters ahead and navigate
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" " Use <c-space> to trigger completion
" if has('nvim')
"     inoremap <silent><expr> <c-space> coc#refresh()
"   else
"     inoremap <silent><expr> <c-@> coc#refresh()
" endif

" Make <CR> auto-select the first completion item and notify coc.nvim to format on enter
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                               \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" " GoTo code navigation.
" nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
" nnoremap <silent> K :call <SID>show_documentation()<CR>

" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

" set :Prettier command for format buffers
" command! -nargs=0 Prettier :CocCommand prettier.formatFile

" " Remap for rename current word
" nmap <F2> <Plug>(coc-rename)

" " Simulating multiple cursors
" nmap <expr> <silent> <C-d> <SID>select_current_word()
" function! s:select_current_word()
"   if !get(g:, 'coc_cursors_activated', 0)
"     return "\<Plug>(coc-cursors-word)"
"   endif
"   return "*\<Plug>(coc-cursors-word):nohlsearch\<CR>"
" endfunc

" " Use <leader> + x for convert visual selected code to snippet
" xmap <leader>x  <Plug>(coc-convert-snippet)"
