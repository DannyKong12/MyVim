let g:airline_theme='one'
let g:airline#extensions#ale#enabled = 1
let g:vim_markdown_math = 1
let g:vim_markdown_strikethrough = 1

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

set sw=2
set expandtab
set tabstop=2
set softtabstop=2
set mouse=a
inoremap kj <Esc>

filetype plugin indent on
syntax on
runtime! config/**/*.vim
set omnifunc=syntaxcomplete#Complete

set t_Co=256
colorscheme one
set background=dark

set encoding=utf-8

autocmd vimenter * NERDTree | wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" julia
let g:default_julia_version = '1.0'

" language server
let g:LanguageClient_autoStart = 1
let g:LanguageClient_serverCommands = {
\   'julia': ['julia', '--startup-file=no', '--history-file=no', '-e', '
\       using LanguageServer;
\       using Pkg;
\       import StaticLint;
\       import SymbolServer;
\       env_path = dirname(Pkg.Types.Context().env.project_file);
\       debug = false;
\
\       server = LanguageServer.LanguageServerInstance(stdin, stdout, debug, env_path, "", Dict());
\       server.runlinter = true;
\       run(server);
\   ']
\ }

nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
