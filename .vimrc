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
Plugin 'ConradIrwin/vim-bracketed-paste'
Plugin 'w0rp/ale'

call vundle#end()
filetype plugin indent on

set encoding=utf-8

" colors & appearance
colorscheme gruvbox
set background=dark
set relativenumber
if has('gui_running')
	set guioptions=
end

" netrw
let g:netrw_banner=0
let g:netrw_winsize=25
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_list_hide='.*\.swp$'
let g:netrw_hide=1

" ale
let g:ale_fix_on_save=1
let g:ale_fixers = {
\	'python': [
\		'autopep8',
\		'black',
\	],
\}

" buffer-related keybindings
nnoremap <leader>n :bn<cr>
nnoremap <leader>N :bp<cr>
nnoremap <leader>d :bp\|bd #<cr>
nnoremap <leader>e :Lex<cr>
nnoremap <leader>l :ALENextWrap<cr>
nnoremap <leader>L :ALEPreviousWrap<cr>
