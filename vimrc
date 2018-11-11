let g:airline_theme='one'
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

set nocompatible
" Initialisation de pathogen
call pathogen#infect()
call pathogen#helptags()

set number

set bs=2

set expandtab
set tabstop=2
set softtabstop=2

filetype plugin indent on
syntax on
runtime! config/**/*.vim

set t_Co=256
colorscheme one
set background=dark

set encoding=utf-8

autocmd vimenter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
