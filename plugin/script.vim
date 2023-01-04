let s:ftype = &ft
let s:comand = {
				\'java':'javac '.expand('%e').' & java '.expand('%e'),
				\'python': 'python3 '.expand('%e'), 
				\'c': 'gcc '.expand('%e'). ' && ./a.out:'
				\}
function ComRun(ftype, comand)      
	 if has_key(s:comand, s:ftype)
		  let s:comand_out = get(s:comand, s:ftype)
		  echo s:comand_out
		  below term++rows=10
		  call term_sendkeys(term_list()[0], s:comand_out ."\<cr>")
	 else
		  echo 'Extension not recognized'

	 endif
command! RunCodeInTerminal call comRun()
nnoremap <silent> <leader>t :RunCodeInTerminal <CR>
inoremap <silent> <leader>t :RunCodeInTerminal <CR>
