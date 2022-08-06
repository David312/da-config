" NERDTree config

nnoremap <F2> :NERDTreeToggle<CR>
nnoremap <F3> :NERDTreeFocus<CR>
nnoremap <F4> :NERDTreeFind<CR>

" Close NERDTree when a file is opened
let NERDTreeQuitOnOpen = 1

" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close NERDTree automatically when it is the last opened buffer
" autocmd bufenter * if (winnr(“$”) == 1 && exists(“b:NERDTreeType”) && b:NERDTreeType == “primary”) | q | endif

" Close buffer of a opened deleted file from NERDTree automatically
let NERDTreeAutoDeleteBuffer = 1
