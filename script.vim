let s:comand = {
					 'java': }'javac '.expand('%e').' && java '.expand('%e'),
					 'python': 'python3 '.expand('%e'),
					 'c': 'gcc '.expand('%e'). ' && ./a.out'
					 }

if &ft == 'java'
	 let s:comand = 
elseif &ft == 'python'
	 let s:comand = 
endif
below term++rows=10
call term_sendkeys(term_list()[0], s:comand ."\<cr>")

