"/.vimrc (Vi IMproved Version 7.3 (Aug. 2010)), created by copykatt [Do. 31. Jul. 2013]
" LAST modified by nmr [Mon. 10. Nov. 2014]

" Call Pathogen
call pathogen#infect()

"General Stuff
set nocompatible   "no vi defaults (some booleans need it disabled)
set number nuw=6   "lines and set horiz diff
set relativenumber
" Wrap and lbr
set wrap           "continue with text on next line (text > width) 
set lbr            "words are wrapped too
set tw=500         "break lines longer than maximum textwidth 
set sr sw=2
set ruler          "show line and column
set laststatus=2   "always show status line
set ttyfast        "vim behaves faster in certain terminals
set scrolloff=4    "show extra lines when scrolling up/down
set cursorline     "Show line where cursor is
set shortmess+=l
set smartindent 

set showcmd "show what youre typing as a command 
"Syntax highlighting
filetype on
filetype plugin on
"Colors and Fonts
syntax on  "Turn syntax h. on
set grepprg=grep\ -nH\ $*

set t_Co=256
""set t_Co=88
if (&t_Co == 256 || &t_Co == 88) && !has('gui_running') &&
  \ filereadable(expand("$HOME/.vim/plugin/guicolorscheme.vim"))
    " Use the guicolorscheme plugin to makes 256-color or 88-color
    "terminal use GUI colors rather than cterm colors.
    runtime! plugin/guicolorscheme.vim
    GuiColorScheme desert
end
"use 256 colors in console mode if we think the terminal supports it
"if &term =~? 'mlterm\|xterm'
"  set t_Co=256
"endif

colorscheme koehler
set background=dark

set encoding=utf8 
set ffs=unix,dos,mac "unix is standard filetype

"No Sound on Errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set nobackup
set nowb
set noswapfile

"Whitespace
set tabstop=2     "tab width is 2 lines 
set expandtab     "Spaces not tabs  
set backspace=indent,eol,start "backspace through everything when inserting

set autoindent

set mouse=a " use right-mouse with shift

"Deactivate PRESS ENTER OR TYPE COMMAND TO CONTINUE
"set shortmess=atI

"Status line
set laststatus=2 "show status line

"Functions
"show syntax highlightning groups for words under cursor
noremap <c-s-p> :call <SID>SynStack()<cr>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif 

"key mapping
let maplocalleader = "_" 
let mapleader = ","
nnoremap <leader>v : tabedit $MYVIMRC<cr>
nnoremap <leader>d dd
nnoremap <leader><space> viw
inoremap <leader><c-u> <esc> U i 
nnoremap <leader><c-u> U <esc>

"Abbreviations
