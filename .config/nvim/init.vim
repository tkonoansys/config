"" General settings {{{
set nocompatible
set backspace=start,eol,indent
set whichwrap=b,s
set mouse=

"" Language settings {{{
if has('multi_lang')
    set langmenu=en_US.UTF-8
    let $LANG="en"
endif
"" }}}

"" Encoding settings {{{
" Set the character encoding used inside vim.
set encoding=utf-8

" Set script encoding.
scriptencoding utf-8

" Set the character encoding for the file of this buffer.
set fileencoding=utf-8

if has('unix')
    set fileformat=unix
    set fileformats=unix,dos,mac
    set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp,latin
elseif has('win32') || ('win64')
    set fileformat=dos
    set fileformats=dos,unix,mac
    set fileencodings=iso-2022-jp,utf-8,euc-jp,cp932,latin
endif

" Treat East Asian Width class as ambiguous.
set ambiwidth=double
"" }}}

"" Terminal color settings {{{
if has('termguicolors') && $COLORTERM == 'truecolor'
    set termguicolors
endif
"" }}}

" Disable visual bells.
set noerrorbells
set novisualbell
set visualbell t_vb=
"" }}}

"" Search settings {{{
set ignorecase
set smartcase
set hlsearch
set incsearch
set wrapscan
set wildmenu wildmode=list:full
"" }}}

"" Tab settings {{{
" Tab width of file
set tabstop=4
set softtabstop=4

" Width of indent
set shiftwidth=4
set shiftround

" Insert spaces instead of tab
set expandtab
"set autoindent
"set smartindent

" Disable insert comment automatically.
autocmd FileType * set formatoptions-=r
autocmd FileType * set formatoptions-=o
"" }}}

"" Display settings {{{
" Show line number.
set number

" Show the line and column number of the cursor psition.
set ruler

" Set title of the window to the value of titlestring.
set notitle

" Line longer than the width of the window will wrap.
set wrap

" Show command in the last line of screen.
set showcmd

" Show current mode.
set showmode

" Show tabs as Ctrl-I.
"set list
"set listchars=tab:^\ ,trail:~
"" }}}

"" Statusline settings {{{
" Always shows status line.
set laststatus=2

" Where to truncate line if too long.
set statusline=%<

" Modified flag.
set statusline+=%m

" Full path to the file in the buffer.
set statusline+=%F

" Preview window flag.
set statusline+=%w

" Encoding.
set statusline+=\ [%{strlen(&fenc)?&fenc:&enc}:%{&ff}]

" Readonly flag.
set statusline+=%r

" Help buffer flag.
set statusline+=%h

" Separation point between left and right aligned items.
set statusline+=%=

" Filetype in buffer.
set statusline+=%y

" Line number and column number.
set statusline+=[%l/%LL]
"" }}}

"" Syntax settings {{{
" Set background scheme. Set this option before syntax highlighting.
set background=dark

" Enable syntax highlighting.
syntax enable

" If you want to overrule your syntax, use below instead.
syntax on

" Enable file type detection.
filetype on

" Color settings.
"colorscheme eighties
colorscheme monokai
"colorscheme gruvbox
"colorscheme solarized8_high
"" }}}

set clipboard+=unnamedplus

"" Split window {{{
" Keep all windows size as same when add/remove.
set equalalways
"" }}}
