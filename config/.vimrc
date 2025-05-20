set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
call vundle#end()            " required
filetype plugin indent on    " required


let mapleader = ","
"colo desert
"colo slate
colo sorbet
syntax on
set backspace=indent,eol,start
set shiftwidth=2
set softtabstop=2
set et
set nu
set noswapfile
set cpo-=<
set formatoptions-=cro
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
set formatoptions-=cro " disables comment auto-fill, https://superuser.com/questions/271023/can-i-disable-continuation-of-comments-to-the-next-line-in-vim#:~:text=To%20permanently%20disable%20this%20behavior,vim%20.
nnoremap U :syntax sync fromstart<cr>:redraw!<cr> " https://vi.stackexchange.com/questions/2172/why-i-am-losing-syntax-highlighting-when-folding-code-within-a-script-tag
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0 " automatically load ycm config py file if its within pwd

"" Source the indent plugin if it exists
autocmd VimEnter * if filereadable(expand("~/.vim/plugin/indent_n.vim")) | source ~/.vim/plugin/indent_n.vim | endif
