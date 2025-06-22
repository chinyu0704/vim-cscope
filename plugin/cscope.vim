function! QuickfixGoto()
    let entry = input('Enter quickfix entry number: ')
    execute 'cc ' . entry
endfunction




if has("cscope")
	set nocsverb
        " Look for a 'cscope.out' file starting from the current directory,
        " going up to the root directory.
        let s:dirs = split(getcwd(), "/")
        while s:dirs != []
                let s:path = "/" . join(s:dirs, "/")
                if (filereadable(s:path . "/cscope.out"))
                        execute "cs add " . s:path . "/cscope.out " . s:path . " -v"
                        break
                endif
                let s:dirs = s:dirs[:-2]
        endwhile

        set csto=0  " Use cscope first, then ctags
	set cst     " Only search cscope
        set csverb  " Make cs verbose

	nnoremap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-\>c :cs find c <C-R>=expand("<cword>")<CR>
	nnoremap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-\>i :cs find i <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-\>d :cs find d <C-R>=expand("<cword>")<CR>
	nnoremap <C-\>a :cs find a <C-R>=expand("<cword>")<CR><CR>

	nnoremap <C-]>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-]>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-]>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-]>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-]>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-]>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-]>i :vert scs find i <C-R>=expand("<cfile>")<CR><CR>
	nnoremap <C-]>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
	nnoremap <C-]>a :vert scs find a <C-R>=expand("<cword>")<CR><CR>

	nmap <C-\><C-\>g :cs f g  " intentional left space
	nmap <C-\><C-\>s :cs f s 
	nmap <C-\><C-\>d :cs f d 
	nmap <C-\><C-\>c :cs f c 
	nmap <C-\><C-\>a :cs f a 
	nmap <C-p> :cprev<CR>
	nmap <C-n> :cnext<CR>
	nmap <C-\><C-j> :cbel<CR>
	nmap <C-\><C-k> :cabo<CR>
	nmap <C-\><C-h> :cr<CR>
	nmap <C-\><C-l> :cla<CR>
	nmap <C-l> :cl<CR>
	nnoremap <C-h> :call QuickfixGoto()<CR>

        " Open a quickfix window for the following queries.
        set cscopequickfix=s-,c-,d-,i-,t-,e-,g-,a-
endif
