" Owner: Grant Simmons
" This is an accumulation of the functions and settings I have written or found
" useful when using Vim as an all-purpose text editor.
" 
" Note: To properly use this vimrc, you must create the following directories
"    $HOME\vimtmp\backup//
"    $HOME\vimtmp\undo//
"    $HOME\vimtmp\swaps//
"   In linux, this can be done with the command:
"       mkdir ~/vimtmp && mkdir ~/vimtmp/backup ~/vimtmp/undo ~/vimtmp/swaps
"   This will be where your backup, undo, and swap files are stored
"
" A brief overview of some helpful shortcuts:
"   * Hit j and k in quick succession to escape from insert mode
"   * Ctrl-F will search for the word under your cursor in current dir/below
"       This will also open the quickfix menu where you can press enter on a
"       line to open the file in a new tab.
"   * Shift-F will highlight all instances of the word under cursor
"   * Hit , and h in quick succession to clear all highlights
"   * Use Ctrl-W and v or s to split the current tab, then move between the
"       splits with Shift-Up/Down/Left/Right
"   * Hit g and l in quick succession to go to the last active tab
"   * Use Ctrl-J/K to quickly scroll through a file a half-page at a time
"   * Use Ctrl-N in insert mode to autocomplete the current word
"   * Hit , and e in quick succession to open a file explorer
"   * hit gd to go to the local definition of a variable

if &t_Co > 2 || has("gui_running")
  syntax on
endif

if has("autocmd")
    autocmd BufNewFile,BufRead Makefile set noexpandtab " Makefiles ensure that we don't expand tabs since tabs are special

endif

"Vim behavior instead of Vi
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
"Remaps hotkeys that may conflict with Windows programs. Sometimes helpful to
"remove when on Linux
behave mswin

"set diffexpr=MyDiff()
"function MyDiff()
"  let opt = '-a --binary '
"  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
"  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
"  let arg1 = v:fname_in
"  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
"  let arg2 = v:fname_new
"  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
"  let arg3 = v:fname_out
"  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
"  if $VIMRUNTIME =~ ' '
"    if &sh =~ '\<cmd'
"      if empty(&shellxquote)
"        let l:shxq_sav = ''
"        set shellxquote&
"      endif
"      let cmd = '"' . $VIMRUNTIME . '\diff"'
"    else
"      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
"    endif
"  else
"    let cmd = $VIMRUNTIME . '\diff'
"  endif
"  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
"  if exists('l:shxq_sav')
"    let &shellxquote=l:shxq_sav
"  endif
"endfunction

"Plugin stuff
"execute pathogen#infect()
"syntax on
"filetype plugin on "c.Vim
"filetype plugin indent on

" Additional changes
set nu " Line Numbering
set nornu " Relative Numbering
set autoindent
set noerrorbells
set showmode
set ruler
set tabstop=4

if has("gui_running")
    set lines=55 columns=168 " USE IN GVIM ONLY    
endif

if has("gui_win32")
	set guifont=Consolas:h09:cANSI
	let $PATH.=';C:\Windows\Sysnative'
	set backupdir=$HOME\vimtmp\backup//
	set undodir=$HOME\vimtmp\undo//
	set directory=$HOME\vimtmp\swaps//
else
	set guifont=Consolas\ 11
	set backupdir=~/vimtmp/backup
	set undodir=~/vimtmp/undo
	set directory=~/vimtmp/swaps
endif

set bg=dark " Foreground Color
colors torte
set cursorline " Highlights Cursor Line
set colorcolumn=80

set wildmenu " Visual Command Autocomplete
set lazyredraw " ignore redraw during script/macro
set hlsearch
set incsearch " Search as characters are entered
set cindent
set expandtab
set shiftwidth=4
set softtabstop=4
set timeoutlen=120 ttimeoutlen=0
set autochdir
" Everything Underneath this line is from C.Vim
set cmdheight=2
set mousehide
set backspace=indent,eol,start
set backup
set browsedir=current
set history=50
set incsearch
set mouse=a
set nowrap
set showcmd
set wildignore=*.bak,*.o,*.e,*~
set ignorecase
set foldmethod=indent
set foldnestmax=3
set nofoldenable
"set spell "set for text files, spellchecking
set sidescrolloff=5
set switchbuf+=usetab,newtab
set mousefocus
set sidescroll=1

if has("autocmd")
    autocmd BufEnter * if &buftype !=# 'terminal' | :lchdir %:p:h | endif
endif

command Vterm :vert term
tnoremap jk <c-w><s-n>
tmap <s-down> <c-w>w
tmap <s-up> <c-w>W
tmap <s-left> <c-w>h
tmap <s-right> <c-w>l

if @% != 'makefile' || 'Makefile'
    set expandtab
    set softtabstop=4
    set tabstop=4
endif

let c_comment_strings=1 "highlight strings inside C comments

nmap <s-down> <c-w>w
nmap <s-up> <c-w>W
nmap <s-left> <c-w>h
nmap <s-right> <c-w>l

noremap <C-Esc> :close<CR>
inoremap <C-Esc> :close<CR>
" nnoremap <C-q> :wqall<CR>

"Colors
highlight Cursor guibg=#00dddd
highlight Cursor guifg=Grey25
highlight CursorLine guibg=Grey11 
highlight CursorLineNr guifg=Pink1
highlight CursorLineNr guibg=Grey11
highlight LineNr guifg=Grey95
highlight LineNr guibg=Grey11
highlight Normal guibg=Grey16
highlight EndofBuffer guifg=Gray50
highlight NonText guibg=Grey11

"Personal shortcuts

"Auto Brackets
inoremap <s-p>{ {<cr><bs>}<esc>ko
"jk for quick escape
inoremap jk <esc>
"Scrolling with cursor in middle
map <S-j> jz.
map <S-k> kz.
"Half-page scrolling
map <c-j> <c-d>
map <c-k> <c-u>
"Remap right-left movement while middle-scrolling to normal movement
nnoremap <S-h> h
nnoremap <S-l> l
"Multi-indent in visual mode
vnoremap < <gv
vnoremap > >gv
"nmap <s-f> *<s-n>
"nmap <s-f> /<c-r>=expand('<cword>')<CR><CR><s-n>
"Place word under cursor in search register
nmap <s-f> :let @/ = expand('<cword>')\|set hlsearch<C-M>
"Unmap windows mapping to inc/dec vim mappings
nunmap <C-a>

" lhs comments -- select a range then hit ,# to insert hash comments
" or ,/ for // comments, or ,c to clear comments.
map ,# :s/^/#/<CR> <Esc>:nohlsearch <CR>
map ,/ :s/^/\/\//<CR> <Esc>:nohlsearch <CR>
map ,c :s/^\/\/\\|^--\\|^> \\|^[#"%!;]//<CR> <Esc>:nohlsearch<CR>

" wrapping comments -- select a range then hit ,* to put  /* */ around
" selection, or ,d to clear them
map ,* :s/^\(.*\)$/\/\* \1 \*\//<CR> <Esc>:nohlsearch<CR>
nmap ,z va}<esc>h%
"map ,d :s/^\([/(]\*\\|<!--\) \(.*\) \(\*[/)]\\|-->\)$/\2/<CR> <Esc>:nohlsearch<CR>

" to clear hlsearch -- hit ,h to clear highlighting from last search
map ,h :nohlsearch <CR>
if has("gui_win32")
    map ,q :windo diffthis <CR>
    "Search current dir recursively for word under cursor, highlights verbatim
    nnoremap <c-f> *# :silent grep! /S <cword> %:p:h\*<CR> :copen<CR> :redr!<CR>
    "Search custom dir for word under cursor
    nnoremap ,f *# :silent grep! /S <c-r>=expand('<cword>')<CR> <c-r>=expand('%:p:h')<CR>\*
else "Unix, CLI
    nnoremap <c-f> *# :silent grep! -r <cword> %:p:h/*<CR> :copen<CR> :redr!<CR>
    nnoremap ,f *# :silent grep! -r <c-r>=expand('<cword>')<CR> <c-r>=expand('%:p:h')<CR>/*
endif
nnoremap <s-CR> :cn <CR>
"Join next line with current
map ,j :join<CR>
"Don't really know what this one was for
"nnoremap ,d *# :silent grep! /S "<c-r>=expand('<cword>')<CR>" %:p:h\*<CR> :copen<CR>
"Vertical file explorer on right side of screen
nmap ,e :Vexplore!<CR>

"Function to highlight all instances of word under cursor, follows cursor
"Toggle with Ctrl-H
let g:toggleHighlight = 1
function! ToggleHighlight(...)
  if a:0 == 1 "toggle behaviour
    let g:toggleHighlight = 1 - g:toggleHighlight
  endif

  if g:toggleHighlight == 0 "normal action, do the hi
    silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))
  else
    call clearmatches()
  endif
endfunction
"Toggling autos
autocmd CursorMoved * call ToggleHighlight()
map <c-h> :call ToggleHighlight(1)<CR>
"nnoremap * <silent> *N:let @/.='\C'<CR>n

"Open new file from quickfix list in new Gvim tab. If already open, switch to
"existing tab
if !exists('g:lasttab')
  let g:lasttab = 1
endif
nmap gl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
