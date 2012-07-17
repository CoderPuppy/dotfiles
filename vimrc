" Vundle {
	set nocompatible
	filetype off
	
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
	
	" Bundles {
		Bundle 'gmarik/vundle'
		Bundle 'digitaltoad/vim-jade'
		Bundle 'tpope/vim-unimpaired'
		Bundle 'git://git.wincent.com/command-t.git'
	" }
	
	filetype plugin indent on
" }

let mapleader=','
set tabstop=4 " Tabs
set number " Show line numbers
set wrap linebreak nolist " Soft Wrap
set spell
colorscheme desert

if has('autocmd')
	autocmd BufNewFile,BufRead *.zsh-theme setfiletype zsh
	autocmd BufNewFile,BufRead .pryrc,.irbrc setfiletype ruby
	autocmd FileType zsh set syntax=zsh
	autocmd BufWritePost {.,_}vimrc source $MYVIMRC
	autocmd FileType zsh,javascript,bash,sh,coffeescript,java,ruby,python,perl,php set nowrap nolinebreak
endif

" Mappings {	
	" Bubbling
	nmap <C-Up> [e
	nmap <C-Down> ]e

	" Visual Bubbling
	vmap <C-Up> [egv
	vmap <C-Down> ]egv
" }

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
