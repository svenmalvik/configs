set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Command-T'
Plugin 'https://github.com/elzr/vim-json'
call vundle#end()            " required
filetype plugin indent on    " required

syntax on
"set autochdir

set rtp+=/Library/Python/2.7/site-packages/powerline/bindings/vim/
set laststatus=2
set t_Co=256
:nnoremap <space>, :CommandT<CR>
:nnoremap <space>. :CommandTBuffer<CR>
