let mapleader=" "
set nocompatible
filetype off

set tabstop=4
set shiftwidth=4

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'Townk/vim-autoclose'
Plugin 'tpope/vim-surround'
Plugin 'ap/vim-buftabline'
Plugin 'morhetz/gruvbox'
Plugin 'vimwiki/vimwiki'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-pencil'

call vundle#end()
filetype plugin indent on

set encoding=utf-8

" colors & appearance
colorscheme gruvbox
set background=dark
set number


" netrw
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_list_hide='.*\.swp$'
let g:netrw_hide=1

" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" limelight
let g:limelight_conceal_ctermfg=245

" goyo
function! s:goyo_enter()
	let b:quitting = 0
	let b:quitting_bang = 0
	autocmd QuitPre <buffer> let b:quitting = 1
	cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
	if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
		if b:quitting_bang
			qa!
		else
			qa
		endif
	endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()

" word processing
augroup markdown
	autocmd!
	autocmd Filetype markdown,mkd call SetUpMk()
augroup END

function! SetUpMk()
	setlocal spell spelllang=en_us
	SoftPencil
endfunction

function! ProseMode()
	setlocal spell spelllang=en_us
	SoftPencil
	Goyo
endfunction

nnoremap <leader>wp :call ProseMode()<cr>
nnoremap <leader>ll :Limelight!!<cr>