set nocompatible

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

syntax on

" Additional changes
if has("gui_running")
    set lines=55 columns=168 " USE IN GVIM ONLY
    else
    set guifont=Consolas:h11:cANSI " Sets font to Consolas
endif
if @% != 'makefile' || 'Makefile'
    set expandtab
    set softtabstop=4
    set tabstop=4
endif
set nu " Line Numbering
set rnu " Relative Numbering
set autoindent
set noerrorbells
set showmode
set colorcolumn=80
set ruler
set bg=dark " Foreground Color
colors torte
set cursorline " Highlights Cursor Line
set wildmenu " Visual Command Autocomplete
set lazyredraw " redraw only when needed
set hlsearch
set incsearch " Search as characters are entered
set cindent
set shiftwidth=4
set timeoutlen=100 ttimeoutlen=0
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
"set nowritebackup
set backupdir=~/vimtmp
"set nobackup
set noundofile

if has("autocmd")
  autocmd BufEnter * :lchdir %:p:h
endif

let c_comment_strings=1 "highlight strings inside C comments

nmap <s-down> <c-w>w
nmap <s-up> <c-w>W
nmap <s-left> <c-w>h
nmap <s-right> <c-w>l

 noremap <C-Esc> :close<CR>
inoremap <C-Esc> :close<CR>
noremap <S-j> jzz
noremap <S-k> kzz
" nnoremap <C-q> :wqall<CR>

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

"Everything under here are my personal shortcuts

inoremap { {<cr><bs>}<esc>ko
inoremap jk <esc>
nmap <CR> i<CR><bs><esc>
nmap <S-CR> i<CR><bs><esc>J
