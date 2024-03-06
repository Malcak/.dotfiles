" --------------------------------- Leader ------------------------------------
" Define space as the leading key
let g:mapleader = "\<space>"

" ------------------------------- Navigation ----------------------------------
" Remapping keyboard navigation with [ñ]
noremap ñ l
noremap l k
noremap k j
noremap j h

" ---------------------------------- Buffers ----------------------------------
" Save with <ctrl> + s
nnoremap <C-s> :w<CR>

" Move to the next buffer with <leader> + ñ
nnoremap <leader>ñ :bnext<CR>

" Move to previous buffer with <leader> + j
nnoremap <leader>j :bprevious<CR>

" Close current buffer with <leader> + q
nnoremap <leader>q :bdelete<CR>

" Clear highlight
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>


" --------------------------------- Splits ------------------------------------

" Open new splits easily
map vv <C-W>v
map ss <C-W>s
map qq  <C-W>q


" --------------------------------- Clipboard ---------------------------------
" Copy to clipboard with <leader> + and
" vnoremap <leader>y "+y
" nnoremap <leader>y "+y
"
" Cut to clipboard with <leader> + d
" vnoremap <leader>d "+d
" nnoremap <leader>d "+d
"
" Paste from clipboard with <leader> + p
" nnoremap <leader>p "+p
" vnoremap <leader>p "+p
" nnoremap <leader>P "+P
" vnoremap <leader>P "+P

" ------------------------------ OpenTerminal ---------------------------------
function! OpenTerminal()
  " move to right most buffer
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"
  execute "normal \<C-l>"

  let bufNum = bufnr("%")
  let bufType = getbufvar(bufNum, "&buftype", "not found")

  if bufType == "terminal"
    " close existing terminal
    execute "q"
  else
    " open terminal
    execute "vsp term://bash"

    " turn off numbers
    execute "set nonu"
    execute "set nornu"

    " toggle insert on enter/exit
    silent au BufLeave <buffer> stopinsert!
    silent au BufWinEnter,WinEnter <buffer> startinsert!

    " set maps inside terminal buffer
    execute "tnoremap <buffer> <C-h> <C-\\><C-n><C-w><C-h>"
    execute "tnoremap <buffer> <C-t> <C-\\><C-n>:q<CR>"
    execute "tnoremap <buffer> <C-\\><C-\\> <C-\\><C-n>"

    startinsert!
  endif
endfunction
nnoremap <C-t> :call OpenTerminal()<CR>

nnoremap <leader>e :e $MYVIMRC<CR>
