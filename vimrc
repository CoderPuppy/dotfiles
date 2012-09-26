" Vundle {
	set nocompatible
	filetype off
	
	set rtp+=~/.vim/bundle/vundle/
	call vundle#rc()
	
	" Bundles {
		Bundle 'gmarik/vundle'
		Bundle 'digitaltoad/vim-jade'
		Bundle 'kchmck/vim-coffee-script'
		Bundle 'tpope/vim-unimpaired'
		Bundle 'tpope/vim-fugitive'
		Bundle 'Lokaltog/vim-powerline'
		Bundle 'scrooloose/nerdtree'
		Bundle 'sjbach/lusty'
		Bundle 'git://git.wincent.com/command-t.git'
	" }
	
	filetype plugin indent on
" }

let mapleader=','
set tabstop=4 shiftwidth=4 " Tabs
set number " Show line numbers
set wrap linebreak nolist " Soft Wrap
set spell
set hidden
colorscheme desert

if has('autocmd')
	autocmd BufNewFile,BufRead *.zsh-theme setfiletype zsh
	autocmd BufNewFile,BufRead .pryrc,.irbrc setfiletype ruby
	autocmd FileType zsh set syntax=zsh
	" autocmd BufWritePost {.,_}vimrc source $MYVIMRC
	autocmd FileType zsh,javascript,bash,sh,coffeescript,java,ruby,python,perl,php set nowrap nolinebreak
	autocmd VimEnter * NERDTree | wincmd l
	autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
endif

" Mappings {	
	" Bubbling
	nmap <C-Up> [e
	nmap <C-Down> ]e

	" Visual Bubbling
	vmap <C-Up> [egv
	vmap <C-Down> ]egv

	" NERDTree
	nmap <silent> <leader>n :NERDTreeToggle<cr>

	nmap <silent> <A-Up> :wincmd k<CR>
	nmap <silent> <A-Down> :wincmd j<CR>
	nmap <silent> <A-Left> :wincmd h<CR>
	nmap <silent> <A-Right> :wincmd l<CR>
" }

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

if &term =~ '^screen'
	" tmux will send xterm-style keys when its xterm-keys option is on
	execute "set <xUp>=\e[1;*A"
	execute "set <xDown>=\e[1;*B"
	execute "set <xRight>=\e[1;*C"
	execute "set <xLeft>=\e[1;*D"
endif
