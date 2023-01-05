function ComRun()      
	 let s:ftype = &ft
	 let s:comand = {
					 \'java':'javac '.expand('%e').' && java '.expand('%e'),
					 \'python': 'python3 '.expand('%e'), 
					 \'c': 'gcc '.expand('%e'). ' && ./a.out'
					 \}
	 if has_key(s:comand, s:ftype)
		  let s:comand_out = get(s:comand, s:ftype)
		  if len(term_list()) == 0
				below term++rows=10
		  endif
		  call term_sendkeys(term_list()[-1], s:comand_out ."\<cr>")
	 else
		  echo 'Extension not recognized'
	 endif
endfunction

command! RunCodeInTerminal call ComRun()
nnoremap <silent> <leader>c :RunCodeInTerminal <CR>
inoremap <silent> <leader>c :RunCodeInTerminal <CR>
