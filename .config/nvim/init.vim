:set number " show line number
" set keybindings
	" esc	
	nnoremap <C-S> :update<cr>
	nnoremap <C-Q> :quit<cr>
	nnoremap <C-Z> :undo<cr>
	nnoremap <C-Y> :redo<cr>

	" insert
	inoremap <C-S> <Esc>:update<cr>gi
	inoremap <C-Q> <Esc>:quit<cr>gi
	inoremap <C-Z> <Esc>:undo<cr>gi
	inoremap <C-Y> <Esc>:redo<cr>gi
	inoremap <C-V> <C-O>"+P

	vnoremap <C-C> "+y
	vnoremap <C-X> "+x

highlight Normal guibg=none
highlight NonText guibg=none
highlight Normal ctermbg=none
highlight NonText ctermbg=none
