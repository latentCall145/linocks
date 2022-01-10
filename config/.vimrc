set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
call vundle#end()            " required
filetype plugin indent on    " required

colo desert
syntax on
set backspace=indent,eol,start
set shiftwidth=2
set softtabstop=2
set et
set nu
set noswapfile
set cpo-=<
set mouse=r
nnoremap <space> za
nnoremap z<space> zA
noremap ,p "0p
noremap ,P "0P
vnoremap <C-c> "+y
imap jj <Esc>
set foldmethod=indent
nmap ; :
nmap <C-q> "+p
set tabpagemax=100
